/**
 * 用户基础信息 View
 */
@Component
export struct UserBaseInfo {
  @Prop nickname: string = '';
  @Prop signature: string = '';

  build() {
    Column() {
      // userIcon
      Image($r('app.media.app_icon'))
        .objectFit(ImageFit.Contain)
        .width("66vp")
        .height("66vp")
        .margin({ top: "40vp" })

      Column() {
        Text('LV.7')
          .fontSize("12vp")
          .fontColor("#c99411")
          .fontWeight(FontWeight.Bolder)
      }
      .width("44vp")
      .height("16vp")
      .margin({ top: "-8vp" })
      .border({ radius: "5vp" })
      .backgroundColor("#d4e6f1")
      .justifyContent(FlexAlign.Center)

      // nickname
      Text(this.nickname)
        .fontSize("20vp")
        .fontColor("#000000")
        .fontWeight(FontWeight.Normal)
        .fontFamily("Helvetica")
        .margin({ bottom: "6vp" })

      // signature
      Text(this.signature)
        .fontSize("16vp")
        .fontColor("#66686a")
        .fontWeight(FontWeight.Normal)
        .fontFamily("PingFangSC-Regular")
    }
  }
}