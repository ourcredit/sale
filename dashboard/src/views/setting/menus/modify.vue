<template>
    <div>
        <Modal title="编辑菜单" :value="value" @on-ok="save" @on-visible-change="visibleChange">
            <Form ref="roleForm" label-position="top" :rules="menuRule" :model="menu">
                  <FormItem label="上级菜单" >
                    <Input v-model="menu.parentName" disabled :maxlength="32" :minlength="2" />
                </FormItem>
                <FormItem label="菜单名" prop="name">
                    <Input v-model="menu.name" :maxlength="32" :minlength="2" />
                </FormItem>
                <FormItem label="路径" prop="url">
                    <Input v-model="menu.url" :maxlength="32" :minlength="2" />
                </FormItem>
                <FormItem label="权限" prop="code">
                    <Input v-model="menu.code" :maxlength="32" :minlength="2" />
                </FormItem>
                <FormItem label="类型" prop="type">
                    <RadioGroup v-model="menu.type">
                        <Radio :label="1">菜单</Radio>
                        <Radio :label="2">按钮</Radio>
                    </RadioGroup>
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
import AbpBase from "../../../lib/abpbase";
import Role from "@/store/entities/role";
@Component
export default class CreateRole extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  @Prop({
    type: Object,
    default: null
  })
  parent: any;
  get menu() {
    var menu = this.$store.state.menu.editMenu;
    menu.type = menu.type ? 1 : 2;
    if (this.parent) {
      menu.parentId = this.parent.id;
      menu.parentName = this.parent.title;
    }
    console.log(menu);
    return menu;
  }
  save() {
    (this.$refs.roleForm as any).validate(async (valid: boolean) => {
      if (valid) {
        await this.$store.dispatch({
          type: "menu/modify",
          data: this.menu
        });
        (this.$refs.roleForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }
  cancel() {
    (this.$refs.roleForm as any).resetFields();
    this.$emit("input", false);
  }
  visibleChange(value: boolean) {
    if (!value) {
      this.$emit("input", value);
    }
  }
  menuRule = {
    name: [
      {
        required: true,
        message: "菜单名必填",
        trigger: "blur"
      }
    ]
  };
}
</script>