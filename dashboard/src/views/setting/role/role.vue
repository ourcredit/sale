<template>
  <div>
    <Card dis-hover>
      <div class="page-body">
        <Form ref="queryForm" :label-width="60" label-position="left" inline>
          <Row :gutter="4">
            <Col span="4">
            <FormItem label="角色名:">
              <Input v-model="filters.roleName"></Input>
            </FormItem>
            </Col>
            <Col span="4">
            <FormItem label="显示名:">
              <Input v-model="filters.displayName"></Input>
            </FormItem>
            </Col>
            <Col span="4">
            <Button v-if="p.modify" @click="create" icon="android-add" type="primary" size="large">添加</Button>
            <Button icon="ios-search" type="primary" size="large" @click="getpage" class="toolbar-btn">查找</Button>
            </Col>
          </Row>
        </Form>
        <div class="margin-top-10">
          <Table :loading="loading" :columns="columns" no-data-text="暂无数据" border :data="list">
          </Table>
          <Page show-sizer class-name="fengpage" :total="totalCount" class="margin-top-10" @on-change="pageChange" @on-page-size-change="pagesizeChange"
            :page-size="pageSize" :current="currentPage"></Page>
        </div>
      </div>
    </Card>
    <modify v-model="modalShow" @save-success="getpage"></modify>
  </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import util from "../../../lib/util";
import AbpBase from "../../../lib/abpbase";
import PageRequest from "../../../store/entities/page-request";
import Modify from "./modify.vue";
import Role from "@/store/entities/role";
@Component({
  components: {
    Modify
  }
})
export default class Roles extends AbpBase {
  filters: Object = {
    roleName: "",
    displayName: ""
  };
  modalShow: boolean = false;
  get list() {
    return this.$store.state.role.list;
  }
  get p() {
    console.log(util.abp.auth);
    var t = {
      modify: util.abp.auth.hasPermission("role:modify"),
      delete: util.abp.auth.hasPermission("role:delete"),
      batch: util.abp.auth.hasPermission("role:batch")
    };
    console.log(t);
    return t;
  }
  get loading() {
    return this.$store.state.role.loading;
  }
  create() {
    this.$store.commit("role/edit", new Role());
    this.modalShow = true;
  }
  modify() {
    this.modalShow = true;
  }
  pageChange(page: number) {
    this.$store.commit("role/setCurrentPage", page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit("role/setPageSize", pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: "role/getAll",
      data: pagerequest
    });
  }
  get pageSize() {
    return this.$store.state.role.pageSize;
  }
  get totalCount() {
    return this.$store.state.role.totalCount;
  }
  get currentPage() {
    return this.$store.state.role.currentPage;
  }
  columns = [
    {
      title: "角色名",
      key: "roleName"
    },
    {
      title: "显示名",
      key: "displayName"
    },
    {
      title: "描述",
      key: "description"
    },
    {
      title: "状态",
      key: "isActive",
      render: (h: any, params: any) => {
        return h("span", params.row.isActive == 1 ? "启用" : "禁用");
      }
    },
    {
      title: "是否静态",
      key: "isStatic",
      render: (h: any, params: any) => {
        return h("span", params.row.isStatic == 1 ? "静态" : "非静态");
      }
    },
    {
      title: "创建时间",
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
                  this.$store.dispatch({
                    type: "role/get",
                    data: params.row.id
                  });
                  this.modify();
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
                    title: "删除提示",
                    content: "确认要删除么",
                    okText: "是",
                    cancelText: "否",
                    onOk: async () => {
                      await this.$store.dispatch({
                        type: "role/delete",
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
      type: "role/getAllPermissions"
    });
  }
}
</script>