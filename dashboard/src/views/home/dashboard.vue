<style lang="less" scoped>
    @import "./dashboard.less";
</style>

<template>
    <div>
        今日统计
        <Row>
            <Col span="5">
            <Card dis-hover>
                总收入:55510元
            </Card>
            </Col>
            <Col span="5">
            <Card dis-hover>
                总销量:2980件
            </Card>
            </Col>
            <Col span="5">
            <Card dis-hover>
                设备:769台
            </Card>
            </Col>
            <Col span="5">
            <Card dis-hover>
                未解决故障：15起
            </Card>
            </Col>
            <Col span="4">
            <Card dis-hover>
                出货失败、退款：3笔
            </Card>
            </Col>
        </Row>
        图标
        <Row>
            <Col span="12">
            <LineChart :data="[]" :title="'今日销售额'" :domain="'today'"></LineChart>
            </Col>
            <Col span="12">
            <LineChart :data="[]" :title="'本月销售额'" :domain="'month'"></LineChart>
            </Col>
        </Row>
        <Row>
            <Col span="8">
            <PieChart :data="[]" :domain="'sale'"></PieChart>
            </Col>
            <Col span="8">
            <BarChart :data="[]"  :title="'今日销售点位销售额排行榜TOP10'" :domain="'todaysale'"></BarChart>
            </Col>
            <Col span="8">
            <BarChart  :data="[]" :title="'本月销售点位销售额排行榜TOP10'" :domain="'monthsale'"></BarChart>

            </Col>
        </Row>

        历史统计
        <Row>
            <Col span="5">
            <Card dis-hover>
                总收入:55510元
            </Card>
            </Col>
            <Col span="5">
            <Card dis-hover>
                总销量:2980件
            </Card>
            </Col>
            <Col span="5">
            <Card dis-hover>
                设备:769台
            </Card>
            </Col>
            <Col span="5">
            <Card dis-hover>
                未解决故障：15起
            </Card>
            </Col>
            <Col span="4">
            <Card dis-hover>
                出货失败、退款：3笔
            </Card>
            </Col>
        </Row>
    </div>



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
    import LineChart from '../../components/charts/linechart.vue';
    import PieChart from '../../components/charts/piechart.vue';
    import BarChart from '../../components/charts/barchart.vue';
    @Component({
        components: {
            LineChart,
            PieChart,
            BarChart
        }
    })
    export default class Dashboard extends AbpBase {
        filters: Object = {
            name: "",
            displayName: ""
        };

        init() {
            var t: any = this.$refs.table;
            t.getpage();
        }
        Modify() {}
        async created() {
        }
        async mounted() {
           
        }
    }
</script>