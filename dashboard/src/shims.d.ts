import Vue, { VNode } from "vue";

declare module "*.vue" {
  export default Vue;
}

declare global {
  namespace JSX {
    // tslint:disable no-empty-interface
    interface IElement extends VNode {}
    // tslint:disable no-empty-interface
    interface IElementClass extends Vue {}
    interface IntrinsicElements {
      [elem: string]: any;
    }
  }
  interface IWindow {
    abp: any;
  }
}
