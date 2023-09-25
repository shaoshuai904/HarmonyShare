import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants';

/**
 * 返回箭头标题栏目.
 */
@Component
export struct BackTitleBar {
  private title: string = '标题';

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_back'))
          .width($r('app.float.image_size'))
          .height($r('app.float.image_size'))
          .margin({
            left: $r('app.float.image_margin_left'),
            right: $r('app.float.image_margin_right')
          })
          .onClick(() => {
            router.back();
          })

        Text(this.title)
          .fontColor($r('app.color.title'))
          .fontSize($r('app.float.detail_title'))
      }
      .width(CommonConstants.FULL_WIDTH_PERCENT)
      .height($r('app.float.title_height'))
    }
    .width(CommonConstants.COLUMN_WIDTH_PERCENT)
  }
}