import { DetailListComponent } from '../view/DetailListComponent';
import { BackTitleBar } from '../view/BackTitleBar';

/**
 * 视频 页面.
 */
@Entry
@Component
export struct VideoPage {
  private titleParam: string = 'Video';

  build() {
    Column() {
      BackTitleBar({ title: this.titleParam })
      DetailListComponent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }
}
