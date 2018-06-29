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
                   <Tree :data="tree" :render="renderContent"></Tree>
                </div>
            </div>
        </Card>
        <Modify :parent="parent" v-model="ModelShow" @save-success="getpage"></Modify>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import Util from "../../../lib/util";
import AbpBase from "../../../lib/abpbase";
import PageRequest from "../../../store/entities/page-request";
import Modify from "./modify.vue";
@Component({
  components: {
    Modify
  }
})
export default class Menus extends AbpBase {
  edit() {
    this.ModelShow = true;
  }
  filters: Object = {
    name: "",
    code: "",
    creationTime: null
  };
  parent: any = null;
  ModelShow: boolean = false;
  get tree() {
    let tree = this.$store.state.menu.list;
    let res = Util.genderMenu(tree, "parentId", null);
    return res;
  }

  create() {
    this.ModelShow = true;
  }

  renderContent(h: any, { root, node, data }: any) {
    return h(
      "span",
      {
        style: {
          display: "inline-block",
          width: "40%"
        }
      },
      [
        h("span", [
          h("Icon", {
            props: {
              type: "ios-paper-outline"
            },
            style: {
              marginRight: "10px"
            }
          }),
          h("span", data.title)
        ]),
        h(
          "span",
          {
            style: { marginLeft: "30px" }
          },
          data.url
        ),
        h(
          "span",
          {
            style: { marginLeft: "30px" }
          },
          data.code
        ),
        h("Icon", {
          props: {
            type: data.type == 1 ? "android-share-alt" : "android-list"
          },
          style: {
            marginLeft: "10px"
          }
        }),
        h(
          "span",
          {
            style: {
              display: "inline-block",
              float: "right",
              marginRight: "32px"
            }
          },
          [
            h("Button", {
              props: Object.assign(
                {},
                {
                  type: "info",
                  size: "small"
                },
                {
                  icon: "plus"
                }
              ),
              style: {
                marginRight: "8px"
              },
              on: {
                click: () => {
                  if (data.type == 1) {
                    this.parent = data;
                    this.ModelShow = true;
                  }
                }
              }
            }),
            h("Button", {
              props: Object.assign(
                {},
                {
                  type: "warning",
                  size: "small"
                },
                {
                  icon: "scissors"
                }
              ),
              style: {
                marginRight: "8px"
              },
              on: {
                click: () => {
                  this.ModelShow = true;
                }
              }
            }),
            h("Button", {
              props: Object.assign(
                {},
                {
                  type: "error",
                  size: "small"
                },
                {
                  icon: "close"
                }
              ),
              on: {
                click: () => {}
              }
            })
          ]
        )
      ]
    );
  }

  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = 999;
    pagerequest.index = 1;
    pagerequest.where = this.filters;
    await this.$store.dispatch({
      type: "menu/getAll",
      data: pagerequest
    });
  }
  async created() {
    this.getpage();
  }
}
</script>