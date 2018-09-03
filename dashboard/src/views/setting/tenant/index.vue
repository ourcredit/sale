<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form ref="queryForm" :label-width="80" label-position="left" inline>
                    <Row :gutter="16">
                        <Col span="16">
                            <FormItem label="组户名:" style="width:100%">
                                <Input v-model="filters.account"></Input>
                            </FormItem>
                        </Col>
                         <Col span="4">
                           <Button  @click="Create" icon="android-add" type="primary" size="large">新增</Button>
                        <Button icon="ios-search" type="primary" size="large"
                         @click="init" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                </Form>
                <div class="margin-top-10">
                    <SaleTable ref="table" :filters="filters" :type="'tenant'" :columns="columns"></SaleTable>
                </div>
            </div>
        </Card>
        <Modify v-model="ModalShow" @save-success="init"></Modify>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "../../../lib/abpbase";
import PageRequest from "../../../store/entities/page-request";
import Modify from "./modify.vue";
import Tenant from "../../../store/entities/tenant";
import SaleTable from "@/components/saletable.vue";
@Component({
  components: {
    Modify,
    SaleTable
  }
})
export default class Users extends AbpBase {
  filters: any = {
    name: ""
  };
  ModalShow: boolean = false;
  get list() {
    return this.$store.state.category.list;
  }
  p: any = {
    modify: this.hasPermission("tenant:modify"),
    delete: this.hasPermission("tenant:delete"),
    list: this.hasPermission("tenant:list"),
    first: this.hasPermission("tenant:first"),
    batch: this.hasPermission("tenant:batch")
  };
  get loading() {
    return this.$store.state.category.loading;
  }
  Create() {
    var u = new Tenant();
    this.$store.commit("tenant/edit", u);
    this.ModalShow = true;
  }
  Modify() {
    this.ModalShow = true;
  }
  init() {
    var t: any = this.$refs.table;
    t.getpage();
  }
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
  async created() {}
}
</script>