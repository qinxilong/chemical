<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="Sample" prop="sample">
        <el-input
          v-model="queryParams.sample"
          placeholder="请输入Sample"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="推送状态" prop="pushStatus">
        <el-select v-model="queryParams.pushStatus" placeholder="请选择推送状态" clearable>
          <el-option
            v-for="dict in dict.type.push_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['chemical:chemicalTxt:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['chemical:chemicalTxt:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['chemical:chemicalTxt:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['chemical:chemicalTxt:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="chemicalTxtList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID号" align="center" prop="id" />
      <el-table-column label="Sample" align="center" prop="sample" />
      <el-table-column label="Operator" align="center" prop="operator" />
      <el-table-column label="Comment" align="center" prop="comment" />
      <el-table-column label="Group" align="center" prop="groupA" />
      <el-table-column label="Date" align="center" prop="date" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="TFe" align="center" prop="tfe" />
      <el-table-column label="SiO2" align="center" prop="sio2" />
      <el-table-column label="CaO" align="center" prop="cao" />
      <el-table-column label="MgO" align="center" prop="mgo" />
      <el-table-column label="A12O3" align="center" prop="a12o3" />
      <el-table-column label="P" align="center" prop="p" />
      <el-table-column label="S" align="center" prop="s" />
      <el-table-column label="TiO2" align="center" prop="tio2" />
      <el-table-column label="V2O5" align="center" prop="v2o5" />
      <el-table-column label="MnO" align="center" prop="mno" />
      <el-table-column label="Cr" align="center" prop="cr" />
      <el-table-column label="Zn" align="center" prop="zn" />
      <el-table-column label="Cu" align="center" prop="cu" />
      <el-table-column label="Ni" align="center" prop="ni" />
      <el-table-column label="Pb" align="center" prop="pb" />
      <el-table-column label="As" align="center" prop="aS" />
      <el-table-column label="Feo" align="center" prop="feo" />
      <el-table-column label="H2O" align="center" prop="h2o" />
      <el-table-column label="烧损" align="center" prop="burnLoss" />
      <el-table-column label="粒度" align="center" prop="granularity" />
      <el-table-column label="强度" align="center" prop="strength" />
      <el-table-column label="生烧" align="center" prop="rawFever" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="推送状态" align="center" prop="pushStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.push_status" :value="scope.row.pushStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['chemical:chemicalTxt:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['chemical:chemicalTxt:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改txt实验数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="Sample" prop="sample">
          <el-input v-model="form.sample" placeholder="请输入Sample" />
        </el-form-item>
        <el-form-item label="Operator" prop="operator">
          <el-input v-model="form.operator" placeholder="请输入Operator" />
        </el-form-item>
        <el-form-item label="Comment" prop="comment">
          <el-input v-model="form.comment" placeholder="请输入Comment" />
        </el-form-item>
        <el-form-item label="Group" prop="groupA">
          <el-input v-model="form.groupA" placeholder="请输入Group" />
        </el-form-item>
        <el-form-item label="Date" prop="date">
          <el-date-picker clearable
                          v-model="form.date"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择Date">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="TFe" prop="tfe">
          <el-input v-model="form.tfe" placeholder="请输入TFe" />
        </el-form-item>
        <el-form-item label="SiO2" prop="sio2">
          <el-input v-model="form.sio2" placeholder="请输入SiO2" />
        </el-form-item>
        <el-form-item label="CaO" prop="cao">
          <el-input v-model="form.cao" placeholder="请输入CaO" />
        </el-form-item>
        <el-form-item label="MgO" prop="mgo">
          <el-input v-model="form.mgo" placeholder="请输入MgO" />
        </el-form-item>
        <el-form-item label="A12O3" prop="a12o3">
          <el-input v-model="form.a12o3" placeholder="请输入A12O3" />
        </el-form-item>
        <el-form-item label="P" prop="p">
          <el-input v-model="form.p" placeholder="请输入P" />
        </el-form-item>
        <el-form-item label="S" prop="s">
          <el-input v-model="form.s" placeholder="请输入S" />
        </el-form-item>
        <el-form-item label="TiO2" prop="tio2">
          <el-input v-model="form.tio2" placeholder="请输入TiO2" />
        </el-form-item>
        <el-form-item label="V2O5" prop="v2o5">
          <el-input v-model="form.v2o5" placeholder="请输入V2O5" />
        </el-form-item>
        <el-form-item label="MnO" prop="mno">
          <el-input v-model="form.mno" placeholder="请输入MnO" />
        </el-form-item>
        <el-form-item label="Cr" prop="cr">
          <el-input v-model="form.cr" placeholder="请输入Cr" />
        </el-form-item>
        <el-form-item label="Zn" prop="zn">
          <el-input v-model="form.zn" placeholder="请输入Zn" />
        </el-form-item>
        <el-form-item label="Cu" prop="cu">
          <el-input v-model="form.cu" placeholder="请输入Cu" />
        </el-form-item>
        <el-form-item label="Ni" prop="ni">
          <el-input v-model="form.ni" placeholder="请输入Ni" />
        </el-form-item>
        <el-form-item label="Pb" prop="pb">
          <el-input v-model="form.pb" placeholder="请输入Pb" />
        </el-form-item>
        <el-form-item label="As" prop="aS">
          <el-input v-model="form.aS" placeholder="请输入As" />
        </el-form-item>
        <el-form-item label="Feo" prop="feo">
          <el-input v-model="form.feo" placeholder="请输入Feo" />
        </el-form-item>
        <el-form-item label="H2O" prop="h2o">
          <el-input v-model="form.h2o" placeholder="请输入H2O" />
        </el-form-item>
        <el-form-item label="烧损" prop="burnLoss">
          <el-input v-model="form.burnLoss" placeholder="请输入烧损" />
        </el-form-item>
        <el-form-item label="粒度" prop="granularity">
          <el-input v-model="form.granularity" placeholder="请输入粒度" />
        </el-form-item>
        <el-form-item label="强度" prop="strength">
          <el-input v-model="form.strength" placeholder="请输入强度" />
        </el-form-item>
        <el-form-item label="生烧" prop="rawFever">
          <el-input v-model="form.rawFever" placeholder="请输入生烧" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="推送状态" prop="pushStatus">
          <el-radio-group v-model="form.pushStatus">
            <el-radio
              v-for="dict in dict.type.push_status"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listChemicalTxt, getChemicalTxt, delChemicalTxt, addChemicalTxt, updateChemicalTxt } from "@/api/chemical/chemicalTxt";

