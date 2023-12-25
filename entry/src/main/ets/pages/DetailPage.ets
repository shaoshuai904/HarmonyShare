import router from '@ohos.router';
import { DetailListComponent } from '../view/DetailListComponent';
import { CommonConstants } from '../common/constants/CommonConstants';
import { BackTitleBar } from '../view/BackTitleBar';
import Logger from '../utils/Logger';

/**
 * Detail page to display more information.
 */
@Entry
@Component
struct DetailPage {
  private titleParam: Resource = $r('app.string.detail_default_title');

  aboutToAppear() {
    if (router.getParams()) {
      let param = router.getParams() as Record<string, Object>;
      this.titleParam = param[CommonConstants.KEY_PARAM_DATA] as Resource;
    }
  }

  build() {
    Column() {
      BackTitleBar({
        title: this.titleParam,
        onBackClick: () => {
          Logger.info('DetailPage onBackClick ')
          router.back();
        }
      })

      GridRow({
        breakpoints: {
          value: ['320vp', '600vp', '840vp'],
          reference: BreakpointsReference.WindowSize
        },
        columns: { sm: 4, md: 8, lg: 12 },
        gutter: { x: vp2px(24) },
        direction: GridRowDirection.Row
      }) {
        GridCol({
          span: { sm: 4, md: 6, lg: 8 },
          offset: { md: 1, lg: 2 }
        }) {
          DetailListComponent()
        }
        .margin({
          left: '12vp',
          right: '12vp'
        })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }
}