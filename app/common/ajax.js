//发送请求
const baseUrl = "http://103.45.8.198:8081";
var header ={
	'content-type': "application/json"
}
//请求
function request(url, type, data,call) {
	let token = uni.getStorageSync("token");
	if (!token) {
		login();
	}
	token = uni.getStorageSync("token");
	console.log("token"+JSON.stringify(token));

	header = Object.assign(header, {
		'Authorization': token
	})
	uni.request({
		url: baseUrl + url,
		method: type,
		data: data,
		header: header,
		success: call
	});
}
//登陆
function login() {
	uni.setStorageSync("token", "");
	let data = {
		"passWord": "1234567",
		"tenantName": "default",
		"userName": "admin"
	}
	uni.request({
		url: baseUrl + "/api/auth/login",
		data: data,
		method:"POST",
		header: header,
		success: function (res) {
			if (res.data.data) {
				let token=res.data.data.token;
				uni.setStorageSync("token", token);
			}
		}
	});
}

module.exports = {
	login,
	request
}
