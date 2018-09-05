<template>
  <Card dis-hover>
    <ButtonGroup v-if="state" >
        <Button @click="add" type="ghost" icon="plus"></Button>
        <Button @click="modify" type="ghost" icon="edit"></Button>
        <Button @click="del" type="ghost" icon="close"></Button>
    </ButtonGroup>
    <div class="page-body">
      <Tree @on-select-change="select" :data="tree" ></Tree>
    </div>
    <modify v-model="modifyShow" @save-success="init"></modify>
  </Card>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "../lib/abpbase";
import Modify from "./treemodify.vue";
@Component({
  components: {
    Modify
  }
})
export default class OrgTree extends AbpBase {
  constructor() {
    super();
  }
  @Prop({
    type: Boolean,
    default: false
  })
  state: Boolean;
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
    this.$store.commit("device/setCurrent", { parentId: this.parent.id });
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
      if (temp.title == "未分配设备") {
        this.$store.commit("device/setTree", null);
      } else {
        this.$store.commit("device/setTree", temp);
        this.$store.commit("device/setCurrent", temp);
      }
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
}
</script>