<template>
    <div :id="domain"></div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "../../lib/abpbase";
import HighCharts from "highcharts";
@Component
export default class LineChart extends AbpBase {
  @Prop({
    type: String,
    required: true
  })
  domain: any;
  @Prop({
    type: String,
    default: "统计"
  })
  title: String;
  @Prop({
    type: Array,
    required: true
  })
  data: Array<any>;
  @Prop({
    type: Array,
    required: true
  })
  keys: Array<any>;
  async mounted() {
    let option: any = {
      chart: {
        type: "line"
      },
      title: {
        text: this.title
      },

      xAxis: {
        categories: this.keys
      },
      yAxis: {
        title: {
          text: "销量"
        }
      },
      plotOptions: {
        line: {
          dataLabels: {
            // 开启数据标签
            enabled: true
          },
          // 关闭鼠标跟踪，对应的提示框、点击事件会失效
          enableMouseTracking: true
        }
      },
      series: [
        {
          name: " ",
          data: this.data
        }
      ]
    };
    HighCharts.chart(this.domain, option);
  }
}
</script>
<style scoped>
</style>