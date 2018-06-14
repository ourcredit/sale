<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form ref="queryForm" :label-width="80" label-position="left" inline>
                    <Row :gutter="16">
                        <Col span="5">
                            <FormItem label="菜单名:" style="width:100%">
                                <Input v-model="filters.name"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="权限名:" style="width:100%">
                                <Input v-model="filters.code"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="创建时间:" style="width:100%">
                                <DatePicker  v-model="filters.creationTime"
                                 type="datetimerange" format="yyyy-MM-dd"
                                  style="width:100%" placement="bottom-end"
                                   placeholder="选择时间"></DatePicker>
                            </FormItem>
                        </Col>
                         <Col span="4">
                           <Button @click="create" icon="android-add" type="primary" size="large">新增</Button>
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
import PageRequest from "../../../store/entities/page-request";
@Component({
})
export default class Users extends AbpBase {
  edit() {
    this.editModalShow = true;
  }
  filters: Object = {
    name:'',
    code:'',
    creationTime:null
  };
  createModalShow: boolean = false;
  editModalShow: boolean = false;
  get list() {
    return this.$store.state.menu.list;
  }
  get loading() {
    return this.$store.state.menu.loading;
  }
  create() {
    this.createModalShow = true;
  }
  pageChange(page: number) {
    this.$store.commit("menu/setCurrentPage", page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit("menu/setPageSize", pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: "menu/getAll",
      data: pagerequest
    });
  }
  get pageSize() {
    return this.$store.state.menu.pageSize;
  }
  get totalCount() {
    return this.$store.state.menu.totalCount;
  }
  get currentPage() {
    return this.$store.state.menu.currentPage;
  }
  columns = [
    {
      title: "菜单名",
      key: "name"
    },
    {
      title: "权限码",
      key: "code"
    },
     {
      title: "路径",
      key: "url"
    },
    {
      title: "类型",
      render: (h: any, params: any) => {
        return h("span", params.row.type==1 ? "菜单" : "按钮");
      }
    },
    {
      title: "创建时间",
      key: "creationTime",
      render: (h: any, params: any) => {
        return h(
          "span",
          new Date(params.row.creationTime).toLocaleDateString()
        );
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
                  this.$store.commit("menu/edit", params.row);
                  this.edit();
                }
              }
            },
            "编辑"
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
                    title:"删除提示",
                    content: "确认要删除么",
                    okText: "是",
                    cancelText: "否",
                    onOk: async () => {
                      await this.$store.dispatch({
                        type: "menu/delete",
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