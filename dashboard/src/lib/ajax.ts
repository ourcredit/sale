import axios from "axios";
import auth from "@/lib/auth";
import appconst from "@/lib/appconst";
import Vue from "vue";
const ajax: any = axios.create({
  baseURL: appconst.remoteServiceBaseUrl,
  timeout: 30000
});
ajax.interceptors.request.use(
  (config: any) => {
    if (!!auth.getToken()) {
      config.headers.common.Authorization = auth.getToken();
      //  config.headers.common["Authorization"] = "awdawdawd";
    }
    return config;
  },
  (error: any) => {
    return Promise.reject(error);
  }
);
let vm: Vue = new Vue({});
ajax.interceptors.response.use(
  respon => {
    return respon.data;
  },
  error => {
    if (
      !!error.response &&
      !!error.response.data.error &&
      error.response.data.status
    ) {
      vm.$Modal.error({
        title: error.response.data.error,
        content: error.response.data.message
      });
    } else if (
      !!error.response &&
      !!error.response.data.error &&
      !!error.response.data.message
    ) {
      vm.$Modal.error({
        title: "登陆失败",
        content: error.response.data.message
      });
    } else if (!error.response) {
      vm.$Modal.error(error.message);
    }
    setTimeout(() => {
      vm.$Message.destroy();
    }, 1000);
    return Promise.reject(error);
  }
);
export default ajax;
