import { DetailListComponent } from '../view/DetailListComponent';
import { BackTitleBar } from '../view/BackTitleBar';

/**
 * 广场 页面.
 */
@Entry
@Component
export struct DiscoverPage {
  private titleParam: string = 'Discover';

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
