<style lang="less">
@import "./product.less";
</style>
<template>
  <div>
    <Modal title="编辑商品" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="productForm" label-position="top" :rules="productRule" :model="product">
        <FormItem label="商品名" prop="productName">
          <Input v-model="product.productName" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="商品编号" prop="productNum">
          <Input v-model="product.productNum" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="商品类型" prop="productType">
          <Select v-model="product.productType" style="width:100%">
            <Option v-for="item in cates" :value="item" :key="item">{{ item }}</Option>
          </Select>
        </FormItem>
        <FormItem label="价格" prop="price">
            <InputNumber style="width:100%"  v-model="product.price"  :maxlength="32" :minlength="2" />
        </FormItem>
        </Tabs>
      </Form>
      <div slot="footer">
        <Button @click="cancel">关闭</Button>
        <Button @click="save" type="primary">保存</Button>
      </div>
    </Modal>
  </div>
</template>
<script lang="ts">
import { Component, Vue, Inject, Prop, Watch } from "vue-property-decorator";
import Util from "@/lib/util";
import AbpBase from "@/lib/abpbase";
import PageRequest from "../../store/entities/page-request";
import Product from "@/store/entities/product";
@Component
export default class CreateDevice extends AbpBase {
  @Prop({
    type: Boolean,
    default: false
  })
  value: boolean;
  get product() {
    return this.$store.state.product.editProduct;
  }
  get cates() {
    return this.$store.state.product.productCate;
  }
  save() {
    (this.$refs.productForm as any).validate(async (valid: boolean) => {
      if (valid) {
        await this.$store.dispatch({
          type: "product/modify",
          data: this.product
        });
        (this.$refs.productForm as any).resetFields();
        this.$emit("save-success");
        this.$emit("input", false);
      }
    });
  }
  
  async getpage() {
    let pagerequest = new PageRequest();
    pagerequest.size = 999;
    pagerequest.index = 1;
    pagerequest.where = {};
    await this.$store.dispatch({
      type: `point/getAll`,
      data: pagerequest
    });
  }
  created() {
    this.getpage();
  }
  cancel() {
    (this.$refs.productForm as any).resetFields();
    this.$emit("input", false);
  }
  visibleChange(value: boolean) {
    if (!value) {
      this.$emit("input", value);
    }
  }

  productRule = {
    productName: [
      {
        required: true,
        message: "商品名必填",
        trigger: "blur"
      }
    ],
    productNum: [
      {
        required: true,
        message: "商品编号必填",
        trigger: "blur"
      }
    ],
    productType: [
      {
        required: true,
        message: "商品类型必填",
        trigger: "blur"
      }
    ]
  };
}
</script>