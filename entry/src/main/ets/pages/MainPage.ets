import { CommonConstants } from '../common/constants/CommonConstants';
import { TabItemData } from '../common/bean/TabItemData';
import PageViewModel from '../viewmodel/PageViewModel';
import { FeedPage } from './FeedPage';
import { VideoPage } from './VideoPage';
import { DiscoverPage } from './DiscoverPage';
import { MessagePage } from './MessagePage';
import { MePage } from './MePage';

/**
 * ListPage is the entry of application and shows how to develop a list page.The page consists of the search component,
 * list, and tabs. The list component is ListAreaComponent, and each item in the list corresponds to ListItemComponent.
 * The LazyForEach interface is used to implement high performance. Developers can expand
 * ListItemData, TabItemData, and PageViewModel, modify or add your own text, pictures, etc,
 * and quickly develop functions that meet project requirements.
 */
@Entry
@Component
struct MainPage {
  @State currentTabIndex: number = 0;
  @State breakPoint: string = CommonConstants.BREAK_POINT_XS;

  build() {
    Column() {
      Tabs({
        index: this.currentTabIndex,
        barPosition: this.breakPoint === CommonConstants.BREAK_POINT_LG ? BarPosition.Start : BarPosition.End
      }) {
        ForEach(PageViewModel.getTabData(), (item: TabItemData) => {
          TabContent() {
            Column() {
              if (item.index === 0) {
                FeedPage()
              } else if (item.index === 1) {
                VideoPage()
              } else if (item.index === 2) {
                DiscoverPage()
              } else if (item.index === 3) {
                MessagePage()
              } else {
                MePage()
              }
            }
          }
          .backgroundColor($r('app.color.theme_background'))
          .tabBar(this.CardTab(item))
        }, (item: TabItemData, index?: number) => index + JSON.stringify(item))
      }
      .vertical(this.breakPoint === CommonConstants.BREAK_POINT_LG)
      .barWidth(this.breakPoint === CommonConstants.BREAK_POINT_LG ? $r('app.float.bar_width') : CommonConstants.TAB_BAR_HEIGHT_PERCENT)
      .barHeight(this.breakPoint === CommonConstants.BREAK_POINT_LG ? CommonConstants.TAB_HEIGHT_PERCENT : $r('app.float.bar_height'))
      .layoutWeight(CommonConstants.TAB_LAYOUT_WEIGHT)
      // .margin({ top: $r('app.float.tab_margin_top') })
      // .backgroundColor($r('app.color.tab_bar_background'))
      .barMode(BarMode.Fixed)
      .align(Alignment.Center)
      .onChange((index: number) => {
        this.currentTabIndex = index;
      })
    }
    // .backgroundColor($r('app.color.theme_background'))
  }

  @Builder
  CardTab(item: TabItemData) {
    Column() {
      Image(this.currentTabIndex === item.index ? item.imageActivated : item.imageOriginal)
        .width($r('app.float.tab_title_image'))
        .height($r('app.float.tab_title_image'))
        .objectFit(ImageFit.Contain)
        .margin({
          top: $r('app.float.tab_image_margin_top'),
          bottom: $r('app.float.tab_image_margin_bottom')
        })
      Text(item.title)
        .fontSize($r('app.float.tab_text_size'))
        .fontColor(this.currentTabIndex === item.index ? $r('app.color.tab_text_activated') : $r('app.color.tab_text_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
