import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
import {
	request
} from "../common/ajax.js"
const store = new Vuex.Store({
	state: {
		tenantName: "default",
		deviceCode: "xc-001",
		products: [],
		totalCount: 0,
		isRegister: false,
		imageUrl:""
	},
	mutations: {
		setPageSize(state, size) {
			state.pageSize = size;
		}
	},
	actions: {
		//获取所有
		async loadMore({
			state
		}, payload) {
			request('/api/device/products', "POST", payload, function (r) {
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
				console.log(JSON.stringify(r));
				if (r.data.statusCode == 200 && r.data.data) {
					state.isRegister = true;
				}
			});
		},
		async gobuy({
			state
		}, payload) {
			console.log("执行订单逻辑")
			request('/api/order', "PUT", payload, function (r) {
				if (r.data.statusCode == 200 && r.data.data) {
					state.imageUrl = r.data.data;
				}
			});
		}
	},
	modules: {}
})

export default store
