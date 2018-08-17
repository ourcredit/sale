<template>
  <div>
    <Row>
      <Col span="5">
      <OrgTree @complete="init"></OrgTree>
      </Col>
      <Col span="19">
      <Card dis-hover>
        <div class="page-body">
          <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
            <Row :gutter="4">
              <Col span="22">
              <FormItem label="订单编号:">
                <Input v-model="filters.wechatOrder" />
              </FormItem>
              <FormItem label="商品名称:">
                <Input v-model="filters.productName" />
              </FormItem>
              <FormItem label="设备名称:">
                <Input v-model="filters.deviceName" />
              </FormItem>
              <FormItem label="设备编号:">
                <Input v-model="filters.deviceNum" />
              </FormItem>
              <FormItem label="所属点位:">
                <Input v-model="filters.pointName" />
              </FormItem>
              <FormItem label="时间范围:">
                <DatePicker v-model="filters.creationTime" type="daterange" split-panels placeholder="选择范围" style="width: 200px"></DatePicker>
              </FormItem>
              <FormItem label="订单状态:">
                <Select clearable v-model="filters.deviceType" style="width:160px">
                  <Option v-for="item in orderStates" :value="item" :key="item">{{ item }}</Option>
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
          <SaleTable ref="table" :filters="filters" :type="'order'" :columns="columns"></SaleTable>
        </div>
      </Card>
      </Col>
    </Row>
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
  import OrgTree from "@/components/orgtree.vue";
  @Component({
    components: {
      SaleTable,
      OrgTree
    }
  })
  export default class Orders extends AbpBase {
    filters: any = {
      wechatOrder: "",
      productName: "",
      deviceName: "",
      pointName: "",
      deviceType: "",
      creationTime: null
    };
    get tree() {
      return this.$store.state.device.tree;
    }
    orderStates: Array < any >= ["未支付", "已支付", "未发货", "已发货"];
    p: any = {
      list: this.hasPermission("order:list"),
      first: this.hasPermission("order:first"),
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
        key: "wechatOrder"
      },
      {
        title: "商品名称",
        key: "productName"
      },
      {
        title: "设备名称",
        key: "deviceName"
      },
      {
        title: "设备编号",
        key: "wechatOrder"
      },
      {
        title: "设备类型",
        key: "deviceType"
      },
      {
        title: "所属点位",
        key: "pointName"
      },
      {
        title: "金额",
        key: "price"
      },
      {
        title: "状态",
        key: "payState",
        render: (h: any, params: any) => {
          if(params.row.payState == -1)  return h("span", "已退款");
          let t = params.row.payState == 1 ? "已支付" : "未支付";
          t += "," + (params.row.orderState == 1 ? "已发货" : "未发货")
          return h("span", t);
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
            "Button", {
              props: {
                type: "primary",
                size: "small"
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
                }
              }
            },
            "退款"
          );
          if(params.row.payState==1){
          var t = [ed];
          }
          return h("div", t);
        }
      }
    ];
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
    async created() {

    }
  }
</script>