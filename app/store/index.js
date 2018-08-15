import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
import {
	request
} from "../common/ajax.js"
const store = new Vuex.Store({
	state: {
		step: 1, //购买流程控制
		tenantName: "default", //默认租户信息
		deviceCode: "", //默认设备code 编码
		products: [], //产品对象集合
		totalCount: 0, //总数据聚集
		isRegister: false, //当前设备是否注册
		imageUrl: "" //支付url
	},
	mutations: {
		setPageSize(state, size) {
			state.pageSize = size;
		},
		setStep(state, step) {
			state.step = step;
		},
		setDeviceCode(state, code) {
			state.deviceCode = code;
		}
	},
	actions: {
		//获取所有
		async loadMore({
			state
		}, payload) {
			if (state.deviceCode) {
				payload.deviceNum = state.deviceCode;
			}
			request('/api/device/salelist', "POST", payload, function (r) {
				console.log(JSON.stringify(r));
				if (payload.init) {
					state.products = [];
				}
				state.products.push(...r.data.data.records);
				state.totalCount = r.data.data.total;
			});
		},
		async register({
			state
		}, payload) {
			request('/api/device/register', "POST", payload, function (r) {
				if (r.statusCode == 200 && r.data.data) {
					state.isRegister = true;
				}
			});
		},
		async gobuy({
			state
		}, payload) {
			if (state.deviceCode) {
				payload.deviceNum = state.deviceCode;
			}
			console.log(JSON.stringify(payload));
			request('/api/order/make', "POST", payload, function (r) {
				console.log(JSON.stringify(r));
				if (r.statusCode == 200 && r.data.data) {
					state.imageUrl = r.data.data;
				}
			});
		},
		async gobuytest({
			state
		}, payload) {
			console.log("执行订单逻辑")
			request('/api/order/testurl', "GET", payload, function (r) {
				console.log(JSON.stringify(r));
				if (r.statusCode == 200 && r.data.data) {
					state.imageUrl = r.data.data;
				}
			});
		}
	},
	modules: {}
})
export default store
