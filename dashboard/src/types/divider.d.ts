// type definitions for iview 2.5.1
// project: https://github.com/iview/iview
// definitions by: yangdan
// definitions: https://github.com/yangdan8/iview.git
import Vue from "vue";
export default Divider;

export interface Divider extends Vue {
  /**
   * 进度环顶端的形状，可选值为square（方）和round（圆）
   * @default horizontal
   */
  type: "horizontal" | "vertical";
  /**
   * 进度环的线宽，单位 px
   * @default center
   */
  orientation: "left" | "right" | "center";
  /**
   * 进度环的颜色
   * @default false
   */
  dashed: boolean;
  $slot: {
    /**
     * 自定义显示中间内容，内容默认垂直居中
     */
    "": Vue;
  };
}
