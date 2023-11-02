import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants';
import { ListItemData } from '../common/bean/ListItemData';
import { ListItemComponent } from './ListItemComponent';
import PageViewModel from '../viewmodel/PageViewModel';

/**
 * List area of the main tab content.
 */
@Component
export struct ListAreaComponent {
  build() {
    Column() {
      List() {
        LazyForEach(PageViewModel.getListDataSource(), (item: ListItemData) => {
          ListItem() {
            ListItemComponent({ itemInfo: item })
              .padding({ left: 20, right: 10 })
          }
          .onClick(() => {
            router.pushUrl({
              url: 'pages/DetailPage',
              params: { data: item.title }
            });
          })
        }, (item: ListItemData, index?: number) => index + JSON.stringify(item))
      }
      .width('100%')
      .divider({
        strokeWidth: $r('app.float.divider_height'),
        color: $r('app.color.list_divider'),
        startMargin: $r('app.float.list_divider_start_margin'),
        endMargin: $r('app.float.list_divider_end_margin')
      })
    }
    .width('100%')
  }
}