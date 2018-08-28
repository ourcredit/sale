<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="60" label-position="left" inline>
                    <Row :gutter="4">
                        <Col span="4">
                        <FormItem label="角色名:">
                            <Input v-model="filters.roleName"/>
                        </FormItem>
                        </Col>
                        <Col span="4">
                        <FormItem label="显示名:">
                            <Input v-model="filters.displayName"/>
                        </FormItem>
                        </Col>
                        <Col span="7">
                        <Button @click="Create" icon="android-add" type="primary" size="large">添加</Button>
                        <Button  @click="batchDelete" type="primary" class="toolbar-btn" size="large">批量删除</Button>
                        <Button icon="ios-search" type="primary" size="large" @click="init" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                </Form>
                <SaleTable ref="table" :filters="filters" :type="'role'" :columns="columns"></SaleTable>
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
  columns: Array<any> = [
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