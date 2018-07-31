<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="60" label-position="left" inline>
                    <Row :gutter="4">
                        <Col span="4">
                        <FormItem label="租户名:">
                            <Input v-model="filters.name"/>
                        </FormItem>
                        </Col>
                        <Col span="4">
                        <FormItem label="显示名:">
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
                <SaleTable ref="table" :filters="filters" :type="'tenant'" :columns="columns"></SaleTable>
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
    name: "",
    displayName: ""
  };
  p: any = {
    modify: this.hasPermission("tenant:modify"),
    delete: this.hasPermission("tenant:delete"),
    list: this.hasPermission("tenant:list"),
    first: this.hasPermission("tenant:first"),
    batch: this.hasPermission("tenant:batch")
  };
  ModalShow: boolean = false;
  columns: Array<any> = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "租户名",
      key: "name"
    },
    {
      title: "显示名",
      key: "displayName"
    },
    {
      title: "状态",
      key: "isActive",
      render: (h: any, params: any) => {
        return h("span", params.row.isActive == 1 ? "启用" : "禁用");
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
                  type: "tenant/get",
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
                      type: "tenant/delete",
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
    this.$store.commit("tenant/edit", u);
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
            type: "tenant/batch",
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
   
  }
}
</script>