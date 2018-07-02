import { Component, Vue, Inject } from "vue-property-decorator";
import auth from "../lib/auth";
import appconst from "./appconst";
export default class AbpBase extends Vue {
  hasPermission(permissionName: string) {
    return auth.hasPermission(permissionName);
  }
  hasAnyOfPermissions(...argus: string[]) {
    return auth.hasAnyOfPermissions(...argus);
  }
  hasAllOfPermissions(...argus: string[]) {
    return auth.hasAllOfPermissions(...argus);
  }
}
