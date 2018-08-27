<style lang="less" scoped>
@import "./dashboard.less";
</style>

<template>
    <div>
        <Card >
            <p slot="title">
                <Icon type="ios-film-outline"></Icon>
                今日统计
            </p>
            <Row>
                <Col span="5">
                <Card dis-hover>
                    总收入:{{today.sale==null?0.0:(today.sale*1.0/100)}}元
                </Card>
                </Col>
                <Col span="5">
                <Card dis-hover>
                    总销量:{{today.count}}件
                </Card>
                </Col>
                <Col span="5">
                <Card dis-hover>
                    设备:{{today.device}}台
                </Card>
                </Col>
                <Col span="5">
                <Card dis-hover>
                    未解决故障：{{today.error}}起
                </Card>
                </Col>
                <Col span="4">
                <Card dis-hover>
                    出货失败、退款：{{today.off}}笔
                </Card>
                </Col>
            </Row>
        </Card>
          <Card >
            <p slot="title">
                <Icon type="ios-film-outline"></Icon>
                分类汇总
            </p>
           <Row>
            <Col span="12">
            <LineChart :data="todaySale.values" :keys="todaySale.keys" :title="'今日销售额'" :domain="'today'"></LineChart>
            </Col>
            <Col span="12">
            <LineChart :data="monthSale.values" :keys="monthSale.keys" :title="'本月销售额'" :domain="'month'"></LineChart>
            </Col>
        </Row>
        <Row>
            <Col span="8">
            <PieChart :data="payType" :count="saleCount" :domain="'sale'"></PieChart>
            </Col>
            <Col span="8">
            <BarChart :data="todayTop.values" :keys="todayTop.keys" :title="'今日销售点位销售额排行榜TOP10'" :domain="'todaysale'"></BarChart>
            </Col>
            <Col span="8">
            <BarChart :data="monthTop.values" :keys="monthTop.keys" :title="'本月销售点位销售额排行榜TOP10'" :domain="'monthsale'"></BarChart>

            </Col>
        </Row>
        </Card>
           <Card >
            <p slot="title">
                <Icon type="ios-film-outline"></Icon>
                历史统计
            </p>
            <div slot="extra">
               时间范围查询  <DatePicker @on-change="change" v-model="filters.creationTime" type="daterange" split-panels placeholder="选择范围" style="width: 200px"></DatePicker>
            </div>
         
         <Row>
                <Col span="5">
                <Card dis-hover>
                    总收入:{{month.sale==null?0.0:month.sale*1.0/100}}元
                </Card>
                </Col>
                <Col span="5">
                <Card dis-hover>
                    总销量:{{month.count}}件
                </Card>
                </Col>
                <Col span="5">
                <Card dis-hover>
                    设备:{{month.device}}台
                </Card>
                </Col>
                <Col span="5">
                <Card dis-hover>
                    未解决故障：{{month.error}}起
                </Card>
                </Col>
                <Col span="4">
                <Card dis-hover>
                    出货失败、退款：{{month.off}}笔
                </Card>
                </Col>
            </Row>
        </Card>
       
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "../../lib/abpbase";
import HighCharts from "highcharts";
import LineChart from "../../components/charts/linechart.vue";
import PieChart from "../../components/charts/piechart.vue";
import BarChart from "../../components/charts/barchart.vue";
@Component({
  components: {
    LineChart,
    PieChart,
    BarChart
  }
})
export default class Dashboard extends AbpBase {
  filters: any = {
    creationTime: [new Date(), new Date()]
  };
  get todaySale() {
    var t = this.$store.state.dash.todaySale;
    return t;
  }
  get monthSale() {
    return this.$store.state.dash.monthSale;
  }
  get saleCount() {
    return this.$store.state.dash.saleCount;
  }
  get payType() {
    return this.$store.state.dash.payType;
  }
  get todayTop() {
    return this.$store.state.dash.todayTop;
  }
  get monthTop() {
    return this.$store.state.dash.monthTop;
  }
  get today() {
    return this.$store.state.dash.todayStatical;
  }
  get month() {
    return this.$store.state.dash.monthStatical;
  }
  change() {
    let t = this.filters.filters;
    if (t && t.creationTime) {
      t = t.creationTime;
    } else {
      t = null;
    }
    this.$store.dispatch({
      type: "dash/getStaticial",
      data: {
        start: t != null ? t[0] : new Date(),
        end: t != null ? t[1] : new Date()
      }
    });
  }
  async created() {
    let t = this.filters.filters;
    if (t && t.creationTime) {
      t = t.creationTime;
    } else {
      t = null;
    }
    this.$store.dispatch({
      type: "dash/getStaticial",
      data: {
        start: t != null ? t[0] : new Date(),
        end: t != null ? t[1] : new Date()
      }
    });
    this.$store.dispatch({
      type: "dash/getDashboard",
      data: {}
    });
  }
  async mounted() {}
}
</script>