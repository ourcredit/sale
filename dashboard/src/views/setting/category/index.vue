<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form ref="queryForm" :label-width="80" label-position="left" inline>
                    <Row :gutter="16">
                        <Col span="16">
                            <FormItem label="名称:" style="width:100%">
                                <Input v-model="filters.account"></Input>
                            </FormItem>
                        </Col>
                         <Col span="4">
                           <Button  @click="Create" icon="android-add" type="primary" size="large">新增</Button>
                        <Button icon="ios-search" type="primary" size="large"
                         @click="getpage" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                </Form>
                <div class="margin-top-10">
                    <SaleTable ref="table" :filters="filters" :type="'category'" :columns="columns"></SaleTable>
                </div>
            </div>
        </Card>
        <Modify v-model="ModalShow" @save-success="getpage"></Modify>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import AbpBase from "../../../lib/abpbase";
import PageRequest from "../../../store/entities/page-request";
import Modify from "./modify.vue";
import Category from "@/store/entities/category";
import SaleTable from "@/components/saletable.vue";
@Component({
  components: {
    Modify,
    SaleTable
  }
})
export default class Users extends AbpBase {
  filters: any = {
    name: ""
  };
  ModalShow: boolean = false;
  get list() {
    return this.$store.state.category.list;
  }

  get loading() {
    return this.$store.state.category.loading;
  }
  Create() {
    var u = new Category();
    this.$store.commit("category/edit", u);
    this.ModalShow = true;
  }
  Modify() {
    this.ModalShow = true;
  }
  pageChange(page: number) {
    this.$store.commit("category/setCurrentPage", page);
    this.getpage();
  }
  pagesizeChange(pagesize: number) {
    this.$store.commit("category/setPageSize", pagesize);
    this.getpage();
  }
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = this.pageSize;
    pagerequest.index = this.currentPage;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: "category/getAll",
      data: pagerequest
    });
  }
  get pageSize() {
    return this.$store.state.category.pageSize;
  }
  get totalCount() {
    return this.$store.state.category.totalCount;
  }
  get currentPage() {
    return this.$store.state.category.currentPage;
  }
  columns = [
    {
      title: "分类名",
      key: "name"
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
                  this.$store.dispatch({
                    type: "category/get",
                    data: params.row.id
                  });
                  this.Modify();
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
                        type: "category/delete",
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
  async created() {}
}
</script>