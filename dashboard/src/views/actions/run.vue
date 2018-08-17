<template>
    <div>
        <Card dis-hover>
            <div class="page-body">
                <Form slot="filter" ref="queryForm" :label-width="80" label-position="left" inline>
                    <Row :gutter="16">
                        <Col span="5">
                            <FormItem label="设备名称:" style="width:100%">
                                <Input v-model="filters.method"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                            <FormItem label="设备编号" style="width:100%">
                                <Input v-model="filters.log_description"></Input>
                            </FormItem>
                        </Col>
                        <Col span="5">
                             <FormItem label="点位名称" style="width:100%">
                                <Input v-model="filters.log_description"></Input>
                            </FormItem>
                        </Col>
                         <Col span="5">
                             <FormItem label="设备类型" style="width:100%">
                                <Input v-model="filters.log_description"></Input>
                            </FormItem>
                        </Col>
                         <Col span="4">
                        <Button icon="ios-search" type="primary" size="large"
                         @click="init" class="toolbar-btn">查找</Button>
                        </Col>
                    </Row>
                
                </Form>
                <SaleTable ref="table" :filters="filters" type="log" :columns="columns"></SaleTable>
            </div>
        </Card>
    </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import SaleTable from "@/components/saletable.vue";
import AbpBase from "../../lib/abpbase";
@Component({
  components: {
    SaleTable
  }
})
export default class OperateLog extends AbpBase {
  filters: Object = {
    method: "",
    log_description: "",
    create_time: ""
  };
  p: any = {
    delete: this.hasPermission("log:delete"),
    list: this.hasPermission("log:list"),
    batch: this.hasPermission("log:batch")
  };
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
            type: "log/batch",
            data: t.selections
          });
          await this.init();
        }
      });
    }
  }
  columns = [
    {
      type: "selection",
      width: 60,
      align: "center"
    },
    {
      title: "设备编号",
      key: "className"
    },
    {
      title: "设备名称",
      key: "method"
    },

    {
      title: "设备类型",
      key: "ip"
    },
    {
      title: "所属点位",
      key: "logDescription"
    },
    {
      title: "运行日志",
      render: (h: any, params: any) => {
        return h("span", params.row.succeed ? "成功" : "失败");
      }
    }
  ];
  async created() {}
}
</script>