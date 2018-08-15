<template>
    <div :id="domain"></div>
</template>
<script lang="ts">
    import {
        Component,
        Vue,
        Inject,
        Prop,
        Watch
    } from "vue-property-decorator";
    import AbpBase from "../../lib/abpbase";
    import HighCharts from 'highcharts';
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
        data: Array < any > ;
        async mounted() {
            let opt: any = {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: this.title
                },
                xAxis: {
                    categories: ['非洲', '美洲', '亚洲', '欧洲', '大洋洲'],
                    title: {
                        text: null
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '销售额',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    valueSuffix: ' 元'
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            enabled: true,
                            allowOverlap: true // 允许数据标签重叠
                        }
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -40,
                    y: 100,
                    floating: true,
                    borderWidth: 1,
                    backgroundColor: '#FFFFFF',
                    shadow: true
                },
                series: [ {
                    name: '2008 年',
                    data: [973, 914, 4054, 732, 34]
                }]
            }
            var chart = HighCharts.chart(this.domain, opt);
        }
    }
</script>
<style scoped>
</style>