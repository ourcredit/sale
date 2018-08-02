<template>
     <Card dis-hover>
        <div class="page-body">
          <Tree @on-select-change="select" :data="tree"></Tree>
        </div>
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
  async created() {
    await this.$store.dispatch({
      type: "device/initTree",
      data: {}
    });
  }
  select(opt) {
    var temp = opt[0];
    if (temp) {
      this.$store.commit("device/setTree", temp.id);
    } else {
      this.$store.commit("device/setTree", null);
    }
    this.$emit("complete");
  }
  get tree() {
    return this.$store.state.device.tree;
  }
}
</script>
