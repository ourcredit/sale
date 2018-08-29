<template>
  <div>
    <Modal title="添加新租户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="tenantForm" label-position="top" :rules="tenantRule" :model="model">
        <FormItem label="租户名" prop="name">
          <Input v-model="model.name" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="显示名" prop="displayName">
          <Input v-model="model.displayName" :maxlength="32" />
        </FormItem>
        <FormItem>
          <Checkbox @on-change="activeChange" :value="model.isActive==1">启用</Checkbox>
        </FormItem>
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
import Util from "../../../lib/util";
import AbpBase from "../../../lib/abpbase";
import Tenant from "../../../store/entities/tenant";
@Component
export default class CreateTenant extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  model: any = {};
  save() {
    console.groupCollapsed("租户信息开始");
    console.group(this.model);
    console.groupEnd();
    let from: any = this.$refs.tenantForm as any;
    from.validate(async (valid: boolean) => {
      if (valid) {
        console.groupCollapsed("租户信息--");
        console.group(this.model);
        console.groupEnd();
        if (this.model && this.model.id) {
          await this.$store.dispatch({
            type: "tenant/update",
            data: this.model
          });
        } else {
          await this.$store.dispatch({
            type: "tenant/insert",
            data: this.model
          });
        }
        (this.$refs.tenantForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }
  activeChange() {
    this.model.isActive = !!!this.model.isActive;
  }
  cancel() {
    (this.$refs.tenantForm as any).resetFields();
    this.$emit("input", false);
  }
  visibleChange(value: boolean) {
    if (!value) {
      this.$emit("input", value);
    }
  }
  tenantRule = {
    name: [
      {
        required: true,
        message: "租户名必填",
        trigger: "blur"
      }
    ],
    displayName: [
      {
        required: true,
        message: "显示名必填",
        trigger: "blur"
      }
    ]
  };
}
</script>