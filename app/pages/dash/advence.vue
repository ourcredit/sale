<template>
	<view class="page">
		<page-head :title="deviceCode"></page-head>
		<swiper autoplay="true" indicator-dots="true" circular="true" v-bind:style="{height:'300px' }">
			<swiper-item @tap="detail(img)" v-for="(img,key) in imgUrls" :key="key">
				<image :src="img" v-bind:style="{height:'300px' }" />
			</swiper-item>
		</swiper>
<!-- 	<view :key="i" v-for="(v,i) in logError">第{{i}}个： {{v}}</view>	 -->
		<button @click="gobuy" class="clickbutton">立即购买</button>
	</view>

</template>
<script>
	import pageHead from "../../components/page-head.vue"
	import {
		mapState,
		mapMutations,
		mapActions
	} from 'vuex'
	export default {
		data: {
			title: '广告位',
			imgUrls: [
				'https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/shuijiao.jpg',
				'https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/muwu.jpg',
				'https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/cbd.jpg'
			]
		},
		
		components: {
			pageHead
		},
		computed: {
			...mapState({
				list: state => state.products,
				deviceCode: state => state.deviceCode,
				height: state => state.height

			}),
		},
		mounted(){
			if (plus.device.imei) {
				let num = plus.device.imei.split(',')[0];
				this.setDeviceCode(num);
				this.register({
					deviceNum: num,
					deviceName: plus.device.model
				});
			}
		},
		methods: {
			...mapActions(["register"]),
			...mapMutations([
				'setDeviceCode', 
				"setlogError"
			]),
			detail(img) {
				uni.navigateTo({
					url: "/pages/dash/detail?image=" + img,
				})
			},
			gobuy(e) {
				uni.navigateTo({
					url: "/pages/dash/products",
				})
			}
		}
	}
</script>
<style>
	@import "../../common/uni.css";
	page {
		background: #efeff4;
	}

	.list-collapse {
		padding-left: 36px;
		box-sizing: border-box;
	}

	image {
		width: 100%;
	}

	.page-pd {
		padding: 36px;
	}

	.clickbutton {
		background-color: #1AAD19;
		border-radius: 50%;
		margin-left: 80%;
		width: 12%;
		height: 90px;
		vertical-align: middle;
		text-align: center;
	}
</style>
