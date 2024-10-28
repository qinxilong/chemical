package com.ruoyi.chemical.service.impl;

import com.ruoyi.chemical.domain.*;
import com.ruoyi.chemical.service.*;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Function;

/**
 * 实验数据Service业务层处理
 *
 * @author xy
 * @date 2024-10-24
 */
@Service
public class ChemicalResultServiceImpl  implements IChemicalResultService {

    @Autowired
    private IChemicalResultAccessService chemicalResultAccessService;

    @Autowired
    private IChemicalResultTxtService chemicalResultTxtService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IChemicalResultTxtAvgService chemicalResultTxtAvgService;

    @Autowired
    private IChemicalResultAccessAvgService chemicalResultAccessAvgService;

    @Autowired
    private IChemicalResultPushRecordService chemicalResultPushRecordService;

    @Override
    public Boolean save(ChemicalResult chemicalResult) {
        //解析数据
        if ("txt".equalsIgnoreCase(chemicalResult.getType())) {
            ChemicalResultTxt txtResult = chemicalTxtResult(chemicalResult);
            return saveTxtResult(txtResult);
        } else {
            ChemicalResultAccess accessResult = chemicalAccessResult(chemicalResult);
            return saveAccessResult(accessResult);
        }
    }

    /**
     * 保存Access数据
     *
     * @param ChemicalResultAccess
     */
    private Boolean saveAccessResult(ChemicalResultAccess ChemicalResultAccess) {
        ChemicalResultAccess.setCreateTime(new Date());
       return chemicalResultAccessService.save(ChemicalResultAccess);
    }

    /**
     * 保存Txt数据
     *
     * @param chemicalResultTxt
     */
    private Boolean saveTxtResult(ChemicalResultTxt chemicalResultTxt) {
        chemicalResultTxt.setCreateTime(new Date());
       return chemicalResultTxtService.save(chemicalResultTxt);
    }

    @Override
    public int pushAccessResult(List<ChemicalResult> pushAccessResult) {
        return 0;
    }

    @Override
    public int pushTxtResult(List<ChemicalResult> pushAccessResult) {
        return 0;
    }

    @Override
    public int pushChemicalResult(ChemicalResultPushRequest chemicalResultPushRequest) {
        String laboratoryName = chemicalResultPushRequest.getLaboratoryName();
        String sample = chemicalResultPushRequest.getSample();
        String type = chemicalResultPushRequest.getType();
        String pushUserId = chemicalResultPushRequest.getPushUserId();
        List<String> receiveUserIdList= chemicalResultPushRequest.getReceiveUserIdList();
        List<String> orginIdList= chemicalResultPushRequest.getOrginIdList();

        List<ChemicalResultTxt> chemicalResultTxtList = new ArrayList<>();
        List<ChemicalResultAccess> chemicalResultAccessList = new ArrayList<>();

        List<ChemicalResultPushRecord> pushRecordList = new ArrayList<>();

        if("txt".equalsIgnoreCase(type)){//txt类型数据
            //获取原始数据
            orginIdList.stream().forEach(orginId ->{
                ChemicalResultTxt chemicalResultTxt = chemicalResultTxtService.getById(orginId);
                chemicalResultTxtList.add(chemicalResultTxt);
              }
            );
            //计算平均数据
            ChemicalResultTxtAvg  txtAvg = getChemicalResultTxtAvg(chemicalResultTxtList);

            //每个用户发一次平均数据
            receiveUserIdList.stream().forEach(receiveUserId ->{
                  ChemicalResultPushRecord pushRecord = new ChemicalResultPushRecord(chemicalResultPushRequest);
                  txtAvg.setUserId(receiveUserId);
                  String txtAvgId = saveChemicalResultTxtAvg(txtAvg);//保存到ChemicalResultTxtAvg
                  txtAvg.setId(0L);
                  pushRecord.setTargetId(txtAvgId);
                  pushRecord.setReceiveUserId(receiveUserId);
                  chemicalResultPushRecordService.save(pushRecord);//发放记录
               }
            );
        }else{//access类型数据
            //获取原始数据
            orginIdList.forEach(orginId ->{
                        ChemicalResultAccess chemicalResultAccess = chemicalResultAccessService.getById(orginId);
                        chemicalResultAccessList.add(chemicalResultAccess);
                    }
            );
            //计算平均数据
            ChemicalResultAccessAvg  accessAvg = getChemicalResultAccessAvg(chemicalResultAccessList);
            //每个用户发一次平均数据
            receiveUserIdList.forEach(receiveUserId ->{
                        ChemicalResultPushRecord pushRecord = new ChemicalResultPushRecord(chemicalResultPushRequest);
                        accessAvg.setUserId(receiveUserId);
                        String txtAvgId = saveChemicalResultAccessAvg(accessAvg);//保存到ChemicalResultTxtAvg
                        accessAvg.setId(0L);
                        pushRecord.setTargetId(txtAvgId);
                        pushRecord.setReceiveUserId(receiveUserId);
                        chemicalResultPushRecordService.save(pushRecord);//发放记录
                    }
            );
        }
        return 0;
    }

