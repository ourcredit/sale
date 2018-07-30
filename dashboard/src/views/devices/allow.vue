<template>
  <div>
    <Row>
     
      <Card dis-hover>
        <div class="page-body">
          <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
            <Row :gutter="4">
              <Col span="18">
              <FormItem label="商品名:">
                <Input v-model="filters.deviceName" />
              </FormItem>
              <FormItem label="商品编号:">
                <Input v-model="filters.deviceName" />
              </FormItem>
              <FormItem label="商品类型:">
                <Select clearable v-model="filters.deviceType" style="width:160px">
                  <Option v-for="item in cates" :value="item" :key="item">{{ item }}</Option>
                </Select>
              </FormItem>
              <FormItem label="是否售卖:">
                <Select clearable v-model="filters.isSale" style="width:160px">
                  <Option  value="1" >售卖</Option>
                  <Option  value="0" >未售卖</Option>
                </Select>
              </FormItem>
              </Col>
              <Col span="6">
              <Button icon="ios-search" type="primary" size="large" @click="init" class="toolbar-btn">查找</Button>

              <Button icon="add" type="primary" size="large" @click="init" class="toolbar-btn">保存</Button>
              </Col>
            </Row>
          </Form>
          <SaleTable ref="table" :filters="filters" :type="'product'" :columns="columns"></SaleTable>
        </div>
      </Card>
    </Row>
  </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import SaleTable from "@/components/saletable.vue";
import AbpBase from "@/lib/abpbase";
import PageRequest from "../../store/entities/page-request";
import Util from "../../lib/util";
@Component({
  components: {
    SaleTable
  }
})
export default class deviceC extends AbpBase {
  filters: Object = {
    deviceName: ""
  };
  get cates() {
    return this.$store.state.product.productCate;
  }
  ModalShow: boolean = false;

  columns: Array<any> = [
    {
      title: "商品名",
      key: "productName"
    },
    {
      title: "商品编号",
      key: "productName"
    },
    {
      title: "商品类型",
      key: "productType"
    },
    {
      title: "是否售卖",
      key: "productName",
      render: (h: any, params: any) => {
        return h("Checkbox", {
          props: {
            value: params.row.isSale
          },
          style: {
            marginRight: "5px"
          },
          on: {
            "on-change": (e: any) => {
              params.row.isSale = e;
            }
          }
        });
      }
    },
    {
      title: "价格",
      key: "price",
      render: (h: any, params: any) => {
        return h("InputNumber", {
          props: {
            type: "text",
            value: params.row.price
          },
          style: {
            width: "100%",
            marginRight: "5px"
          },
          on: {
            "on-change": (e: any) => {
              params.row.price = e;
            }
          }
        });
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