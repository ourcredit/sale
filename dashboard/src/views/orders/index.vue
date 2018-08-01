<template>
  <div>
    <Row>

      <Card dis-hover>
        <div class="page-body">
          <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
            <Row :gutter="4">
              <Col span="22">
              <FormItem label="订单编号:">
                <Input v-model="filters.productName" />
              </FormItem>
              <FormItem label="商品名称:">
                <Input v-model="filters.productName" />
              </FormItem>
              <FormItem label="设备名称:">
                <Input v-model="filters.productName" />
              </FormItem>
              <FormItem label="设备编号:">
                <Input v-model="filters.productName" />
              </FormItem>
              <FormItem label="所属点位:">
                <Input v-model="filters.productName" />
              </FormItem>
              <FormItem label="时间范围:">
                <DatePicker type="daterange" split-panels placeholder="选择范围" style="width: 200px"></DatePicker>
              </FormItem>
              <FormItem label="订单状态:">
                <Select clearable v-model="filters.deviceType" style="width:160px">
                  <Option v-for="item in cates" :value="item" :key="item">{{ item }}</Option>
                </Select>
              </FormItem>
              <FormItem label="设备类型:">
                <Select clearable v-model="filters.deviceType" style="width:160px">
                  <Option v-for="item in cates" :value="item" :key="item">{{ item }}</Option>
                </Select>
              </FormItem>
              </Col>
              <Col span="2">
              <Button icon="ios-search" type="primary" size="large" @click="init" class="toolbar-btn">查找</Button>
              </Col>
            </Row>
          </Form>
          <SaleTable ref="table" :filters="filters" :type="'product'" :columns="columns"></SaleTable>
        </div>
      </Card>
    </Row>

    <modify v-model="ModalShow" @save-success="init"></modify>
  </div>
</template>
<script lang="ts">
  import {
    Component,
    Vue,
    Inject,
    Prop,
    Watch
  } from "vue-property-decorator";
  import SaleTable from "@/components/saletable.vue";
  import AbpBase from "@/lib/abpbase";
  import PageRequest from "../../store/entities/page-request";
  import Util from "../../lib/util";
  import Product from "@/store/entities/product";

  @Component({
    components: {
      SaleTable
    }
  })
  export default class ProductC extends AbpBase {
    filters: Object = {
      productName: ""
    };
    p: any = {
      modify: this.hasPermission("order:modify"),
      delete: this.hasPermission("order:delete"),
      list: this.hasPermission("order:list"),
      first: this.hasPermission("order:first"),
      batch: this.hasPermission("order:batch")
    };
    get cates() {
      return this.$store.state.product.productCate;
    }
    ModalShow: boolean = false;
    columns: Array < any > = [{
        type: "selection",
        width: 60,
        align: "center"
      },
      {
        title: "订单编号",
        key: "productName"
      },
      {
        title: "商品名称",
        key: "productName"
      },
      {
        title: "设备名称",
        key: "productType"
      },
      {
        title: "设备编号",
        key: "price"
      },
      {
        title: "设备类型",
        key: "price"
      },
      {
        title: "所属点位",
        key: "price"
      },
      {
        title: "金额",
        key: "price"
      },
      {
        title: "状态",
        key: "price"
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
            "Button", {
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
                    type: "product/get",
                    data: params.row.id
                  });
                  this.Modify();
                }
              }
            },
            "退款"
          );
          var de = h(
            "Button", {
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
                        type: "product/delete",
                        data: params.row
                      });
                      await this.init();
                    }
                  });
                }
              }
            },
            "查看"
          );
          var t = [ed, de];
          return h("div", t);
        }
      }
    ];
    Create() {
      var u = new Product();
      this.$store.commit("product/edit", u);
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
              type: "product/batch",
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
    async created() {}
  }
</script>