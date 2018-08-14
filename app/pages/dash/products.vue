<template>
	<view class="page">
		<page-head title="ww"></page-head>
		<view class="page-section">
			<view class="uni-flex uni-row">
				<view style="width: 80%;height: 430px;" class="flex-item color1">
					<view class="uni-flex  uni-row">
						<view class="text" style="flex: 1;">
							<image :src="qrcode">二维码</image>
						</view>
						<view class="text" style="flex: 1;">简介阿达伟大阿瓦达伟大阿瓦达阿瓦</view>
					</view>

				</view>
				<view style="flex: 1;height: 430px;" class="flex-item color3">
					<view class="uni-flex uni-row">
						<view class="text" style="flex: 1;height: 200px;display: flex; justify-content: center;align-items: flex-start;">
							<text>{{current.productName}}</text>
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
					"deviceId": 1,
					"index": 1,
					"size": 10,
					"init": true
				},
				current: {}

			}
		},
		computed: {
			...mapState({
				list: state => state.products,
				total: state => state.totalCount,
				qrcode: state => state.imageUrl,
				step: state => state.step
			})
		},
		onShow() {
			let _ = this;
			this.params.index = 1;
			this.params.init = true;
			this.loadMore(this.params);
			uni.onSocketMessage(function (res) {
				console.log('收到服务器内容：' + res.data);
				_.setStep(3);
				setTimeout(() => {
					_.setStep(4);
					setTimeout(() => {
						uni.redirectTo({
							url: "/pages/dash/advence"
						})
						_.setStep(1);
					}, 5000)
				}, 8000)
			});
		},
		components: {
			pageHead
		},
		methods: {
			...mapMutations([
				'setStep' // 映射 this.increment() 为 this.$store.commit('increment')
			]),
			...mapActions(["loadMore", "gobuy", "gobuytest"]),
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
				//this.gobuy(params);
				this.gobuytest({});
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
