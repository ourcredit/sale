<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
                    <Row :gutter="4">
                        <Col span="4">
                        <FormItem label="设备名:">
                            <Input v-model="filters.deviceName"/>
                        </FormItem>
                        </Col>
                        <Col span="4">
                        <FormItem label="所属点位:">
                            <Input v-model="filters.pointName"/>
                        </FormItem>
                        </Col>
                         <Col span="4">
                        <FormItem label="商品名称:">
                            <Input v-model="filters.productName"/>
                        </FormItem>
                        </Col>
                         <Col span="4">
                        <FormItem label="时间范围:">
                            <Input v-model="filters.creationTime"/>
                        </FormItem>
                        </Col>
                        <Col span="7">
                        <Button v-if="p.modify" @click="Create" icon="android-add" type="primary" size="large">添加</Button>
                        <Button v-if="p.batch" @click="batchDelete" type="primary" class="toolbar-btn" size="large">批量删除</Button>
                        <Button icon="ios-search" type="primary" size="large" @click="init" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                </Form>
                <SaleTable ref="table" :filters="filters" :type="'serial'"  :columns="columns"></SaleTable>
            </div>
        </Card>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import SaleTable from "@/components/saletable.vue";
import AbpBase from "../../lib/abpbase";
@Component({
  components: {
    SaleTable
  }
})
export default class Serials extends AbpBase {
  filters: any = {
    deviceName: "",
    pointName: "",
    productName: "",
    creationTime: null
  };
  p: any = {
    list: this.hasPermission("serial:list")
  };
  ModalShow: boolean = false;
  columns: Array<any> = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "订单号",
      key: "order"
    },
    {
      title: "金钱",
      key: "price",
      render: (h: any, params: any) => {
        return h("span", params.row.price / 100);
      }
    },
    {
      title: "商品名",
      key: "productName"
    },
    {
      title: "设备名",
      key: "deviceName"
    },
    {
      title: "点位名",
      key: "pointName"
    },
    {
      title: "类型",
      key: "type",
      render: (h: any, params: any) => {
        return h("span", params.row.type == 1 ? "支付" : "退款");
      }
    },
    {
      title: "创建时间",
      render: (h: any, params: any) => {
        return h("span", new Date(params.row.creationTime).toLocaleString());
      }
    }
  ];
  init() {
    var t: any = this.$refs.table;
    t.getpage();
  }
  async created() {}
}
</script>