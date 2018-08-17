<template name="page-head">
	<view class="page-head">{{title}}
	</view>
</template>

<script>
	export default {
		name: "page-head",
		props: {
			title: {
				type: String,
				default: ""
			}
		},
		methods: {
		}
	}
</script>
