import { TabItemData } from '../common/bean/TabItemData';
import PageViewModel from '../viewmodel/PageViewModel';
import Logger from '../utils/Logger';
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
            GridRow({
              breakpoints: {
                // 表示启用xs、sm、md、lg共4个断点，小于320vp为xs，320vp-600vp为sm，600vp-840vp为md，大于840vp为lg。
                value: ['320vp', '600vp', '840vp'],
                reference: BreakpointsReference.WindowSize
              },
              columns: 6,
              // columns: { sm: 4, md: 8, lg: 12 }, // 设置栅格布局的总列数，默认值为12
              // gutter: { x: vp2px(24) }, // 设置子组件水平与垂直方向距离相邻元素的间距
              direction: GridRowDirection.Row
            }) {
              GridCol({
                span: 6,
                // span: { sm: 4, md: 6, lg: 8 }, // 子组件占栅格布局的列数，决定了子组件的宽度，默认为1
                // offset: { md: 1, lg: 2 } // 栅格子组件相对于前一个子组件的偏移列数，默认为0
              }) {
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

                // .justifyContent(FlexAlign.Center)
                // .width('100%')
                // .height('100%')
              }
            }
            // .margin({ left: '2vp', right: '2vp' })
            .onBreakpointChange((breakPoint: string) => {
              this.verticalTabs = breakPoint === 'md'
              Logger.debug('onBreakpointChange ' + breakPoint + "  " + this.verticalTabs);
            })
          }
          .backgroundColor($r('app.color.theme_background'))
          .tabBar(this.CardTab(item))
        }, (item: TabItemData, index?: number) => index + JSON.stringify(item))
      }
      .vertical(this.verticalTabs)
      .barWidth(this.verticalTabs ? '66vp' : '100%')
      .barHeight(this.verticalTabs ? '100%' : '56vp')
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
