import { Component, Vue, Inject } from "vue-property-decorator";
import auth from "@/lib/auth";
import appconst from "@/lib/appconst";
export default class AbpBase extends Vue {
  hasPermission(permissionName: string): boolean {
    return auth.hasPermission(permissionName);
  }
  hasAnyOfPermissions(...argus: string[]): boolean {
    return auth.hasAnyOfPermissions(...argus);
  }
  hasAllOfPermissions(...argus: string[]): boolean {
    return auth.hasAllOfPermissions(...argus);
  }
}
