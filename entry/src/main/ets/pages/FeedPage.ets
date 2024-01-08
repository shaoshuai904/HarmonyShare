import { DetailListComponent } from '../view/DetailListComponent';
import { BackTitleBar } from '../view/BackTitleBar';
import SwiperComponent from '../view/SwiperComponent';
import Logger from '../utils/Logger';

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
      SwiperComponent({
        onClickItem: (item: Resource, index: number) => {
          Logger.debug('onClickItem::: ' + item.id + "  " + index);
        }
      })
      DetailListComponent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }

}