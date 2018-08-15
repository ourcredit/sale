<template>
	<view>
		<view class="page-body">
			<view class="page-section">
				<view class="uni-flex uni-row">
					<view class="text" style="width: 300px;height: 320px;display: flex; justify-content: center;align-items: center;">
						<image :src="current.image" style="width: 150px;height: 150px;"></image>
					</view>
					<view class="uni-flex uni-column" style="flex: 1;justify-content: space-between;">
						<view class="text" style="height: 220px;text-align: left;padding-left: 20px;padding-top: 10px;">
							{{current.description}}
						</view>
						<view class="uni-flex uni-row">
							<view class="text" style="flex: 1;">{{current.price}}</view>
							<view @tap="gobuy" class="text" style="flex: 1;">立即购买</view>
						</view>
					</view>
				</view>
			</view>
			<view class="page-section">
				<view class="page-section-spacing">
					<scroll-view class="scroll-view_H" scroll-x="true" @scroll="scroll">
						<view @tap="show(item)" :key="item.name" v-for="item in list" class="scroll-view-item_H color1">{{item.name}}</view>
					</scroll-view>
				</view>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		data() {
			return {
				list: [{
					name:"商品A",
					description:`描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
					image:"/static/c1.png",
					price:2.2,
				},
				{
					name:"商品B",
					description:`描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
					image:"/static/c2.png",
					price:2.3,
				},
				{
					name:"商品C",
					description:`描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
					image:"/static/c3.png",
					price:2.3,
				},
				{
					name:"商品D",
					description:`描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
					image:"/static/c4.png",
					price:2.3,
				},
				{
					name:"商品E",
					description:`描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					描述描述描述描述描述描述描述描述描述描述描述描述描述描述描
					述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述`,
					image:"/static/c5.png",
					price:2.3,
				}],
				title: 'scroll-view',
				toView: 'green',
				order: ['demo1', 'demo2', 'demo3'],
				current:{}
			}
		},
		methods: {
			show(item) {
				this.current=item;
				console.log(item);
			},
			scroll() {
			},
			gobuy(){
				uni.redirectTo({
					url:"/pages/dash/product",
				})
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

	.scroll-Y {
		height: 200px;
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

	.scroll-view-item_H {
		display: inline-block;
		width: 20%;
		height: 200px;
		line-height: 200px;
		text-align: center;
		font-size: 36px;
	}
</style>
