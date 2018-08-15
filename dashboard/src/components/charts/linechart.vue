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
            default:"统计"
        })
        title: String;
          @Prop({
            type: Array,
            required:true
        })
        data: Array<any>;
        async mounted() {
            let option:any = {
                chart: {
                    type: 'area'
                },
                title: {
                    text: this.title
                },
                subtitle: {
                    text: ''
                },
                tooltip: {
                    pointFormat: '{series.name} 制造 <b>{point.y:,.0f}</b>枚弹头'
                },
                plotOptions: {
                    area: {
                        pointStart: 1940,
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                series: [{
                    name: '苏联/俄罗斯',
                    data: [null, null, null, null, null, null, null, null, null, null,
                        5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
                        4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
                        15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
                        33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
                        35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
                        21000, 20000, 19000, 18000, 18000, 17000, 16000
                    ]
                }]
            }
            HighCharts.chart(this.domain,option)
        }
    }
</script>
<style scoped>
</style>