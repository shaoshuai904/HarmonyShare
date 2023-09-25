import { DetailListComponent } from '../view/DetailListComponent';
import { BackTitleBar } from '../view/BackTitleBar';

/**
 * 我的 页面.
 */
@Entry
@Component
export struct MePage {
  private titleParam: string = 'Me';

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
