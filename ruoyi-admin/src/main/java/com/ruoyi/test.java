package com.ruoyi;

public class test {
    public static void main(String[] args) {
         String data = "Sample: 9YUE9\\nOperator: 28\\nComment: 注释\\nGroup : [Quantitative]铁矿石（熔融）-矿\\nDate : 2024-10-21 15:38:07\\n\\n[Result]\\n-----------------------------------------------------------------------\\nAnalyte\\t Result\\tProc-Calc Line\\tNet Int. BG Int.\\n------------------------------------------------------------------------------\\nTFe\\t 63.35%\\tQuant.-EC FeKa\\t8.6683\\nSiO2  3.37%\\tQuant.-EC SiKa\\t3.184\\nCaO\\t0.69%\\tQuant.-EC CaKa\\t3.088\\nMgO\\t4.59%\\tQuant.-EC MgKa\\t0.5703\\nAl2O3\\t0.39%\\tQuant.-EC AlKa\\t0.977\\nP\\t0.018%\\tQuant.-EC PKa\\t0.155\\nS\\t0.018%\\tQuant.-EC SKa\\t0.72\\nTiO2\\t0.234%\\tQuant.-EC VKa\\t13.11\\nV2O5\\t0.040%\\tQuant.-EC MnKa\\t10.256\\nMnO\\t1.193%\\tQuant.-EC CrKa\\t0.5253\\nCr\\t0.009%\\tQuant.-EC ZnKa\\t7.29p";

        String[] lines = data.trim().split("\\\\n");
        System.out.println(lines);

    }
}
