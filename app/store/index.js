import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
//发送请求
const baseUrl = "https://service.leftins.com";
var header = {
	'content-type': "application/json"
}

//请求
function request(url, type, data, call) {
	let token = plus.storage.getItem("AuthorizationToken");
	if (!token) {
		return
	}
	header = Object.assign(header, {
		'Authorization': token
	})
	let rurl = baseUrl + url;
	uni.request({
		url: rurl,
		method: type,
		data: data,
		header: header,
		success: call
	});
}

const store = new Vuex.Store({
	state: {
		socketState: false,
		step: 1, //购买流程控制
		tenantName: "default", //默认租户信息
		deviceCode: "", //默认设备code 编码
		products: [], //产品对象集合
		totalCount: 0, //总数据聚集
		isRegister: false, //当前设备是否注册
		imageUrl: "", //支付url
		logError: []
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
		},
		setsocketState(state, socketState) {
			state.socketState = socketState;
		},
		setlogError(state, error) {
			state.logError += error;
		},
		initState(state) {
			state.step = 1;
			state.imageUrl = "";
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
			let token = plus.storage.getItem("AuthorizationToken");
			request('/api/device/register', "POST", payload, function (r) {
				if (r.statusCode == 200 && r.data.data) {
					state.isRegister = true;
				}
			});
		},
		async authorization({
			state
		}, payload) {
			let data = {
				"passWord": "1234567",
				"tenantName": "default",
				"userName": "admin"
			};
			uni.request({
				url: baseUrl + "/api/auth/login",
				data: data,
				method: "POST",
				header: header,
				success: function (res) {
					if (res.data.data) {
						let token = res.data.data.token;
						plus.storage.setItem("AuthorizationToken", token);
					}
				}
			});
		},
		async gobuy({
			state
		}, payload) {
			if (state.deviceCode) {
				payload.deviceNum = state.deviceCode;
			}
			request('/api/order/make', "POST", payload, function (r) {
				if (r.statusCode == 200 && r.data.data) {
					state.imageUrl = r.data.data;
				}
			});
		}
	},
	modules: {}
})
export default store
