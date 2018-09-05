<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
                    <Row :gutter="4">
                        <Col span="4">
                        <FormItem label="商品名:">
                            <Input v-model="filters.productName"/>
                        </FormItem>
                        </Col>
                        <Col span="4">
                        <FormItem label="设备名:">
                            <Input v-model="filters.deviceName"/>
                        </FormItem>
                        </Col>
                         <Col span="4">
                        <FormItem label="时间范围:">
                            <Input v-model="filters.displayName"/>
                        </FormItem>
                        </Col>
                        <Col span="4">
                        <Button icon="ios-search" type="primary" size="large" @click="getpage" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                </Form>
               <div class="margin-top-10">
                    <Table :loading="loading" :columns="columns" no-data-text="暂无数据" border :data="list">
                    </Table>
                    <Page  show-sizer class-name="fengpage" :total="totalCount"
                     class="margin-top-10"
                      @on-change="pageChange"
                       @on-page-size-change="pagesizeChange"
                        :page-size="pageSize"
                         :current="currentPage"></Page>
                </div>
            </div>
        </Card>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import SaleTable from "@/components/saletable.vue";
import AbpBase from "../../lib/abpbase";
import PageRequest from "../../store/entities/page-request";
@Component({
  components: {
    SaleTable
  }
})
export default class DeviceStatical extends AbpBase {
  filters: Object = {
    productName: "",
    deviceName: "",
    date: null
  };
  columns: Array<any> = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "商品名",
      key: "productName"
    },
    {
      title: "累计销量",
      key: "saleCount"
    },
    {
      title: "累计销售额",
      key: "saleMoney"
    },
    {
      title: "销售最多的设备",
      key: "maxDevice"
    }
  ];
  get list() {
    return this.$store.state.dash.productSales;
  }

  get loading() {
    return this.$store.state.dash.loading;
  }

  pageChange(page: number) {
    this.$store.commit("dash/setCurrentPage", page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit("dash/setPageSize", pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: "dash/getProducts",
      data: pagerequest
    });
  }
  get pageSize() {
    return this.$store.state.dash.pageSize;
  }
  get totalCount() {
    return this.$store.state.dash.totalCount;
  }
  get currentPage() {
    return this.$store.state.dash.currentPage;
  }
  async created() {
    this.getpage();
  }
}
</script>