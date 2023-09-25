import { DetailListComponent } from '../view/DetailListComponent';
import { BackTitleBar } from '../view/BackTitleBar';

/**
 * 消息箱 页面.
 */
@Entry
@Component
export struct MessagePage {
  private titleParam: string = 'Message';

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