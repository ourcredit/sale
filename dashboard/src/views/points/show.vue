<style lang="less">
@import "./point.less";
</style>
<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <baidu-map @ready="handler"  :scroll-wheel-zoom="true" :center="center" :zoom="15" class="mapshow">
                    <bm-marker v-for="p in points" :position="{lng:p.x,lat:p.y}" :dragging="false" >
                        <bm-label :content="p.pointName" :labelStyle="{color: 'red', fontSize : '24px'}" :offset="{width: -35, height: 30}"/>
                    </bm-marker>
                </baidu-map>
            </div>
        </Card>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "@/lib/abpbase";
import PageRequest from "../../store/entities/page-request";
@Component({
  components: {}
})
export default class PointC extends AbpBase {
  filters: Object = {
    pointName: ""
  };
  center: any = {
    lng: 116.404,
    lat: 39.915
  };
  get points() {
    return this.$store.state.point.list;
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = 999;
    pagerequest.index = 1;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: `point/getAll`,
      data: pagerequest
    });
  }
  handler({ BMap, map }) {}
  async created() {
    this.getpage();
  }
}
</script>