<template>
    <div>
        <Modal title="编辑租户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
            <Form ref="userForm" label-position="top" :rules="userRule" :model="cate">
                        <FormItem label="名称" prop="name">
                            <Input v-model="cate.name" :maxlength="32" />
                        </FormItem>
                          <FormItem label="显示名" prop="name">
                            <Input v-model="cate.displayName" :maxlength="32" />
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
  get cate() {
    return this.$store.state.tenant.editTenant;
  }
  save() {
    var _ = this;
    console.groupCollapsed("租户信息开始");
    console.group(_.cate);
    console.groupEnd();
    (this.$refs.userForm as any).validate(async (valid: boolean) => {
      if (valid) {
        console.groupCollapsed("租户信息--");
        console.group(_.cate);
        console.groupEnd();
        debugger;
        if (_.cate && _.cate.id) {
          await _.$store.dispatch({
            type: "tenant/update",
            data: _.cate
          });
        } else {
          await _.$store.dispatch({
            type: "tenant/insert",
            data: _.cate
          });
        }
        (this.$refs.userForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
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
  userRule = {
    name: [
      {
        required: true,
        message: "名称必填",
        trigger: "blur"
      }
    ]
  };
}
</script>