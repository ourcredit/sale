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
              <Button icon="ios-search" type="primary" size="large" @click="getpage" class="toolbar-btn">查找</Button>

              <Button icon="add" type="primary" size="large" @click="save" class="toolbar-btn">保存</Button>
              </Col>
            </Row>
          </Form>
           <div class="margin-top-10">
            <Table  ref="table"
             stripe border show-header 
              :columns="columns"
               no-data-text="暂无数据"
                :data="list">
            </Table>
            <Page show-sizer class-name="fengpage"
             :total="totalCount"
              class="margin-top-10"
              @on-change="pageChange"
               @on-page-size-change="pagesizeChange"
                :page-size="pageSize" 
                :current="currentPage"></Page>
        </div>
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
import { debug } from "util";
@Component({
  components: {
    SaleTable
  }
})
export default class deviceC extends AbpBase {
  filters: Object = {
    deviceName: ""
  };
  finnalList: any = new Array<any>();
  get cates() {
    return this.$store.state.product.productCate;
  }
  get list() {
    return this.$store.state.device.products;
  }
  get current() {
    return this.$store.state.device.editDevice;
  }
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
            value: params.row.isSale > 0
          },
          style: {
            marginRight: "5px"
          },
          on: {
            "on-change": (e: any) => {
              console.log(this.finnalList);
              var mo = this.finnalList[params.index];
              if (mo) {
                mo.isSale = e ? 1 : 0;
              } else {
                mo = {
                  isSale: e ? 1 : 0,
                  id: params.row.id,
                  deviceId: this.current.id,
                  productId: params.row.productId
                };
                this.finnalList[params.index] = mo;
              }
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
              var mo = this.finnalList[params.index];
              if (mo) {
                mo.price = e;
              } else {
                mo = {
                  price: e,
                  id: params.row.id,
                  deviceId: this.current.id,
                  productId: params.row.productId
                };
                this.finnalList[params.index] = mo;
              }
            }
          }
        });
      }
    }
  ];
  async save() {
    await this.$store.dispatch({
      type: `device/allowProducts`,
      data: this.finnalList
    });
    this.$router.push({ name: "dl" });
  }
  pageChange(page: number) {
    this.$store.commit(`device/setCurrentPage`, page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit(`device/setPageSize`, pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest: any = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.deviceId = this.current.id;
    await this.$store.dispatch({
      type: `device/getAllProducts`,
      data: pagerequest
    });
    this.list.forEach(w => {
      var t = {
        id: w.id,
        isSale: w.isSale,
        price: w.price,
        deviceId: w.deviceId,
        productId: w.productId
      };
      if (this.current.id == t.deviceId) {
        this.finnalList.push(t);
      }
    });
  }
  get pageSize() {
    return this.$store.state[`device`].pageSize;
  }
  get totalCount() {
    return this.$store.state[`device`].totalCount;
  }
  get currentPage() {
    return this.$store.state[`device`].currentPage;
  }
  async created() {
    if (!this.current || !this.current.id) {
      this.$router.push({ name: "dl" });
      return;
    }
    this.getpage();
  }
  async mounted() {
    if (!this.current || !this.current.id) {
      this.$router.push({ name: "dl" });
    }
  }
}
</script>