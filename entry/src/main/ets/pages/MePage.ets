import { BackTitleBar } from '../view/BackTitleBar';
import { ListAreaComponent } from '../view/ListAreaComponent';

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
      ListAreaComponent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }

}
