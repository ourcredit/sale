<template>
	<view class="page">
		<page-head title="ww"></page-head>
		<view class="page-section">
			<view class="uni-flex uni-row">
				<view style="width: 80%;height: 430px;" class="flex-item color1">
					<view class="uni-flex  uni-row">
						<view class="text" style="flex: 1;">
							<image :src="url"></image>
						</view>
						<view class="text" style="flex: 1;">{{current.description}}</view>
					</view>
				</view>
				<view style="flex: 1;height: 430px;" class="flex-item color3">
					<view class="uni-flex uni-row">
						<view class="text" style="flex: 1;height: 200px;display: flex; justify-content: center;align-items: flex-start;">
							<text>{{current.productName}}</text>
							<text>{{current.price}}</text>
						</view>
					</view>
					<view class="uni-flex uni-row">
						<view class="text" style="flex: 1;height: 200px;display: flex; justify-content: center;align-items: flex-end;">
							<button v-if="step==1" @click="gotobuy">确认购买</button>
							<image v-if="step==2" style="width:200px;height:200px;" :src="qrcode">二维码</image>
							<button v-if="step==3" @click="gotobuy">出货中</button>
							<button v-if="step==4" @click="gotobuy">出货完成</button>

						</view>
					</view>
				</view>
			</view>
		</view>
		<view class="page-section">
			<view class="page-section-spacing">
				<scroll-view @scrolltoupper="init" @scrolltolower="more" class="scroll-view_H" scroll-x="true" @scroll="scroll">
					<view @tap="show(item)" :key="item.productName" v-for="item in list" class="scroll-view-item_H color1">
						<view class="textshow">{{item.productName}} </view>
					</view>
				</scroll-view>
			</view>
		</view>
	</view>
</template>
<script>
	import {
		mapState,
		mapMutations,
		mapActions
	} from 'vuex'
	import pageHead from "../../components/page-head.vue"
	export default {
		data() {
			return {
				params: {
					"deviceNum": 1,
					"index": 1,
					"size": 10,
					"init": true
				},
				current: {},
				config: {
					value: 'https://www.baidu.com',
					imagePath: './examples/assets/logo.png',
					filter: 'color'
				}
			}
		},
		mounted() {
			let _ = this;
			if(!_.socketState){
				uni.connectSocket({
					url: url,
					data: {},
					header: {
						'content-type': 'application/json'
					},
					protocols: [],
					method: "GET"
				}, function (r) {});
			}
			uni.onSocketMessage(function (res) {
				console.log('收到服务器内容：' + res.data);
				let o = JSON.parse(res.data);
				if (o.type == 2 && o.state) {
					_.setStep(3);
					setTimeout(() => {
						_.setStep(4);
						console.log("websocket" + _.socketState);
						if (_.socketState) {
							let m = JSON.stringify({
								to: o.to,
								type: 4,
								state: true,
								order: o.order,
								message: "出货成功"
							});
							uni.sendSocketMessage({
								data: m
							});
						}
						setTimeout(() => {
							_.initState();
							uni.redirectTo({
								url: "/pages/dash/advence"
							})
						}, 5000)
					}, 8000)
				}
			});
		},
		computed: {
			...mapState({
				list: state => state.products,
				total: state => state.totalCount,
				qrcode: state => state.imageUrl,
				step: state => state.step,
				socketState: state => state.socketState,

			}),
			url() {
				return this.current && this.current.imageUrl ? ("http://103.45.8.198:9999/" + this.current.imageUrl) : "";
			}
		},
		onShow() {
			this.initState();
			let _ = this;
			this.params.index = 1;
			this.params.init = true;
			this.loadMore(this.params);

		},
		components: {
			pageHead
		},
		methods: {
			...mapMutations([
				'setStep', // 映射 this.increment() 为 this.$store.commit('increment')
				"initState"
			]),
			...mapActions(["loadMore", "gobuy"]),
			more() {
				if (this.total > 0) {
					this.params.index++;
					this.params.init = false;
					if (this.total > (this.params.index - 1) * this.params.size) {
						this.loadMore(this.params);
					} else {
						this.params.index--;
					}
				}
			},
			init() {
				this.params.index = 1;
				this.params.init = true;
				this.loadMore(this.params);
			},
			show(item) {
				if (this.step == 1) {
					this.current = item;
				}
			},
			scroll() {},
			gotobuy() {
				if (!this.current || !this.current.productId) {
					return;
				}
				let params = {
					"deviceNum": plus.device.imei.split(',')[0],
					"price": this.current.price,
					"productId": this.current.productId
				}
				this.gobuy(params);
				this.setStep(2);
			}

		}
	}
</script>

<style>
	@import "../../common/uni.css";
	.page-section-spacing {
		padding: 0 0rpx
	}

	.flex-item {
		width: 200px;
		height: 300px;
		text-align: center;
		line-height: 300px;
		font-size: 26px;
	}

	.flex-item-V {
		margin: 0 auto;
		width: 300px;
		height: 200px;
		text-align: center;
		line-height: 200px;
	}

	.text {
		margin: 10px;
		padding: 0 20px;
		background-color: #ebebeb;
		height: 70px;
		line-height: 70px;
		text-align: center;
		color: #cfcfcf;
		font-size: 26px;
	}

	.scroll-view_H {
		white-space: nowrap;
		width: 100%;
	}

	.scroll-view-item {
		height: 300px;
		line-height: 300px;
		text-align: center;
		font-size: 36px;
	}

	.scroll-view-item_R {
		border-radius: 50%;
		margin-left: 30px;
		margin-right: 30px;
		display: inline-block;
		height: 200px;
	}

	.scroll-view-item_H {
		border-radius: 50%;
		margin-left: 30px;
		margin-right: 30px;
		display: inline-block;
		width: 15%;
		height: 200px;
	}

	.textshow {
		vertical-align: middle;
		text-align: center;
		font-size: 36px;
	}
</style>
