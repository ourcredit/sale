<template>
  <Card dis-hover>
    <ButtonGroup >
        <Button @click="add" type="ghost" icon="plus"></Button>
        <Button @click="modify" type="ghost" icon="edit"></Button>
        <Button @click="del" type="ghost" icon="close"></Button>
    </ButtonGroup>
    <div class="page-body">
      <Tree @on-select-change="select" :data="tree" ></Tree>
    </div>
    <Modal :mask-closable="false" title="编辑机构" :value="modifyShow" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="deviceForm" label-position="top" :rules="orgRule" :model="org">
        <FormItem label="机构名" prop="name">
          <Input v-model="org.name" :maxlength="32" :minlength="2" />
        </FormItem>
        </Tabs>
      </Form>
      <div slot="footer">
        <Button @click="cancel">关闭</Button>
        <Button @click="save" type="primary">保存</Button>
      </div>
    </Modal>
  </Card>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "../lib/abpbase";
@Component
export default class OrgTree extends AbpBase {
  constructor() {
    super();
  }
  modifyShow: boolean = false;
  async created() {
    this.init();
  }
  async init() {
    await this.$store.dispatch({
      type: "device/initTree",
      data: {}
    });
  }
  add() {
    this.$store.commit("device/setCurrent", { parentId: this.parent });
    this.modifyShow = true;
  }
  modify() {
    if (!this.org) return;
    this.modifyShow = true;
  }
  del() {
    if (!this.org) return;
    this.$Modal.confirm({
      title: "删除提示",
      content: "确认要删除么",
      okText: "是",
      cancelText: "否",
      onOk: async () => {
        await this.$store.dispatch({
          type: "device/delOrg",
          data: this.org.id
        });
        await this.init();
      }
    });
  }
  select(opt) {
    var temp = opt[0];
    if (temp) {
      this.$store.commit("device/setTree", temp.id);
      this.$store.commit("device/setCurrent", temp);
    } else {
      this.$store.commit("device/setTree", null);
    }
    this.$emit("complete");
  }

  get tree() {
    return this.$store.state.device.tree;
  }
  get org() {
    var t = this.$store.state.device.current;
    return t;
  }
  get parent() {
    var t = this.$store.state.device.currentOrg;
    return t;
  }
  save() {
    (this.$refs.deviceForm as any).validate(async (valid: boolean) => {
      if (valid) {
        await this.$store.dispatch({
          type: "device/modifyOrg",
          data: this.org
        });
        (this.$refs.deviceForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
        this.modifyShow = false;
        this.init();
      }
    });
  }
  cancel() {
    (this.$refs.deviceForm as any).resetFields();
    this.$emit("input", false);
    this.modifyShow = false;
    this.init();
  }
  visibleChange(value: boolean) {
    if (!value) {
      this.$emit("input", value);
    }
  }

  orgRule = {
    name: [
      {
        required: true,
        message: "机构名必填",
        trigger: "blur"
      }
    ]
  };
}
</script>