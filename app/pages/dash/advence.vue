<template>
    <view>
        <swiper :indicator-dots="true" :autoplay="false" :interval="5000" :duration="1000">
            <swiper-item v-for="item in itemList" :key="item">
				<image :src="item" style="width: 150px;height: 150px;"></image>
            </swiper-item>
        </swiper>
		<button @tap="click" type="primary">开始购物</button>
    </view>
</template>
<script>
	export default {
    data: {
        itemList: [
            '/static/c1.png',
            '/static/c2.png',
            '/static/c3.png'
        ]
    },
    methods: {
        changeIndicatorDots: function (e) {
            this.indicatorDots = !this.indicatorDots
        },
        changeAutoplay: function (e) {
            this.autoplay = !this.autoplay
        },
        intervalChange: function (e) {
            this.interval = e.detail.value
        },
        durationChange: function (e) {
            this.duration = e.detail.value
        },
		click:function(e){
			uni.redirectTo({
				url:"/pages/dash/products",
			})
		}
    }
}
</script>