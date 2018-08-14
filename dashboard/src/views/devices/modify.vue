<style lang="less">
@import "./device.less";
</style>
<template>
  <div>
    <Modal title="编辑设备" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="deviceForm" label-position="top" :rules="deviceRule" :model="device">
        <FormItem label="设备名" prop="deviceName">
          <Input v-model="device.deviceName" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="设备编号" prop="deviceNum">
          <Input v-model="device.deviceNum" readonly :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="设备类型" prop="deviceType">
          <Select  v-model="device.deviceType" style="width:100%">
            <Option v-for="item in cates"  :value="item" :key="item">{{ item }}</Option>
          </Select>
        </FormItem>
        <FormItem label="所属点位" prop="pointId">
          <Select :label-in-value="true" @on-change="change" v-model="device.pointId" style="width:100%">
            <Option v-for="item in points" :value="item.id" :key="item.id">{{ item.pointName }}</Option>
          </Select>
        </FormItem>
        </Tabs>
      </Form>
      <div slot="footer">
        <Button @click="cancel">关闭</Button>
        <Button @click="save" type="primary">保存</Button>
      </div>
    </Modal>
  </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import Util from "@/lib/util";
import AbpBase from "@/lib/abpbase";
import PageRequest from "../../store/entities/page-request";
import Point from "@/store/entities/device";
@Component
export default class CreateDevice extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  get device() {
    return this.$store.state.device.editDevice;
  }
  get cates() {
    return this.$store.state.device.deviceCate;
  }
  get current() {
    return this.$store.state.device.currentOrg;
  }
  get points() {
    return this.$store.state.point.list;
  }
  change(e) {
    if (e) {
      this.device.pointName = e.label;
      this.$store.commit("device/edit", this.device);
    }
  }
  save() {
    (this.$refs.deviceForm as any).validate(async (valid: boolean) => {
      if (valid && this.current) {
        this.device.areaId = this.current;
        await this.$store.dispatch({
          type: "device/modify",
          data: this.device
        });
        (this.$refs.deviceForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }

  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = 999;
    pagerequest.index = 1;
    pagerequest.where = {};
    await this.$store.dispatch({
      type: `point/getAll`,
      data: pagerequest
    });
  }
  created() {
    this.getpage();
  }
  cancel() {
    (this.$refs.deviceForm as any).resetFields();
    this.$emit("input", false);
  }
  visibleChange(value: boolean) {
    if (!value) {
      this.$emit("input", value);
    }
  }

  deviceRule = {
    deviceName: [
      {
        required: true,
        message: "设备名必填",
        trigger: "blur"
      }
    ],
    deviceNum: [
      {
        required: true,
        message: "设备编号必填",
        trigger: "blur"
      }
    ],
    deviceType: [
      {
        required: true,
        message: "设备类型必填",
        trigger: "blur"
      }
    ]
  };
}
</script>