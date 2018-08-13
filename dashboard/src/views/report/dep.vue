<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="60" label-position="left" inline>
                    <Row :gutter="4">
                        <Col span="4">
                        <FormItem label="设备编号:">
                            <Input v-model="filters.roleName"/>
                        </FormItem>
                        </Col>
                        <Col span="4">
                        <FormItem label="所属点位:">
                            <Input v-model="filters.displayName"/>
                        </FormItem>
                        </Col>
                         <Col span="4">
                        <FormItem label="商品名称:">
                            <Input v-model="filters.displayName"/>
                        </FormItem>
                        </Col>
                         <Col span="4">
                        <FormItem label="时间范围:">
                            <Input v-model="filters.displayName"/>
                        </FormItem>
                        </Col>
                        <Col span="7">
                        <Button v-if="p.modify" @click="Create" icon="android-add" type="primary" size="large">添加</Button>
                        <Button v-if="p.batch" @click="batchDelete" type="primary" class="toolbar-btn" size="large">批量删除</Button>
                        <Button icon="ios-search" type="primary" size="large" @click="init" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                </Form>
                <SaleTable ref="table" :filters="filters" :type="'role'" :columns="columns"></SaleTable>
            </div>
        </Card>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import SaleTable from "@/components/saletable.vue";
import AbpBase from "../../lib/abpbase";
import Role from "@/store/entities/role";
@Component({
  components: {
    SaleTable
  }
})
export default class Users extends AbpBase {
  filters: Object = {
    account: "",
    userName: "",
    creationTime: null,
    isActive: null
  };
  p: any = {
    list: this.hasPermission("role:list")
  };
  ModalShow: boolean = false;
  columns: Array<any> = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "设备编号",
      key: "roleName"
    },
    {
      title: "设备类型",
      key: "displayName"
    },
    {
      title: "所属点位",
      key: "description"
    },
    {
      title: "日均故障率",
      key: "isActive"
    }
    
  ];

  Create() {
    var u = new Role();
    this.$store.commit("role/edit", u);
    this.ModalShow = true;
  }
  init() {
    var t: any = this.$refs.table;
    t.getpage();
  }
  async batchDelete() {
    var t: any = this.$refs.table;
    if (t.selections) {
      this.$Modal.confirm({
        title: "删除提示",
        content: `确认要删除${t.selections.length}条数据么`,
        okText: "是",
        cancelText: "否",
        onOk: async () => {
          await this.$store.dispatch({
            type: "role/batch",
            data: t.selections
          });
          await this.init();
        }
      });
    }
  }
  Modify() {
    this.ModalShow = true;
  }
  async created() {
    await this.$store.dispatch({
      type: "role/getAllPermissions"
    });
  }
}
</script>