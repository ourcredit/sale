<template>
    <div @click="handleChange" v-if="showFullScreenBtn" class="full-screen-btn-con">
        <Tooltip :content="value ? '退出全屏' : '全屏'" placement="bottom">
            <Icon :type="value ? 'arrow-shrink' : 'arrow-expand'" :size="23"></Icon>
        </Tooltip>
    </div>
</template>

<script lang="ts">
import { Component, Vue,Inject, Prop,Watch } from 'vue-property-decorator';
import Util from '../lib/util'
import AbpBase from '../lib/abpbase'
@Component
export default class FullScreen extends AbpBase {
    name:string= 'fullScreen';
    @Prop({type:Boolean,default:false}) value:boolean;
    get showFullScreenBtn () {
        return window.navigator.userAgent.indexOf('MSIE') < 0;
    }
    handleFullscreen () {
        let main = document.body as any;
        let documentAany=document as any;
        if (this.value) {
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (documentAany.mozCancelFullScreen) {
                documentAany.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
                 document.webkitCancelFullScreen();
            } else if (documentAany.msExitFullscreen) {
                 documentAany.msExitFullscreen();
            }
        } else {
            if (main.requestFullscreen) {
                main.requestFullscreen();
            } else if (main.mozRequestFullScreen) {
                main.mozRequestFullScreen();
            } else if (main.webkitRequestFullScreen) {
                main.webkitRequestFullScreen();
            } else if (main.msRequestFullscreen) {
                main.msRequestFullscreen();
            }
        }
    }
    handleChange () {
        this.handleFullscreen();
    }
    created () {
        let documentAny=document as any;
        let isFullscreen = document.fullscreenElement || documentAny.mozFullScreenElement || document.webkitFullscreenElement || documentAny.fullScreen || documentAny.mozFullScreen || document.webkitIsFullScreen;
        isFullscreen = !!isFullscreen;
        document.addEventListener('fullscreenchange', () => {
            this.$emit('input', !this.value);
            this.$emit('on-change', !this.value);
        });
        document.addEventListener('mozfullscreenchange', () => {
            this.$emit('input', !this.value);
            this.$emit('on-change', !this.value);
        });
        document.addEventListener('webkitfullscreenchange', () => {
            this.$emit('input', !this.value);
            this.$emit('on-change', !this.value);
        });
        document.addEventListener('msfullscreenchange', () => {
            this.$emit('input', !this.value);
            this.$emit('on-change', !this.value);
        });
        this.$emit('input', isFullscreen);
    }
}
</script>
