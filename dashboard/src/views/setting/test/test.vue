<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                  <Form slot="filter" ref="queryForm" :label-width="80" label-position="left" inline>
                    <Row :gutter="16">
                        <Col span="5">
                            <FormItem label="用户名:" style="width:100%">
                                <Input v-model="filters.account"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="姓名" style="width:100%">
                                <Input v-model="filters.userName"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="状态" style="width:100%">
                                <Select v-model="filters.isActive"
                                 :value="'null'" placeholder="请选择" >
                                    <Option value="null">全部</Option>
                                    <Option value="true">激活</Option>
                                    <Option value="false">禁用</Option>
                                </Select>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="创建时间" style="width:100%">
                                <DatePicker  v-model="filters.creationTime"
                                 type="datetimerange" format="yyyy-MM-dd"
                                  style="width:100%" placement="bottom-end"
                                   placeholder="选择时间"></DatePicker>
                            </FormItem>
                        </Col>
                         <Col span="4">
                           <Button  @click="Create" icon="android-add" type="primary" size="large">新增</Button>
                        <Button icon="ios-search" type="primary" size="large"
                         @click="init" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                </Form>
               <SaleTable ref="table" :filters="filters" type="role" :columns="columns"></SaleTable>
            </div>
        </Card>
          <modify v-model="ModalShow" @save-success="init"></modify>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import SaleTable from "@/components/saletable.vue";
import AbpBase from "../../../lib/abpbase";
import Role from "@/store/entities/role";
import Modify from "./modify.vue";
@Component({
  components: {
    SaleTable,
    Modify
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
    modify: this.hasPermission("role:modify"),
    delete: this.hasPermission("role:delete"),
    list: this.hasPermission("role:list"),
    first: this.hasPermission("role:first"),
    batch: this.hasPermission("role:batch")
  };
  ModalShow: boolean = false;
  columns = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "角色名",
      key: "roleName"
    },
    {
      title: "显示名",
      key: "displayName"
    },
    {
      title: "描述",
      key: "description"
    },
    {
      title: "状态",
      key: "isActive",
      render: (h: any, params: any) => {
        return h("span", params.row.isActive == 1 ? "启用" : "禁用");
      }
    },
    {
      title: "是否静态",
      key: "isStatic",
      render: (h: any, params: any) => {
        return h("span", params.row.isStatic == 1 ? "静态" : "非静态");
      }
    },
    {
      title: "创建时间",
      render: (h: any, params: any) => {
        return h(
          "span",
          new Date(params.row.creationTime).toLocaleDateString()
        );
      }
    },
    {
      title: "操作",
      key: "Actions",
      width: 150,
      render: (h: any, params: any) => {
        var ed = h(
          "Button",
          {
            props: {
              type: "primary",
              size: "small",
              disabled: !this.p.modify
            },
            style: {
              marginRight: "5px"
            },
            on: {
              click: () => {
                this.$store.dispatch({
                  type: "role/get",
                  data: params.row.id
                });
                this.Modify();
              }
            }
          },
          "编辑"
        );

        var de = h(
          "Button",
          {
            props: {
              type: "error",
              size: "small",
              disabled: !this.p.delete
            },
            on: {
              click: async () => {
                this.$Modal.confirm({
                  title: "删除提示",
                  content: "确认要删除么",
                  okText: "是",
                  cancelText: "否",
                  onOk: async () => {
                    await this.$store.dispatch({
                      type: "role/delete",
                      data: params.row
                    });
                    await this.init();
                  }
                });
              }
            }
          },
          "删除"
        );
        var t = [ed, de];
        return h("div", t);
      }
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