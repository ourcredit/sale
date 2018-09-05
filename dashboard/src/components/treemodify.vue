<style lang="less">
</style>
<template>
  <div>
     <Modal :mask-closable="false" title="编辑机构" :closable="false" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="deviceForm" label-position="top" :rules="orgRule" :model="org">
        <FormItem label="机构名" prop="name">
          <Input v-model="org.name" :maxlength="32" :minlength="2" />
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
import Product from "@/store/entities/product";
import auth from "@/lib/auth";
@Component
export default class CreateTree extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  get tree() {
    return this.$store.state.device.tree;
  }
  get org() {
    var t = this.$store.state.device.current;
    return t;
  }
  get parent() {
    var t = this.$store.state.device.currentOrg;
    return t;
  }
  save() {
    (this.$refs.deviceForm as any).validate(async (valid: boolean) => {
      if (valid) {
        await this.$store.dispatch({
          type: "device/modifyOrg",
          data: this.org
        });
        (this.$refs.deviceForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }
  orgRule = {
    name: [
      {
        required: true,
        message: "机构名必填",
        trigger: "blur"
      }
    ]
  };
  cancel() {
    (this.$refs.deviceForm as any).resetFields();
    this.$emit("input", false);
  }
  visibleChange(value: boolean) {
    if (!value) {
      this.$emit("input", value);
    }
  }
}
</script>