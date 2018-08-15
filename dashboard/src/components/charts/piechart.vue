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
    export default class PieChart extends AbpBase {
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
            let option: any ={
                chart: {
                    spacing: [40, 0, 40, 0]
                },
                title: {
                    floating: true,
                    text: '总销量:351'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color:  'black'
                            }
                        },
                        point: {
                            events: {
                            }
                        },
                    }
                },
                series: [{
                    type: 'pie',
                    innerSize: '80%',
                    name: '市场份额',
                    data: [{
                            name: '微信',
                            y: 77.3
                        },
                        {
                            name: '支付宝',
                            y: 22.7
                        }
                    ]
                }]
            }

            var chart = HighCharts.chart(this.domain,option , function (c:any) { // 图表初始化完毕后的会掉函数
                // 环形图圆心
                var centerY = c.series[0].center[1],
                    titleHeight = parseInt(c.title.styles.fontSize);
                // 动态设置标题位置
                c.setTitle({
                    y: centerY + titleHeight / 2
                });
            });
        }
    }
</script>
<style scoped>
</style>