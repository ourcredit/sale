import { Component, Vue, Inject } from "vue-property-decorator";
import appconst from "./appconst";
export default class AbpBase extends Vue {
  hasPermission(permissionName: string) {
    return window.abp.auth.hasPermission(permissionName);
  }
  hasAnyOfPermissions(...argus: string[]) {
    return window.abp.auth.hasAnyOfPermissions(...argus);
  }
  hasAllOfPermissions(...argus: string[]) {
    return window.abp.auth.hasAllOfPermissions(...argus);
  }
}
