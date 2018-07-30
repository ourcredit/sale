<template>
    <div>
        <Row>
            <Col span="4">
            <Card dis-hover>
                <div class="page-body">
                    <Tree @on-select-change="change" :data="tree"></Tree>
                </div>
            </Card>
            </Col>
            <Col span="20">
            <Card dis-hover>
                <Row :gutter="4">
                    <Col span="6">
                    <Button v-if="current.operatorId" class="toolbar-btn" @click="save" icon="android-add" type="primary" size="large">保存</Button>
                    </Col>
                </Row>

                <div class="page-body">
                    <Form slot="filter" ref="queryForm" :label-width="80" label-position="left">
                        <Row>
                            <Col span="8"> 支付宝配置项
                            <FormItem label="支付宝id:">
                                <Input v-model="current.alipayId" />
                            </FormItem>
                            <FormItem label="支付宝key:">
                                <Input v-model="current.alipayKey" />
                            </FormItem>
                            <FormItem label="支付宝agent:">
                                <Input v-model="current.alipayAgent" />
                            </FormItem>
                            </Col>
                            <Col span="4"> &nbsp;
                            </Col>
                            <Col span="8"> 微信配置项
                            <FormItem label="微信id:">
                                <Input v-model="current.wechatpayId" />
                            </FormItem>
                            <FormItem label="微信key:">
                                <Input v-model="current.wechatpayKey" />
                            </FormItem>
                            <FormItem label="微信agent:">
                                <Input v-model="current.wechatpayAgent" />
                            </FormItem>
                            </Col>
                        </Row>

                    </Form>
                </div>
            </Card>
            </Col>
        </Row>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "@/lib/abpbase";

@Component
export default class Payfor extends AbpBase {
  get current() {
    return this.$store.state.device.payfor;
  }
  tree: Array<any> = [
    {
      title: "总部",
      id: 1,
      expand: true,
      children: [
        {
          id: 2,
          title: "分部1",
          expand: true,
          children: [
            {
              id: 3,
              title: "分部2"
            },
            {
              id: 4,
              title: "分部3"
            }
          ]
        },
        {
          title: "分部4",
          id: 5,
          expand: true,
          children: [
            {
              id: 6,
              title: "分部5"
            },
            {
              id: 7,
              title: "分部6"
            }
          ]
        }
      ]
    }
  ];
  async change(e) {
    if (e[0] && e[0].id) {
      var node = e[0].id;
      this.$store.dispatch({
        type: "device/getAccount",
        data: node
      });
    }
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
  async created() {}
}
</script>