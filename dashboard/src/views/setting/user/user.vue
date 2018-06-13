<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form ref="queryForm" :label-width="80" label-position="left" inline>
                    <Row :gutter="16">
                        <Col span="5">
                            <FormItem label="用户名:" style="width:100%">
                                <Input v-model="filters.account"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="姓名" style="width:100%">
                                <Input v-model="filters.userName"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="状态" style="width:100%">
                                <Select v-model="filters.isActive"
                                 :value="'null'" placeholder="请选择" >
                                    <Option value="null">全部</Option>
                                    <Option value="true">激活</Option>
                                    <Option value="false">禁用</Option>
                                </Select>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="创建时间" style="width:100%">
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
        <create-user v-model="createModalShow" @save-success="getpage"></create-user>
        <edit-user v-model="editModalShow" @save-success="getpage"></edit-user>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import Util from "../../../lib/util";
import AbpBase from "../../../lib/abpbase";
import { FieldType, Filter, CompareType } from "../../../store/entities/filter";
import PageRequest from "../../../store/entities/page-request";
import CreateUser from "./create-user.vue";
import EditUser from "./edit-user.vue";
@Component({
  components: { CreateUser, EditUser }
})
export default class Users extends AbpBase {
  edit() {
    this.editModalShow = true;
  }
  filters: Object = {
    account:'',
    userName:'',
    creationTime:null,
    isActive:null
  };
  createModalShow: boolean = false;
  editModalShow: boolean = false;
  get list() {
    return this.$store.state.user.list;
  }
  get loading() {
    return this.$store.state.user.loading;
  }
  create() {
    this.createModalShow = true;
  }
  pageChange(page: number) {
    this.$store.commit("user/setCurrentPage", page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit("user/setPageSize", pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: "user/getAll",
      data: pagerequest
    });
  }
  get pageSize() {
    return this.$store.state.user.pageSize;
  }
  get totalCount() {
    return this.$store.state.user.totalCount;
  }
  get currentPage() {
    return this.$store.state.user.currentPage;
  }
  columns = [
    {
      title: "用户名",
      key: "account"
    },
    {
      title: "姓名",
      key: "userName"
    },
    {
      title: "状态",
      render: (h: any, params: any) => {
        return h("span", params.row.isActive ? "启用" : "禁用");
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
      title:"最近登陆时间",
      render: (h: any, params: any) => {
        return h("span", new Date(params.row.lastLoginTime).toLocaleString());
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
                    title: this.L("Tips"),
                    content: this.L("DeleteUserConfirm"),
                    okText: this.L("Yes"),
                    cancelText: this.L("No"),
                    onOk: async () => {
                      await this.$store.dispatch({
                        type: "user/delete",
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
    await this.$store.dispatch({
      type: "user/getRoles"
    });
  }
}
</script>