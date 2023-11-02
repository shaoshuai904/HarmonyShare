import { CommonConstants } from '../common/constants/CommonConstants';
import { TabItemData } from '../common/bean/TabItemData';
import PageViewModel from '../viewmodel/PageViewModel';
import { FeedPage } from './FeedPage';
import { VideoPage } from './VideoPage';
import { DiscoverPage } from './DiscoverPage';
import { MessagePage } from './MessagePage';
import { MePage } from './MePage';

/**
 * 程序主页面
 */
@Entry
@Component
struct MainPage {
  @State currentTabIndex: number = 0;
  @State breakPoint: string = CommonConstants.BREAK_POINT_XS;
  // 底部导航 是水平的 还是竖直的
  @State verticalTabs: boolean = false;

  build() {
    Column() {
      Tabs({
        index: this.currentTabIndex,
        barPosition: this.verticalTabs ? BarPosition.Start : BarPosition.End
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
      .vertical(this.verticalTabs)
      .barWidth(this.verticalTabs ? '56vp' : '100%')
      .barHeight(this.verticalTabs ? '90%' : $r('app.float.bar_height'))
      .layoutWeight(1)
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
    .backgroundColor(this.currentTabIndex === item.index ? Color.Yellow : Color.White)
  }
}