export default {
  name: "ChemicalTxt",
  dicts: ['push_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // txt实验数据表格数据
      chemicalTxtList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sample: null,
        operator: null,
        comment: null,
        groupA: null,
        date: null,
        tfe: null,
        sio2: null,
        cao: null,
        mgo: null,
        a12o3: null,
        p: null,
        s: null,
        tio2: null,
        v2o5: null,
        mno: null,
        cr: null,
        zn: null,
        cu: null,
        ni: null,
        pb: null,
        aS: null,
        feo: null,
        h2o: null,
        burnLoss: null,
        granularity: null,
        strength: null,
        rawFever: null,
        pushStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        sample: [
          { required: true, message: "Sample不能为空", trigger: "blur" }
        ],
        operator: [
          { required: true, message: "Operator不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询txt实验数据列表 */
    getList() {
      this.loading = true;
      listChemicalTxt(this.queryParams).then(response => {
        this.chemicalTxtList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        sample: null,
        operator: null,
        comment: null,
        groupA: null,
        date: null,
        tfe: null,
        sio2: null,
        cao: null,
        mgo: null,
        a12o3: null,
        p: null,
        s: null,
        tio2: null,
        v2o5: null,
        mno: null,
        cr: null,
        zn: null,
        cu: null,
        ni: null,
        pb: null,
        aS: null,
        feo: null,
        h2o: null,
        burnLoss: null,
        granularity: null,
        strength: null,
        rawFever: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        pushStatus: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加txt实验数据";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getChemicalTxt(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改txt实验数据";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateChemicalTxt(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addChemicalTxt(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除txt实验数据编号为"' + ids + '"的数据项？').then(function() {
        return delChemicalTxt(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('chemical/chemicalTxt/export', {
        ...this.queryParams
      }, `chemicalTxt_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
