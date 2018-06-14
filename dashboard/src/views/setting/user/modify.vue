<template>
    <div>
        <Modal title="添加新用户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
            <Form ref="userForm" label-position="top" :rules="userRule" :model="user">
                <Tabs value="detail">
                    <TabPane label="用户详情" name="detail">
                        <FormItem label="账户" prop="account">
                            <Input v-model="user.account" :maxlength="32" :minlength="2"></Input>
                        </FormItem>
                        <FormItem label="用户名" prop="userName">
                            <Input v-model="user.userName" :maxlength="32"></Input>
                        </FormItem>
                        <FormItem label="手机" prop="mobile">
                            <Input v-model="user.mobile" type="text" :maxlength="32"></Input>
                        </FormItem>
                        <FormItem label="密码" prop="password">
                            <Input v-model="user.password" type="password" :maxlength="32"></Input>
                        </FormItem>
                        <FormItem label="确认密码" prop="confirmPassword">
                            <Input v-model="user.confirmPassword" type="password" :maxlength="32"></Input>
                        </FormItem>
                        <FormItem>
                            <Checkbox :on-change="activeChange" :value="user.isActive==1">启用</Checkbox>
                        </FormItem>
                    </TabPane>
                    <TabPane label="角色信息" name="roles">
                        <CheckboxGroup v-model="user.roles">
                            <Checkbox :label="role.id"  v-for="role in roles" :key="role.id">
                                <span>{{role.displayName}}</span>
                            </Checkbox>
                        </CheckboxGroup>
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
    import {
        Component,
        Vue,
        Inject,
        Prop,
        Watch
    } from "vue-property-decorator";
    import Util from "../../../lib/util";
    import AbpBase from "../../../lib/abpbase";
    import User from "../../../store/entities/user";
    @Component
    export default class CreateUser extends AbpBase {
        @Prop({
            type: Boolean,
            default: false
        })
        value: boolean;
        get roles() {
            return this.$store.state.user.roles;
        }
        get user() {
            var u= this.$store.state.user.editUser || new User();
            if(u.roles&&u.roles.length>0){
                u.roles=u.roles.map((c:any)=>c.id);
            }
            console.log(u);
            return u;
        }
        save() {
            (this.$refs.userForm as any).validate(async (valid: boolean) => {
                if (valid) {
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
        activeChange(){
            this.user.isActive=!this.user.isActive;
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
            account: [{
                required: true,
                message: "账户必填",
                trigger: "blur"
            }],
            userName: [{
                required: true,
                message: "姓名必填",
                trigger: "blur"
            }],
            password: [{
                required: true,
                message: "密码必填",
                trigger: "blur"
            }],
            confirmPassword: {
                validator: this.validatePassCheck,
                trigger: "blur"
            }
        };
    }
</script>