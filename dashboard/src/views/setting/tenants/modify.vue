<template>
  <div>
    <Modal title="添加新租户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="tenantForm" label-position="top"  :model="tenant">
        <FormItem label="租户名" prop="name">
          <Input v-model="tenant.name" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="显示名" prop="displayName">
          <Input v-model="tenant.displayName" :maxlength="32" />
        </FormItem>
        <FormItem>
          <Checkbox @on-change="activeChange" :value="tenant.isActive==1">启用</Checkbox>
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
  get tenant() {
    var t = this.$store.state.tenant.editTenant;
    console.log(t);
    return t;
  }
  save() {
    var _ = this;
    console.groupCollapsed("租户信息开始");
    console.group(_.tenant);
    console.groupEnd();
    (_.$refs.tenantForm as any).validate(async (valid: boolean) => {
      if (valid) {
        console.groupCollapsed("租户信息--");
        console.group(_.tenant);
        console.groupEnd();
        debugger;
        if (_.tenant && _.tenant.id) {
          await _.$store.dispatch({
            type: "tenant/update",
            data: _.tenant
          });
        } else {
          await _.$store.dispatch({
            type: "tenant/insert",
            data: _.tenant
          });
        }
        (_.$refs.tenantForm as any).resetFields();
        _.$emit("save-success");
        _.$emit("input", false);
      }
    });
  }
  activeChange() {
    this.tenant.isActive = !!!this.tenant.isActive;
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