<template>
    <div>
        <Modal title="添加新租户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
            <Form ref="userForm" label-position="top" :rules="tenantRule" :model="tenant">
                        <FormItem label="租户名" prop="name">
                            <Input v-model="tenant.name" :maxlength="32" :minlength="2"/>
                        </FormItem>
                        <FormItem label="显示名" prop="displayName">
                            <Input v-model="tenant.displayName" :maxlength="32"/>
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
import { debug } from "util";
@Component
export default class CreateTenant extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  get tenant() {
    var u = this.$store.state.tenant.editTenant;
    return u;
  }
  save() {
    (this.$refs.userForm as any).validate(async (valid: boolean) => {
      if (valid) {
        let type =
          this.tenant && this.tenant.id ? "tenant/update" : "tenant/insert";
        await this.$store.dispatch({
          type: type,
          data: this.tenant
        });
        (this.$refs.userForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }

  activeChange() {
    this.tenant.isActive = !!!this.tenant.isActive;
  }
  cancel() {
    (this.$refs.userForm as any).resetFields();
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