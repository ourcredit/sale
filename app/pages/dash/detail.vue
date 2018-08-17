<template>
	<view class="page">
		<page-head :title="deviceCode"></page-head>

		<view v-bind:style="{height:height }" class="banner">
			<image v-bind:style="{height:height }" class="banner-img" :src="current.image"></image>
			<view class="banner-title">{{current.title}}</view>
		</view>
		<button @click="gobuy" class="clickbutton">立即购买</button>

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
		data: {
			htmlString: "",
			current:{
				detailDate:new Date(),
				title:"巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉",
				author_name:"谁",
				published_at:new Date()
			}
		},
		
		computed: {
						...mapState({
							deviceCode: state => state.deviceCode,
			
						}),
			height() {
				var h=plus.screen.resolutionHeight;		
				return h*0.8-40 +"px";
			}
		},
		components: {
			pageHead
		},
		onLoad(e) {
			this.current.image=e.image;
		},
		onUnload() {
			this.htmlString = "";
			this.banner = {}
		},
		methods: {
			gobuy(e) {
				uni.redirectTo({
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
	.banner {
		height: 360px;
		overflow: hidden;
		position: relative;
		background-color: #ccc;
	}
	.banner-img {
		width: 100%;
	}
	.banner-title {
		max-height: 84px;
		overflow: hidden;
		position: absolute;
		left: 30px;
		bottom: 30px;
		width: 90%;
		font-size: 32px;
		font-weight: 400;
		line-height: 42px;
		color: white;
		z-index: 11;
	}
	.article-meta {
		padding: 20px 40px;
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		color: gray;
	}
	.article-text {
		font-size: 26px;
		line-height: 50px;
		margin: 0 20px;
	}
	.article-author,
	.article-time {
		font-size: 30px;
	}
	.article-content {
		padding: 0 30px;
		overflow: hidden;
		font-size: 30px;
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