    private String saveChemicalResultAccessAvg(ChemicalResultAccessAvg accessAvg) {
        chemicalResultAccessAvgService.save(accessAvg);
        return  String.valueOf(accessAvg.getId());
    }

    private ChemicalResultAccessAvg getChemicalResultAccessAvg(List<ChemicalResultAccess> chemicalResultAccessList) {
        ChemicalResultAccessAvg chemicalResultAccessAvg = new ChemicalResultAccessAvg();
        if(!chemicalResultAccessList.isEmpty()){
            chemicalResultAccessAvg = new ChemicalResultAccessAvg(chemicalResultAccessList.get(0));
        }else {
            return chemicalResultAccessAvg;
        }
        // 计算平均值的函数
        BiFunction<List<ChemicalResultAccess>, Function<ChemicalResultAccess, String>, Double> calculateAverage = (list, getter) ->
                list.stream()
                        .map(getter)
                        .filter(value -> !value.equals("-"))
                        .mapToDouble(Double::parseDouble)
                        .average()
                        .orElse(0);

        // 使用函数计算各个元素的平均值
        double avgMad = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getMad);
        double avgAad = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getAad);
        double avgAd = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getAd);
        double avgVad = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getVad);
        double avgVd = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getVd);
        double avgVdaf = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getVdaf);
        double avgFcad = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getFcad);
        double avgSad = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getSad);
        double avgH2o = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getH2o);
        double avgQd = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getQd);
        double avgQn = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getQn);
        double avgZn = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getZn);
        double avgTFe = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getTfe);
        double avgC = calculateAverage.apply(chemicalResultAccessList, ChemicalResultAccess::getC);
        // 输出结果
        System.out.println("Average avgMad: " + avgMad);
        chemicalResultAccessAvg.setMad(String.valueOf(avgMad));
        System.out.println("Average avgAad: " + avgAad);
        chemicalResultAccessAvg.setAad(String.valueOf(avgAad));
        System.out.println("Average avgAd: " + avgAd);
        chemicalResultAccessAvg.setAd(String.valueOf(avgAd));
        System.out.println("Average avgVad: " + avgVad);
        chemicalResultAccessAvg.setVad(String.valueOf(avgVad));
        System.out.println("Average avgVd: " + avgVd);
        chemicalResultAccessAvg.setVd(String.valueOf(avgVd));
        System.out.println("Average avgVdaf: " + avgVdaf);
        chemicalResultAccessAvg.setVdaf(String.valueOf(avgVdaf));
        System.out.println("Average avgFcad: " + avgFcad);
        chemicalResultAccessAvg.setFcad(String.valueOf(avgFcad));
        System.out.println("Average avgSad: " + avgSad);
        chemicalResultAccessAvg.setSad(String.valueOf(avgSad));
        System.out.println("Average avgH2o: " + avgH2o);
        chemicalResultAccessAvg.setH2o(String.valueOf(avgH2o));
        System.out.println("Average avgQd: " + avgQd);
        chemicalResultAccessAvg.setQd(String.valueOf(avgQd));
        System.out.println("Average avgQn: " + avgQn);
        chemicalResultAccessAvg.setQn(String.valueOf(avgQn));
        System.out.println("Average Zn: " + avgZn);
        chemicalResultAccessAvg.setZn(String.valueOf(avgZn));
        System.out.println("Average avgTFe: " + avgTFe);
        chemicalResultAccessAvg.setTfe(String.valueOf(avgTFe));
        System.out.println("Average avgC: " + avgC);
        chemicalResultAccessAvg.setC(String.valueOf(avgC));
        return chemicalResultAccessAvg;
    }

    private String  saveChemicalResultTxtAvg(ChemicalResultTxtAvg txtAvg) {
//        return String.valueOf((int) (Math.random() * 101));
         chemicalResultTxtAvgService.save(txtAvg);
         return String.valueOf(txtAvg.getId());
    }

    private ChemicalResultTxtAvg getChemicalResultTxtAvg(List<ChemicalResultTxt> results) {
        ChemicalResultTxtAvg chemicalResultTxtAvg = new ChemicalResultTxtAvg();
        if(!results.isEmpty()){
            chemicalResultTxtAvg = new ChemicalResultTxtAvg(results.get(0));
        }else {
            return chemicalResultTxtAvg;
        }
        // 计算平均值的函数
        BiFunction<List<ChemicalResultTxt>, Function<ChemicalResultTxt, String>, Double> calculateAverage = (list, getter) ->
                list.stream()
                        .map(getter)
                        .filter(value -> !value.equals("-"))
                        .mapToDouble(Double::parseDouble)
                        .average()
                        .orElse(0);

        // 使用函数计算各个元素的平均值
        double avgTFe = calculateAverage.apply(results, ChemicalResultTxt::getTfe);
        double avgSiO2 = calculateAverage.apply(results, ChemicalResultTxt::getSio2);
        double avgCaO = calculateAverage.apply(results, ChemicalResultTxt::getCao);
        double avgMgO = calculateAverage.apply(results, ChemicalResultTxt::getMgo);
        double avgA12O3 = calculateAverage.apply(results, ChemicalResultTxt::getA12o3);
        double avgP = calculateAverage.apply(results, ChemicalResultTxt::getP);
        double avgS = calculateAverage.apply(results, ChemicalResultTxt::getS);
        double avgTiO2 = calculateAverage.apply(results, ChemicalResultTxt::getTio2);
        double avgV2O5 = calculateAverage.apply(results, ChemicalResultTxt::getV2o5);
        double avgMnO = calculateAverage.apply(results, ChemicalResultTxt::getMno);
        double avgCr = calculateAverage.apply(results, ChemicalResultTxt::getCr);
        double avgZn = calculateAverage.apply(results, ChemicalResultTxt::getZn);
        double avgCu = calculateAverage.apply(results, ChemicalResultTxt::getCu);
        double avgNi = calculateAverage.apply(results, ChemicalResultTxt::getNi);
        double avgPb = calculateAverage.apply(results, ChemicalResultTxt::getPb);
        double avgAs = calculateAverage.apply(results, ChemicalResultTxt::getAS);
        double avgFeo = calculateAverage.apply(results, ChemicalResultTxt::getFeo);
        double avgH2O = calculateAverage.apply(results, ChemicalResultTxt::getH2o);

        // 输出结果
        System.out.println("Average TFe: " + avgTFe);
        chemicalResultTxtAvg.setTfe(String.valueOf(avgTFe));
        System.out.println("Average SiO2: " + avgSiO2);
        chemicalResultTxtAvg.setSio2(String.valueOf(avgSiO2));
        System.out.println("Average CaO: " + avgCaO);
        chemicalResultTxtAvg.setCao(String.valueOf(avgCaO));
        System.out.println("Average MgO: " + avgMgO);
        chemicalResultTxtAvg.setMgo(String.valueOf(avgMgO));
        System.out.println("Average A12O3: " + avgA12O3);
        chemicalResultTxtAvg.setA12o3(String.valueOf(avgA12O3));
        System.out.println("Average P: " + avgP);
        chemicalResultTxtAvg.setP(String.valueOf(avgP));
        System.out.println("Average S: " + avgS);
        chemicalResultTxtAvg.setS(String.valueOf(avgS));
        System.out.println("Average TiO2: " + avgTiO2);
        chemicalResultTxtAvg.setTio2(String.valueOf(avgTiO2));
        System.out.println("Average V2O5: " + avgV2O5);
        chemicalResultTxtAvg.setV2o5(String.valueOf(avgV2O5));
        System.out.println("Average MnO: " + avgMnO);
        chemicalResultTxtAvg.setMno(String.valueOf(avgMnO));
        System.out.println("Average Cr: " + avgCr);
        chemicalResultTxtAvg.setCr(String.valueOf(avgCr));
        System.out.println("Average Zn: " + avgZn);
        chemicalResultTxtAvg.setZn(String.valueOf(avgZn));
        System.out.println("Average Cu: " + avgCu);
        chemicalResultTxtAvg.setCu(String.valueOf(avgCu));
        System.out.println("Average Ni: " + avgNi);
        chemicalResultTxtAvg.setNi(String.valueOf(avgNi));
        System.out.println("Average Pb: " + avgPb);
        chemicalResultTxtAvg.setPb(String.valueOf(avgPb));
        System.out.println("Average As: " + avgAs);
        chemicalResultTxtAvg.setAS(String.valueOf(avgAs));
        System.out.println("Average Feo: " + avgFeo);
        chemicalResultTxtAvg.setFeo(String.valueOf(avgFeo));
        System.out.println("Average H2O: " + avgH2O);
        chemicalResultTxtAvg.setH2o(String.valueOf(avgH2O));

        return chemicalResultTxtAvg;
    }

    private ChemicalResultAccess chemicalAccessResult(ChemicalResult chemicalResult) {
        System.out.println(chemicalResult.getChemicalData());
        return new ChemicalResultAccess();
    }

    private ChemicalResultTxt chemicalTxtResult(ChemicalResult chemicalResult) {
        System.out.println(chemicalResult.getChemicalData());
        String data = chemicalResult.getChemicalData();

        ChemicalResultTxt result = parseChemicalResult(data);
        System.out.println(result);

        return result;
    }


    public static ChemicalResultTxt parseChemicalResult(String data) {
        ChemicalResultTxt resultTxt = new ChemicalResultTxt();
        String[] lines = data.trim().split("\\\\n");
        for (String line : lines) {
            if (line.startsWith("Sample:")) {
                resultTxt.setSample(line.split(": ")[1].trim());
            } else if (line.startsWith("Operator:")) {
                resultTxt.setOperator(line.split(": ")[1].trim());
            } else if (line.startsWith("Comment:")) {
                resultTxt.setComment(line.split(": ")[1].trim());
            } else if (line.startsWith("Group :")) {
                resultTxt.setGroupA(line.split(": ")[1].trim());
            } else if (line.startsWith("Date :")) {
                String dateStr = line.split(": ")[1].trim();
                try {
                    Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
                    resultTxt.setDate(date);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }

        // 解析结果部分
        String resultSection = data.substring(data.indexOf("[Result]") + "[Result]".length()).trim();
        String[] resultLines = resultSection.split("\\\\n");
        for (int i = 2; i < resultLines.length; i++) { // Skip header lines
            String resultLine = resultLines[i].trim();
            if (!resultLine.isEmpty()&&!resultLine.contains("----------")) {
                System.out.println(resultLine);
                String[] parts = resultLine.split("\\\\t");
                if(parts.length<2){
                    continue;
                }
                String analyte = parts[0].trim();
                String resultValue = parts[1].trim().replace("%", ""); // Remove percentage sign

                switch (analyte) {
                    case "TFe":
                        resultTxt.setTfe(resultValue);
                        break;
                    case "SiO2":
                        resultTxt.setSio2(resultValue);
                        break;
                    case "CaO":
                        resultTxt.setCao(resultValue);
                        break;
                    case "MgO":
                        resultTxt.setMgo(resultValue);
                        break;
                    case "Al2O3":
                        resultTxt.setA12o3(resultValue);
                        break;
                    case "P":
                        resultTxt.setP(resultValue);
                        break;
                    case "S":
                        resultTxt.setS(resultValue);
                        break;
                    case "TiO2":
                        resultTxt.setTio2(resultValue);
                        break;
                    case "V2O5":
                        resultTxt.setV2o5(resultValue);
                        break;
                    case "MnO":
                        resultTxt.setMno(resultValue);
                        break;
                    case "Cr":
                        resultTxt.setCr(resultValue);
                        break;
                    case "Zn":
                        resultTxt.setZn(resultValue);
                        break;
                    case "Cu":
                        resultTxt.setCu(resultValue);
                        break;
                    case "Ni":
                        resultTxt.setNi(resultValue);
                        break;
                    case "Pb":
                        resultTxt.setPb(resultValue);
                        break;
                    case "As":
                        resultTxt.setAS(resultValue);
                        break;
                    case "Feo":
                        resultTxt.setFeo(resultValue);
                        break;
                    case "H2O":
                        resultTxt.setH2o(resultValue);
                        break;
                    case "粒度":
                        resultTxt.setGranularity(resultValue);
                        break;
                    case "烧损":
                        resultTxt.setBurnLoss(resultValue);
                        break;
                    case "强度":
                        resultTxt.setStrength(resultValue);
                        break;
                    case "生烧":
                        resultTxt.setRawFever(resultValue);
                        break;
                }
            }
        }
        return  resultTxt;
    }
}
