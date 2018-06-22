<template>
    <div class="page-body">
        <slot name="filter"></slot>
        <div class="margin-top-10">
            <Table stripe border show-header :loading="loading" :columns="columns" :no-data-text="nodatatext" border :data="list">
            </Table>
            <Page show-sizer class-name="fengpage" :total="totalCount" class="margin-top-10" @on-change="pageChange" @on-page-size-change="pagesizeChange"
                :page-size="pageSize" :current="currentPage"></Page>
        </div>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "../lib/abpbase";
import PageRequest from "../store/entities/page-request";
@Component
export default class SaleTable extends AbpBase {
  constructor() {
    super();
  }
  async created() {
    await this.getpage();
  }
  @Prop({
    required: true
  })
  type: String;
  @Prop({
    required: true
  })
  filters: Object;
  @Prop({
    required: true
  })
  columns: Array<any>;
  @Prop({
    default: false
  })
  stripe: Boolean;
  @Prop({
    default: false
  })
  border: Boolean;
  @Prop({
    default: false
  })
  'show-header': Boolean;
  @Prop({
    default: "暂无数据"
  })
  nodatatext: String = "暂无数据";
  get list() {
    return this.$store.state[`${this.type}`].list;
  }

  get loading() {
    return this.$store.state[`${this.type}`].loading;
  }
  pageChange(page: number) {
    this.$store.commit(`${this.type}/setCurrentPage`, page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit(`${this.type}/setPageSize`, pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: `${this.type}/getAll`,
      data: pagerequest
    });
  }
  get pageSize() {
    return this.$store.state[`${this.type}`].pageSize;
  }
  get totalCount() {
    return this.$store.state[`${this.type}`].totalCount;
  }
  get currentPage() {
    return this.$store.state[`${this.type}`].currentPage;
  }
}
</script>
<style scoped>
.copyright {
  padding: 0 16px;
  margin: 48px 0 24px;
  text-align: center;
  color: rgba(0, 0, 0, 0.45);
  font-size: 14px;
}
</style>