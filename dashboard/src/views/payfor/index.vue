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
                    <Row :gutter="16" justify="center">
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
                        <Col span="8">
                        <Upload name="files" style="padding: 20px 0;" :on-success="afterSave" :type="upload.drag" :headers="upload.header"
                            :action="upload.action">
                            <div style="padding: 20px 0">
                                <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                                <p>上传退款证书</p>
                            </div>
                        </Upload>
                        </Col>
                    </Row>
                </Form>

            </div>
        </Card>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import auth from "@/lib/auth";
import AbpBase from "@/lib/abpbase";

@Component
export default class Payfor extends AbpBase {
  get current() {
    return this.$store.state.device.payfor;
  }
  upload: any = {
    type: "drag",
    action: "https://service.leftins.com/api/file/pems",
    // action: "http://localhost:8081/api/file/pems",
    header: {
      Authorization: auth.getToken()
    }
  };
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
  afterSave(response, file, fileList) {}
  async created() {}
}
</script>