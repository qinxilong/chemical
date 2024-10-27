<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="85px">
      <el-form-item label="样品号" prop="sample">
        <el-input
          v-model="queryParams.sample"
          placeholder="请输入样品号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="实验室名称" prop="laboratoryName">
        <el-input
          v-model="queryParams.laboratoryName"
          placeholder="请输入实验室名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="接收人" prop="receiveUserId">-->
<!--        <el-input-->
<!--          v-model="queryParams.receiveUserId"-->
<!--          placeholder="请输入接收人"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="发送人" prop="pushUserId">-->
<!--        <el-input-->
<!--          v-model="queryParams.pushUserId"-->
<!--          placeholder="请输入发送人"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['chemical:pushRecord:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['chemical:pushRecord:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['chemical:pushRecord:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="pushRecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="id" align="center" prop="id" />-->
      <el-table-column label="样品号" align="center" prop="sample" />
      <el-table-column label="实验室名称" align="center" prop="laboratoryName" />
<!--      <el-table-column label="原始数据" align="center" prop="orginIds" />-->
<!--      <el-table-column label="目标数据" align="center" prop="targetId" />-->
      <el-table-column label="数据类型" align="center" prop="type" />
      <el-table-column label="接收人" align="center" prop="receiveUserName" />
      <el-table-column label="发送人" align="center" prop="pushUserName" />
      <el-table-column label="发送时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['chemical:pushRecord:detail']"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleDelete(scope.row)"
            v-hasPermi="['chemical:pushRecord:delete']"
          >撤回</el-button>
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

    <!-- 添加或修改实验数据推送记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="样品号" prop="sample">
          <el-input v-model="form.sample" placeholder="请输入样品号" />
        </el-form-item>
        <el-form-item label="实验室名称" prop="laboratoryName">
          <el-input v-model="form.laboratoryName" placeholder="请输入实验室名称" />
        </el-form-item>
        <el-form-item label="原始数据id" prop="orginIds">
          <el-input v-model="form.orginIds" placeholder="请输入原始数据id" />
        </el-form-item>
        <el-form-item label="目标数据id" prop="targetId">
          <el-input v-model="form.targetId" placeholder="请输入目标数据id" />
        </el-form-item>
        <el-form-item label="接收人id" prop="receiveUserId">
          <el-input v-model="form.receiveUserId" placeholder="请输入接收人id" />
        </el-form-item>
        <el-form-item label="发送人id" prop="pushUserId">
          <el-input v-model="form.pushUserId" placeholder="请输入发送人id" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listPushRecord, getPushRecord, delPushRecord, addPushRecord, updatePushRecord } from "@/api/chemical/pushRecord";

export default {
  name: "PushRecord",
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
      // 实验数据推送记录表格数据
      pushRecordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sample: null,
        laboratoryName: null,
        orginIds: null,
        targetId: null,
        type: null,
        receiveUserId: null,
        pushUserId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询实验数据推送记录列表 */
    getList() {
      this.loading = true;
      listPushRecord(this.queryParams).then(response => {
        this.pushRecordList = response.rows;
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
        laboratoryName: null,
        orginIds: null,
        targetId: null,
        type: null,
        receiveUserId: null,
        pushUserId: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
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
      this.title = "添加实验数据推送记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPushRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改实验数据推送记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePushRecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPushRecord(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除实验数据推送记录编号为"' + ids + '"的数据项？').then(function() {
        return delPushRecord(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('chemical/pushRecord/export', {
        ...this.queryParams
      }, `pushRecord_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
