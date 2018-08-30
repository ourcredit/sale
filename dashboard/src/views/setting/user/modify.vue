<template>
    <div>
        <Modal title="添加新用户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
            <Form ref="userForm" label-position="top" :rules="userRule" :model="user">
                <Tabs value="detail">
                    <TabPane label="用户详情" name="detail">
                        <FormItem label="账户" prop="account">
                            <Input v-model="user.account" :maxlength="32" :minlength="2"/>
                        </FormItem>
                        <FormItem label="用户名" prop="userName">
                            <Input v-model="user.userName" :maxlength="32"/>
                        </FormItem>
                        <FormItem label="密码" prop="password">
                            <Input v-model="user.password" type="password" :maxlength="32"></Input>
                        </FormItem>
                        <FormItem label="确认密码" prop="confirmPassword">
                            <Input v-model="user.confirmPassword" type="password" :maxlength="32"></Input>
                        </FormItem>
                        <FormItem>
                            <Checkbox @on-change="activeChange" :value="user.isActive==1">启用</Checkbox>
                        </FormItem>
                    </TabPane>
                    <TabPane label="角色信息" name="roles">
                        <CheckboxGroup @on-change="roleChange" v-model="selectRoles">
                            <Checkbox :label="role.id"  v-for="role in roles" :key="role.id">
                                <span>{{role.displayName}}</span>
                            </Checkbox>
                        </CheckboxGroup>
                    </TabPane>
                     <TabPane label="机构信息" name="trees">
                       <Tree @on-select-change="select" :data="tree"></Tree>
                    </TabPane>
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
  selectRoles: Array<any> = new Array<any>();
  get roles() {
    return this.$store.state.user.roles;
  }
  get tree() {
    return this.$store.state.device.tree;
  }
  get current() {
    var t = this.$store.state.device.current;
    console.log(t);
    return t;
  }
  get user() {
    var u = this.$store.state.user.editUser;
    if (u.id) {
      if (u.roles && u.roles.length > 0) {
        this.selectRoles = u.roles.map((c: any) => {
          if (c instanceof Object) return c.id;
          return c;
        });
      }
    }
    return u;
  }
  select(opt) {
    var temp = opt[0];
    if (temp) {
      if (temp.title == "未分配设备") {
      } else {
        this.user.areaId = temp.id;
      }
    } else {
    }
  }
  save() {
    (this.$refs.userForm as any).validate(async (valid: boolean) => {
      if (valid) {
        this.user.roles = this.selectRoles;
        if (this.current && this.current.id) {
          this.user.areaId = this.current.id;
        }

        await this.$store.dispatch({
          type: "user/modify",
          data: this.user
        });
        (this.$refs.userForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }
  activeChange() {
    this.user.isActive = !!!this.user.isActive;
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
  roleChange(r) {
    this.selectRoles = r;
    console.log(this.selectRoles);
  }
  validatePassCheck = (rule: any, value: any, callback: any) => {
    if (!value) {
      callback(new Error("密码必填"));
    } else if (value !== this.user.password) {
      callback(new Error("密码不一致"));
    } else {
      callback();
    }
  };
  userRule = {
    account: [
      {
        required: true,
        message: "账户必填",
        trigger: "blur"
      }
    ],
    userName: [
      {
        required: true,
        message: "姓名必填",
        trigger: "blur"
      }
    ]
  };
}
</script>