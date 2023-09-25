import { DetailListComponent } from '../view/DetailListComponent';
import { BackTitleBar } from '../view/BackTitleBar';

/**
 * Feed 页面.
 */
@Entry
@Component
export struct FeedPage {
  private titleParam: string = 'Feed';

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