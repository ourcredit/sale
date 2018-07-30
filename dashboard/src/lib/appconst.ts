import url from "@/lib/url";
const AppConsts: any = {
  userManagement: {
    defaultAdminUserName: "admin"
  },
  localization: {
    defaultLocalizationSourceName: "FengCloud"
  },
  authorization: {
    encrptedAuthTokenName: "enc_auth_token"
  },
  appBaseUrl: "http://localhost:8081",
  remoteServiceBaseUrl: url
};
export default AppConsts;
