/**
 * 设置项 item
 */
@Entry
@Component
export struct SettingItemView {
  // @Prop
  itemIcon: Resource = $r('app.media.ic_normal');
  itemTitle ?: string | Resource = '';
  itemSubTitle ?: string | Resource = '';
  itemRightDes ?: string | Resource = '';
  rightArrow: Resource = $r('app.media.ic_right_arrow');
  onItemClick: Function = () => {};

  build() {
    Row() {
      Image(this.itemIcon)
        .objectFit(ImageFit.Contain)
        .width('20vp')
        .height('20vp')
        .margin({ left: '4vp', right: '12vp' })
      Column() {
        Text(this.itemTitle)
          .fontSize('16fp')
          .fontColor("#FF182431")
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
        if (this.itemSubTitle) {
          Text(this.itemSubTitle)
            .fontSize('14vp')
            .fontColor("#99182431")
            .maxLines(1)
            .textOverflow({
              overflow: TextOverflow.Ellipsis
            })
            .margin({ top: '5vp' })
        }
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      // .backgroundColor("#74c0dcf8")

      if (this.itemRightDes) {
        Text(this.itemRightDes)
          .fontSize('14fp')
          .fontColor("#99182431")
      }

      Image(this.rightArrow)
        .objectFit(ImageFit.Contain)
        .width('12vp')
        .height('24vp')
        .margin({ left: '4vp' })
    }
    // .height('60vp')
    // .width('100%')
    .backgroundColor("#FFFFFF")
    .padding({ left: '15vp', right: '15vp', top: '12vp', bottom: '12vp' })
    .border({
      width: { bottom: "0.5vp" },
      color: "#cccccc"
    })
    .onClick(() => {
      this.onItemClick();
    })


  }
}