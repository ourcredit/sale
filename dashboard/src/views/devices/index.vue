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
        <div class="page-body">
          <Form slot="filter" ref="queryForm" :label-width="70" label-position="left" inline>
            <Row :gutter="4">
              <Col span="18">
              <FormItem label="设备名:">
                <Input v-model="filters.deviceName" />
              </FormItem>
              <FormItem label="设备编号:">
                <Input v-model="filters.deviceName" />
              </FormItem>
              <FormItem label="设备类型:">
                <Select clearable v-model="filters.deviceType" style="width:160px">
                  <Option v-for="item in cates" :value="item" :key="item">{{ item }}</Option>
                </Select>
              </FormItem>
              <FormItem label="所属点位:">
                <Input v-model="filters.deviceName" />
              </FormItem>
              </Col>
              <Col span="6">
              <Button icon="ios-search" type="primary" size="large" @click="init" class="toolbar-btn">查找</Button>
              <Button class="toolbar-btn" v-if="p.modify" @click="Create" icon="android-add" type="primary" size="large">添加</Button>
              <Button v-if="p.batch" @click="batchDelete" type="primary" class="toolbar-btn" size="large">批量删除</Button>
              </Col>
            </Row>
          </Form>
          <SaleTable ref="table" :filters="filters" :type="'device'" :columns="columns"></SaleTable>
        </div>
      </Card>
      </Col>
    </Row>

    <modify v-model="ModalShow" @save-success="init"></modify>
  </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import SaleTable from "@/components/saletable.vue";
import AbpBase from "@/lib/abpbase";
import PageRequest from "../../store/entities/page-request";
import Util from "../../lib/util";
import Device from "@/store/entities/device";
import Modify from "./modify.vue";

@Component({
  components: {
    SaleTable,
    Modify
  }
})
export default class deviceC extends AbpBase {
  filters: Object = {
    deviceName: ""
  };
  p: any = {
    modify: this.hasPermission("device:modify"),
    delete: this.hasPermission("device:delete"),
    list: this.hasPermission("device:list"),
    first: this.hasPermission("device:first"),
    batch: this.hasPermission("device:batch")
  };
  get cates() {
    return this.$store.state.device.deviceCate;
  }
  ModalShow: boolean = false;
  tree: Array<any> = [
    {
      title: "总部",
      expand: true,
      children: [
        {
          title: "分部1",
          expand: true,
          children: [
            {
              title: "分部2"
            },
            {
              title: "分部3"
            }
          ]
        },
        {
          title: "分部4",
          expand: true,
          children: [
            {
              title: "分部5"
            },
            {
              title: "分部6"
            }
          ]
        }
      ]
    }
  ];
  columns: Array<any> = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "设备名",
      key: "deviceName"
    },
    {
      title: "设备编号",
      key: "deviceName"
    },
    {
      title: "设备类型",
      key: "address"
    },
    {
      title: "所属点位",
      key: "description"
    },
    {
      title: "创建人",
      key: "creatorUserId"
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
        var ed = h(
          "Button",
          {
            props: {
              type: "primary",
              size: "small",
              disabled: !this.p.modify
            },
            style: {
              marginRight: "5px"
            },
            on: {
              click: () => {
                this.$store.dispatch({
                  type: "device/get",
                  data: params.row.id
                });
                this.Modify();
              }
            }
          },
          "编辑"
        );

        var de = h(
          "Button",
          {
            props: {
              type: "error",
              size: "small",
              disabled: !this.p.delete
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
                      type: "device/delete",
                      data: params.row
                    });
                    await this.init();
                  }
                });
              }
            }
          },
          "删除"
        );
        var t = [ed, de];
        return h("div", t);
      }
    }
  ];
  Create() {
    var u = new Device();
    this.$store.commit("device/edit", u);
    this.ModalShow = true;
  }
  init() {
    var t: any = this.$refs.table;
    t.getpage();
  }
  async batchDelete() {
    var t: any = this.$refs.table;
    if (t.selections) {
      this.$Modal.confirm({
        title: "删除提示",
        content: `确认要删除${t.selections.length}条数据么`,
        okText: "是",
        cancelText: "否",
        onOk: async () => {
          await this.$store.dispatch({
            type: "device/batch",
            data: t.selections
          });
          await this.init();
        }
      });
    }
  }
  Modify() {
    this.ModalShow = true;
  }
  async created() {}
}
</script>