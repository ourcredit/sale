import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
import {
	request
} from "../common/ajax.js"
const store = new Vuex.Store({
	state: {
		error: null,
		token: "",
		tenantName: "default",
		products: [{
				name: "商品A",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.2,
			},
			{
				name: "商品B",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.3,
			},
			{
				name: "商品C",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.3,
			},
			{
				name: "商品D",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.3,
			},
			{
				name: "商品E",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.3,
			},
			{
				name: "商品F",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.3,
			},
			{
				name: "商品G",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.3,
			},
			{
				name: "商品H",
				description: `描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
				image: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg",
				price: 2.3,
			}
		]
	},
	mutations: {
		setPageSize(state, size) {
			state.pageSize = size;
		}
	},
	actions: {
		//获取所有
		async getAllProducts({
			state
		}, payload) {
			let params = {
				"deviceId": 1,
				"index": 1,
				"size": 10
			};
			request('/api/device/products', "POST",params , function (r) {
				state.products = [];
				state.products.push(...r.data.data.records);
				state.totalCount = r.data.data.total;
			});
		}
	},
	modules: {}
})

export default store
