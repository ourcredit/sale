<template>
	<view>
		<page-head :title="title"></page-head>
		<swiper :indicator-dots="true" :autoplay="false" :interval="5000" :duration="1000">
			<swiper-item v-for="item in itemList" :key="item">
				<view>{{item.name}}</view>
				<image :src="item.url" style="width: 150px;height: 150px;"></image>
			</swiper-item>
		</swiper>
		<button @click="goproducts" type="primary">开始购物</button>
	</view>
</template>
<script>
	import pageHead from '../../components/page-head.vue';
	export default {
		name: 'advence',
		data() {
			return {
				title: "首页",
				itemList: [{
					name: "a",
					url: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg"
				}, {
					name: "b",
					url: "http://f.hiphotos.baidu.com/baike/s=220/sign=510d39928fb1cb133a693b11ed5556da/c2fdfc039245d688b19ae0d9a6c27d1ed21b2436.jpg"
				}, {
					name: "c",
					url: "https://a.33iq.com/upload/quiz/images/14/06/20140612155130.jpg"
				}]
			}
		},
		components: {
			pageHead
		},
		computed: {
			disableSubtract() {
				return this.value <= this.min
			},
			disableAdd() {
				return this.value >= this.max
			}
		},
		onUnload() {},
		methods: {
			goproducts() {
				console.log("aaa")
				uni.redirectTo({
					url: "/pages/dash/products",
				})
			}
		}
	}
</script>
