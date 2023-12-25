import { BackTitleBar } from '../view/BackTitleBar';
import { ListAreaComponent } from '../view/ListAreaComponent';

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
      ListAreaComponent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }

}
