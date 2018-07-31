<template>
    <div>
        <Row>
            <Col span="4">
            <Card dis-hover>
                <div class="page-body">
                    <Tree :data="tree"></Tree>
                </div>
            </Card>
            </Col>
            <Col span="20">
            <Card dis-hover>
                <Row :gutter="4">
                    <Col span="6">
                    <Button class="toolbar-btn" @click="save" icon="android-add" type="primary" size="large">保存</Button>
                    </Col>
                </Row>

                <div class="page-body">
                    <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
                        <Split v-model="0.5">
                            <div slot="left" class="demo-split-pane">
                                Left Pane
                            </div>
                            <div slot="right" class="demo-split-pane">
                                Right Pane
                            </div>
                        </Split>

                    </Form>
                </div>
            </Card>
            </Col>
        </Row>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "@/lib/abpbase";
import PageRequest from "../../store/entities/page-request";
import Util from "../../lib/util";

@Component
export default class deviceC extends AbpBase {
  filters: Object = {
    deviceName: ""
  };
  get cates() {
    return this.$store.state.device.deviceCate;
  }
  get tree() {
    return this.$store.state.device.tree;
  }
  async save() {}
  async created() {}
}
</script>