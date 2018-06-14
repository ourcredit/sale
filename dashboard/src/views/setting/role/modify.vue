<template>
    <div>
        <Modal title="编辑角色" :value="value" @on-ok="save" @on-visible-change="visibleChange">
            <Form ref="roleForm" label-position="top" :rules="roleRule" :model="role">
                <Tabs value="detail">
                    <TabPane label="角色详情" name="detail">
                        <FormItem label="角色名" prop="name">
                            <Input v-model="role.roleName" :maxlength="32" :minlength="2" />
                        </FormItem>
                        <FormItem label="显示名" prop="displayName">
                            <Input v-model="role.displayName" :maxlength="32" :minlength="2" />
                        </FormItem>
                    </TabPane>
                    <TabPane label="角色权限" name="permission">
                        <Tree ref="tree" multiple :data="tree" show-checkbox>
                        </Tree>
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
    } from 'vue-property-decorator';
    import Util from '../../../lib/util'
    import AbpBase from '../../../lib/abpbase'
    import Role from '@/store/entities/role';
    @Component
    export default class CreateRole extends AbpBase {
        @Prop({
            type: Boolean,
            default: false
        }) value: boolean;
        get tree() {
            let tree = this.$store.state.role.permissions;
            let res = Util.genderTree(tree, "parentId",this.role.permissions, null);
            return res;
        }
        get role(){
          return  this.$store.state.role.editRole || new Role();
        }
        get permissions() {
            return this.$store.state.role.permissions;
        }
        save() {
            (this.$refs.roleForm as any).validate(async (valid: boolean) => {
                if (valid) {
                    let nodes = (this.$refs.tree as any).getCheckedNodes();
                    let result: Array<any>=new Array<any>() ;
                    nodes.forEach((c:any) => {
                        Util.deptNode(this.permissions, c, result);
                    });
                    if (!result) {
                        this.role.permissions = [];
                    }else{
                        this.role.permissions=[...new Set(result)];
                    }
                    await this.$store.dispatch({
                        type: 'role/create',
                        data: this.role
                    });
                    (this.$refs.roleForm as any).resetFields();
                    this.$emit('save-success');
                    this.$emit('input', false);
                }
            })
        }
        cancel() {
            (this.$refs.roleForm as any).resetFields();
            this.$emit('input', false);
        }
        visibleChange(value: boolean) {
            if (!value) {
                this.$emit('input', value);
            }
        }
        roleRule = {
            name: [{
                required: true,
                message: "角色名必填",
                trigger: 'blur'
            }],
            displayName: [{
                required: true,
                message: "显示名必填",
                trigger: 'blur'
            }]
        }
    }
</script>