<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form ref="queryForm" :label-width="80" label-position="left" inline>
                    <Row :gutter="16">
                        <Col span="5">
                            <FormItem label="方法:" style="width:100%">
                                <Input v-model="filters.method"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="描述" style="width:100%">
                                <Input v-model="filters.log_description"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="时间范围" style="width:100%">
                                <DatePicker  v-model="filters.create_time"
                                 type="datetimerange" format="yyyy-MM-dd"
                                  style="width:100%" placement="bottom-end"
                                   placeholder="选择时间"></DatePicker>
                            </FormItem>
                        </Col>
                         <Col span="4">
                        <Button icon="ios-search" type="primary" size="large"
                         @click="getpage" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                
                </Form>
                <div class="margin-top-10">
                    <Table :loading="loading" :columns="columns" no-data-text="暂无数据" border :data="list">
                    </Table>
                    <Page  show-sizer class-name="fengpage" :total="totalCount"
                     class="margin-top-10"
                      @on-change="pageChange"
                       @on-page-size-change="pagesizeChange"
                        :page-size="pageSize"
                         :current="currentPage"></Page>
                </div>
            </div>
        </Card>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import Util from "../../../lib/util";
import AbpBase from "../../../lib/abpbase";
import { FieldType, Filter, CompareType } from "../../../store/entities/filter";
import PageRequest from "../../../store/entities/page-request";
@Component({})
export default class Users extends AbpBase {
  filters: Object = {
      method:'',
      log_description:'',
      create_time:'',
  } ;
  get list() {
    return this.$store.state.log.list;
  }
  get loading() {
    return this.$store.state.log.loading;
  }
  pageChange(page: number) {
    this.$store.commit("log/setCurrentPage", page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit("log/setPageSize", pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: "log/getAll",
      data: pagerequest
    });
  }
  get pageSize() {
    return this.$store.state.log.pageSize;
  }
  get totalCount() {
    return this.$store.state.log.totalCount;
  }
  get currentPage() {
    return this.$store.state.log.currentPage;
  }
  columns = [
    {
      title: "类名",
      key: "className"
    },
    {
      title: "方法",
      key: "method"
    },

    {
      title: "请求地址",
      key: "ip"
    },
    {
      title: "接口描述",
      key: "logDescription"
    },
    {
      title: "状态",
      render: (h: any, params: any) => {
        return h("span", params.row.succeed ? "成功" : "失败");
      }
    },
    {
      title: "请求时间",
      key: "createTime",
      render: (h: any, params: any) => {
        return h("span", new Date(params.row.createTime).toLocaleDateString());
      }
    },
    {
      title: "操作",
      key: "Actions",
      width: 150,
      render: (h: any, params: any) => {
        return h("div", [
          h(
            "Button",
            {
              props: {
                type: "primary",
                size: "small"
              },
              style: {
                marginRight: "5px"
              },
              on: {
                click: () => {
                  this.$store.commit("user/edit", params.row);
                }
              }
            },
            "详情"
          ),
          h(
            "Button",
            {
              props: {
                type: "error",
                size: "small"
              },
              on: {
                click: async () => {
                  this.$Modal.confirm({
                    title: "提示",
                    content: "确认要删除该条信息么",
                    okText:"是",
                    cancelText: "否",
                    onOk: async () => {
                      await this.$store.dispatch({
                        type: "log/delete",
                        data: params.row
                      });
                      await this.getpage();
                    }
                  });
                }
              }
            },
            "删除"
          )
        ]);
      }
    }
  ];
  async created() {
    this.getpage();
  }
}
</script>