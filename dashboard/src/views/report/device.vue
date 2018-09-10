<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
                    <Row :gutter="4">
                        <Col span="4">
                        <FormItem label="设备编号:">
                            <Input v-model="filters.deviceNum"/>
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
                <DatePicker v-model="filters.creationTime" type="daterange" split-panels placeholder="选择范围" style="width: 200px"></DatePicker>
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
    deviceNum: "",
    pointName: "",
    productName: null,
    creationTime: null
  };
  columns: Array<any> = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "设备编号",
      key: "deviceNum"
    },
    {
      title: "设备名称",
      key: "deviceName"
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
      title: "累计销量",
      key: "saleCount"
    },
    {
      title: "累计销售额",
      key: "saleMoney",
      render: (h: any, params: any) => {
        return h("span", params.row.saleMoney / 100);
      }
    }
  ];
  get list() {
    return this.$store.state.dash.deviceSales;
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
      type: "dash/getDevices",
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