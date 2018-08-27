<template>
    <div>
        <Modal title="编辑分类" :value="value" @on-ok="save" @on-visible-change="visibleChange">
            <Form ref="userForm" label-position="top" :rules="userRule" :model="cate">
                        <FormItem label="名称" prop="name">
                            <Input v-model="cate.name" :maxlength="32" :minlength="2"/>
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
import User from "../../../store/entities/user";
import { debug } from "util";
@Component
export default class CreateUser extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  get cate() {
    return this.$store.state.category.editCategory;
  }
  save() {
    (this.$refs.userForm as any).validate(async (valid: boolean) => {
      if (valid) {
        await this.$store.dispatch({
          type: "category/modify",
          data: this.cate
        });
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