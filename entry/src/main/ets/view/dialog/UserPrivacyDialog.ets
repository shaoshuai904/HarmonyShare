/**
 * 自定义 Dialog
 */
@CustomDialog
export default struct UserPrivacyDialog {
  controller: CustomDialogController = new CustomDialogController({ builder: '' });
  cancel: Function = () => {};
  confirm: Function = () => {};

  build() {
    Column() {
      Text("请在“健康生活”权限管理中开启“XX”权限")
        .descStyle()
      Text("该功能支持XX…（功能介绍）")
        .descStyle()
        .opacity(0.6)
      Row() {
        Button("取消")
          .backgroundColor(Color.White)
          .fontColor("#007DFF")
          .onClick(() => {
            this.controller.close();
            this.cancel();
          })
        Divider()
          .vertical(true)
          .height("22vp")
          .opacity(0.4)
        Button("确定")
          .backgroundColor(Color.White)
          .fontColor("#007DFF")
          .onClick(() => {
            this.controller.close();
            this.confirm();
          })
      }
      .width('100%')
      .margin({ top: "22vp" })
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .padding("16vp")
  }
}

@Extend(Text)
function descStyle() {
  .fontSize("14vp")
  .fontWeight(400)
  .fontFamily("HarmonyHeiTi")
  .fontColor($r(`app.element.color.titleColor`))
  .width('100%')
  .lineHeight("20vp")
  .margin({ top: "8vp" })
}