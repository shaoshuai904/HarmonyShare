import router from '@ohos.router';

/**
 * 返回箭头标题栏目.
 */
@Component
export struct BackTitleBar {
  private title: string | Resource = '标题';
  private onBackClick: Function = () => {
    // Logger.info('BackTitleBar onBackClick ')
    router.back();
  };

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_back'))
          .width('24vp')
          .height('24vp')
          .margin({ left: '24vp', right: '24vp' })
          .onClick(() => {
            this.onBackClick();
          })

        Text(this.title)
          .fontColor('#FF000000')
          .fontSize('20fp')
      }
      .width('100%')
      .height('56vp')
    }
    .width('100%')
  }
}