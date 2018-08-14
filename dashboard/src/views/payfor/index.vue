<template>
    <div>
        <Card dis-hover>
            <Row :gutter="4">
                <Col span="6">
                <Button class="toolbar-btn" @click="save" icon="android-add" type="primary" size="large">保存</Button>
                </Col>
            </Row>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="80" label-position="left">
                    <Row>
                        <Col span="8"> 支付宝配置项
                        <FormItem label="支付宝id:">
                            <Input type="password" v-model="current.alipayId" />
                        </FormItem>
                        <FormItem label="支付宝key:">
                            <Input type="password" v-model="current.alipayKey" />
                        </FormItem>
                        <FormItem label="支付宝agent:">
                            <Input type="password" v-model="current.alipayAgent" />
                        </FormItem>
                        </Col>
                        <Col span="4"> &nbsp;
                        </Col>
                        <Col span="8"> 微信配置项
                        <FormItem label="微信id:">
                            <Input type="password" v-model="current.wechatpayId" />
                        </FormItem>
                        <FormItem label="微信key:">
                            <Input type="password" v-model="current.wechatpayKey" />
                        </FormItem>
                        <FormItem label="微信agent:">
                            <Input type="password" v-model="current.wechatpayAgent" />
                        </FormItem>
                        </Col>
                    </Row>
                </Form>
            </div>
        </Card>
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
    import AbpBase from "@/lib/abpbase";

    @Component
    export default class Payfor extends AbpBase {
        get current() {
            return this.$store.state.device.payfor;
        }
        async save() {
            this.$store.dispatch({
                type: "device/putAccount",
                data: this.current
            });
            this.$Notice.open({
                title: "保存成功",
                desc: ""
            });
        }
        async created() {
        }
    }
</script>