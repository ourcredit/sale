<template name="page-head">
	<view class="page-head">
			<view @tap="back" class="page-head-title">{{title}}  </view>
		
	</view>
</template>

<script>
	export default {
		name: "page-head",
		props: {
			title: {
				type: String,
				default: ""
			},
			backUrl: {
				type: String,
				default: ""
			}
		},
		methods: {
			back() {
				if (this.backUrl)
					uni.navigateTo({
						url: this.backUrl,
					})
			}
		}
	}
</script>
