<template>
	<view class="page">
		<page-head :title="ww"></page-head>
		<swiper autoplay="true" indicator-dots="true" circular="true" v-bind:style="{height:height }">
			<swiper-item @tap="detail(img)" v-for="(img,key) in imgUrls" :key="key">
				<image :src="img" v-bind:style="{height:height }" />
			</swiper-item>
		</swiper>
		<button @click="gobuy" class="clickbutton">立即购买</button>
	</view>
</template>
<script>
	import pageHead from "../../components/page-head.vue"
	export default {
		data: {
			title: '广告位',
			imgUrls: [
				'https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/shuijiao.jpg',
				'https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/muwu.jpg',
				'https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/cbd.jpg'
			]
		},
		components:{
			pageHead
		},
		computed: {
			height() {
				return '335px';
			}
		},
		methods: {
			detail(img) {
				console.log(img);
				uni.navigateTo({
					url: "/pages/dash/detail",
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
		height: 135px;
		vertical-align: middle;
		text-align: center;
	}
</style>
