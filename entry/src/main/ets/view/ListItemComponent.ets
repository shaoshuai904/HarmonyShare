import { ListItemData } from '../common/bean/ListItemData';

/**
 * List item information component.
 */
@Component
export struct ListItemComponent {
  private itemInfo: ListItemData = new ListItemData();

  build() {
    Row() {
      Image(this.itemInfo.image)
        .objectFit(ImageFit.Contain)
        .width('24vp')
        .height('24vp')
        .margin({ right: '15vp' })
      Column() {
        Text(this.itemInfo.title)
          .fontSize('16fp')
          .fontColor($r('app.color.list_item_title'))
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
        Text(this.itemInfo.subTitle)
          .fontSize('14vp')
          .fontColor($r('app.color.list_item_sub_title'))
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .margin({ top: '5vp' })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Text(this.itemInfo.summary)
        .fontSize('14fp')
        .margin({ right: '4vp' })
        .fontColor($r('app.color.list_item_sub_title'))
      Image(this.itemInfo.rightArrowImage)
        .objectFit(ImageFit.Contain)
        .width('12vp')
        .height('24vp')
    }
    .height('60vp')
  }
}