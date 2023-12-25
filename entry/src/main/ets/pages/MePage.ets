import { BackTitleBar } from '../view/BackTitleBar';
import { SettingItemView } from '../view/SettingItemView';
import { UserBaseInfo } from '../view/UserBaseInfo';

/**
 * 我的 页面.
 */
@Entry
@Component
export struct MePage {
  private titleParam: string = 'Me';
  @State nickname: string = 'Maple';
  @State signature: string = '这是一条简短的个人签名';

  build() {
    Column() {
      BackTitleBar({ title: this.titleParam })

      UserBaseInfo({
        nickname: this.nickname,
        signature: this.signature
      }).margin({ bottom: "50vp" })

      SettingItemView({
        itemTitle: "账号管理",
        onItemClick: () => {

        }
      })
      SettingItemView({
        itemTitle: "通用设置",
        onItemClick: () => {

        }
      })
      SettingItemView({
        itemTitle: "青少年模式",
        itemRightDes: "未开启",
        onItemClick: () => {

        }
      })
      SettingItemView({
        itemTitle: "关于",
        onItemClick: () => {

        }
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F1F3F5")
  }
}
