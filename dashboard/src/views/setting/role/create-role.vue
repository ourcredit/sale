<template>
    <div>
        <Modal
         title="添加角色"
         :value="value"
         @on-ok="save"
         @on-visible-change="visibleChange"
        >
            <Form ref="roleForm"  label-position="top" :rules="roleRule" :model="role">
                <Tabs value="detail">
                    <TabPane label="角色详情" name="detail">
                        <FormItem label="角色名" prop="name">
                            <Input v-model="role.name" :maxlength="32" :minlength="2"/>
                        </FormItem>
                        <FormItem label="显示名" prop="displayName">
                            <Input v-model="role.displayName" :maxlength="32" :minlength="2"/>
                        </FormItem>
                      </TabPane>
                    <TabPane label="角色权限" name="permission">
                        <CheckboxGroup v-model="role.permissions">
                            <Checkbox :label="permission.code"
                             v-for="permission in permissions"
                             :key="permission.code"><span>{{permission.name}}</span></Checkbox>
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
    import { Component, Vue,Inject, Prop,Watch } from 'vue-property-decorator';
    import Util from '../../../lib/util'
    import AbpBase from '../../../lib/abpbase'
    import Role from '@/store/entities/role';
    @Component
    export default class CreateRole extends AbpBase{
        @Prop({type:Boolean,default:false}) value:boolean;
        role:Role=new Role();
        get permissions(){
            return this.$store.state.role.permissions
        }
        save(){
            (this.$refs.roleForm as any).validate(async (valid:boolean)=>{
                if(valid){
                    if(!this.role.permissions){
                        this.role.permissions=[];
                    }
                    await this.$store.dispatch({
                        type:'role/create',
                        data:this.role
                    });
                    (this.$refs.roleForm as any).resetFields();
                    this.$emit('save-success');
                    this.$emit('input',false);
                }
            })
        }
        cancel(){
            (this.$refs.roleForm as any).resetFields();
            this.$emit('input',false);
        }
        visibleChange(value:boolean){
            if(!value){
                this.$emit('input',value);
            }
        }
        roleRule={
            name:[{required: true,message: "角色名必填",trigger: 'blur'}],
            displayName:[{required:true,message:"显示名必填",trigger: 'blur'}]
        }
    }
</script>

