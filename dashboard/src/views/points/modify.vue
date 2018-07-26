<style lang="less">
@import "./point.less";
</style>
<template>
  <div>
    <Modal title="编辑点位" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="pointForm" label-position="top" :rules="pointRule" :model="point">
        <FormItem label="点位名称" prop="pointName">
          <Input v-model="point.pointName" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="地址" prop="address">
          <Input v-model="point.address" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="描述" prop="description">
          <Input v-model="point.description" :maxlength="255"  />
        </FormItem>
        <baidu-map @ready="handler" @click="draw" :scroll-wheel-zoom="true" :center="{lng: 116.404, lat: 39.915}" :zoom="15"  class="map">
          <bm-marker :position="tempPoint" :dragging="false" animation="BMAP_ANIMATION_BOUNCE">
                   </bm-marker>
        </baidu-map>
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
import Point from "@/store/entities/point";
@Component
export default class CreatePoint extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  get point() {
    return this.$store.state.point.editPoint;
  }
  tempPoint: any ={lng: 116.404, lat: 39.915};
  save() {
    (this.$refs.pointForm as any).validate(async (valid: boolean) => {
      if (valid) {
        await this.$store.dispatch({
          type: "point/modify",
          data: this.point
        });
        (this.$refs.pointForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }
  handler({ BMap, map }) {}
  draw(e) {
    this.tempPoint.lng = e.point.lng;
    this.tempPoint.lat = e.point.lat;
    (this.point.x = e.point.lng), (this.point.y = e.point.lat);
  }
  cancel() {
    (this.$refs.pointForm as any).resetFields();
    this.$emit("input", false);
  }
  visibleChange(value: boolean) {
    if (!value) {
      this.$emit("input", value);
    }
  }

  pointRule = {
    pointName: [
      {
        required: true,
        message: "点位名必填",
        trigger: "blur"
      }
    ]
  };
}
</script>