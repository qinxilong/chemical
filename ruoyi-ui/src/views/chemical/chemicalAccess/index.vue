<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="${comment}" prop="sample">
        <el-input
          v-model="queryParams.sample"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="mad">
        <el-input
          v-model="queryParams.mad"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="aad">
        <el-input
          v-model="queryParams.aad"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="ad">
        <el-input
          v-model="queryParams.ad"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="vad">
        <el-input
          v-model="queryParams.vad"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="vd">
        <el-input
          v-model="queryParams.vd"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="vdaf">
        <el-input
          v-model="queryParams.vdaf"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="fcad">
        <el-input
          v-model="queryParams.fcad"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="sad">
        <el-input
          v-model="queryParams.sad"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="h2o">
        <el-input
          v-model="queryParams.h2o"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="qd">
        <el-input
          v-model="queryParams.qd"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="qn">
        <el-input
          v-model="queryParams.qn"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="zn">
        <el-input
          v-model="queryParams.zn"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="tfe">
        <el-input
          v-model="queryParams.tfe"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="c">
        <el-input
          v-model="queryParams.c"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="样品编号" prop="sampleNo">
        <el-input
          v-model="queryParams.sampleNo"
          placeholder="请输入样品编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="室编号" prop="roomNo">
        <el-input
          v-model="queryParams.roomNo"
          placeholder="请输入室编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="粒度" prop="granularity">
        <el-input
          v-model="queryParams.granularity"
          placeholder="请输入粒度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="可磨性" prop="grindAbility">
        <el-input
          v-model="queryParams.grindAbility"
          placeholder="请输入可磨性"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物料名称" prop="materialName">
        <el-input
          v-model="queryParams.materialName"
          placeholder="请输入物料名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['chemical:chemicalAccess:add']"
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
          v-hasPermi="['chemical:chemicalAccess:edit']"
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
          v-hasPermi="['chemical:chemicalAccess:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['chemical:chemicalAccess:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="chemicalAccessList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="${comment}" align="center" prop="id" />
      <el-table-column label="${comment}" align="center" prop="sample" />
      <el-table-column label="${comment}" align="center" prop="mad" />
      <el-table-column label="${comment}" align="center" prop="aad" />
      <el-table-column label="${comment}" align="center" prop="ad" />
      <el-table-column label="${comment}" align="center" prop="vad" />
      <el-table-column label="${comment}" align="center" prop="vd" />
      <el-table-column label="${comment}" align="center" prop="vdaf" />
      <el-table-column label="${comment}" align="center" prop="fcad" />
      <el-table-column label="${comment}" align="center" prop="sad" />
      <el-table-column label="${comment}" align="center" prop="h2o" />
      <el-table-column label="${comment}" align="center" prop="qd" />
      <el-table-column label="${comment}" align="center" prop="qn" />
      <el-table-column label="${comment}" align="center" prop="zn" />
      <el-table-column label="${comment}" align="center" prop="tfe" />
      <el-table-column label="${comment}" align="center" prop="c" />
      <el-table-column label="样品编号" align="center" prop="sampleNo" />
      <el-table-column label="室编号" align="center" prop="roomNo" />
      <el-table-column label="粒度" align="center" prop="granularity" />
      <el-table-column label="可磨性" align="center" prop="grindAbility" />
      <el-table-column label="物料名称" align="center" prop="materialName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['chemical:chemicalAccess:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['chemical:chemicalAccess:remove']"
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

    <!-- 添加或修改access实验数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="${comment}" prop="sample">
          <el-input v-model="form.sample" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="mad">
          <el-input v-model="form.mad" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="aad">
          <el-input v-model="form.aad" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="ad">
          <el-input v-model="form.ad" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="vad">
          <el-input v-model="form.vad" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="vd">
          <el-input v-model="form.vd" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="vdaf">
          <el-input v-model="form.vdaf" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="fcad">
          <el-input v-model="form.fcad" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="sad">
          <el-input v-model="form.sad" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="h2o">
          <el-input v-model="form.h2o" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="qd">
          <el-input v-model="form.qd" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="qn">
          <el-input v-model="form.qn" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="zn">
          <el-input v-model="form.zn" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="tfe">
          <el-input v-model="form.tfe" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="c">
          <el-input v-model="form.c" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="样品编号" prop="sampleNo">
          <el-input v-model="form.sampleNo" placeholder="请输入样品编号" />
        </el-form-item>
        <el-form-item label="室编号" prop="roomNo">
          <el-input v-model="form.roomNo" placeholder="请输入室编号" />
        </el-form-item>
        <el-form-item label="粒度" prop="granularity">
          <el-input v-model="form.granularity" placeholder="请输入粒度" />
        </el-form-item>
        <el-form-item label="可磨性" prop="grindAbility">
          <el-input v-model="form.grindAbility" placeholder="请输入可磨性" />
        </el-form-item>
        <el-form-item label="物料名称" prop="materialName">
          <el-input v-model="form.materialName" placeholder="请输入物料名称" />
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
import { listChemicalAccess, getChemicalAccess, delChemicalAccess, addChemicalAccess, updateChemicalAccess } from "@/api/chemical/chemicalAccess";

export default {
  name: "ChemicalAccess",
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
      // access实验数据表格数据
      chemicalAccessList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sample: null,
        mad: null,
        aad: null,
        ad: null,
        vad: null,
        vd: null,
        vdaf: null,
        fcad: null,
        sad: null,
        h2o: null,
        qd: null,
        qn: null,
        zn: null,
        tfe: null,
        c: null,
        sampleNo: null,
        roomNo: null,
        granularity: null,
        grindAbility: null,
        materialName: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        granularity: [
          { required: true, message: "粒度不能为空", trigger: "blur" }
        ],
        grindAbility: [
          { required: true, message: "可磨性不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询access实验数据列表 */
    getList() {
      this.loading = true;
      listChemicalAccess(this.queryParams).then(response => {
        this.chemicalAccessList = response.rows;
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
        mad: null,
        aad: null,
        ad: null,
        vad: null,
        vd: null,
        vdaf: null,
        fcad: null,
        sad: null,
        h2o: null,
        qd: null,
        qn: null,
        zn: null,
        tfe: null,
        c: null,
        sampleNo: null,
        roomNo: null,
        granularity: null,
        grindAbility: null,
        materialName: null
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
      this.title = "添加access实验数据";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getChemicalAccess(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改access实验数据";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateChemicalAccess(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addChemicalAccess(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除access实验数据编号为"' + ids + '"的数据项？').then(function() {
        return delChemicalAccess(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('chemical/chemicalAccess/export', {
        ...this.queryParams
      }, `chemicalAccess_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
