
/**
 * 图片 轮播图
 * Swiper component.
 */
@Component
export default struct SwiperComponent {
  /** 轮播图 item 点击 */
  private onClickItem: Function = (item: Resource, index: number) => {
    // Logger.info('BackTitleBar onBackClick ')
  };

  build() {
    Swiper() {
      ForEach(swiperImage, (item: Resource, index: number) => {
        Image(item)
          .width('100%')
          .height("150vp")
          .borderRadius("16vp")
          .backgroundColor(Color.White)
          .onClick(() => {
            this.onClickItem(item, index)
          })
      }, (item: Resource) => JSON.stringify(item))
    }
    .width('100%')
    .indicator(true)
    .indicatorStyle({ selectedColor: "#F74E42" })
    .autoPlay(true)
    .itemSpace(0)
    .displayCount(1)
    .margin({ top: "12vp", bottom: "12vp" })
  }
}


/**
 * 轮播图填充数据.
 */
const swiperImage: Resource[] = [
  $r("app.media.swiper_item_1"),
  $r('app.media.swiper_item_2'),
  $r("app.media.swiper_item_3")
];