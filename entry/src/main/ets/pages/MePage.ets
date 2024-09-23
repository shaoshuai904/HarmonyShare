import Logger from '../utils/Logger';
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
  //
  promise12: Promise<number> = new Promise((resolve: Function) => {
    setTimeout(() => {
      const randomNumber: number = Math.random();
      resolve(randomNumber);
    }, 2000);
  })

  aboutToAppear() {
    Logger.info('MePage aboutToAppear start ~')

    // this.promise12.then(result => {
    //   // 不会阻塞后续代码
    //   Logger.info('MePage promise12 : ' + result)
    // })

    this.aaa().then(result => {
      Logger.info('MePage aaa result~' + result)
    });


    Logger.info('MePage aboutToAppear end ~')
  }

  async aaa(): Promise<number> {
    Logger.info('MePage aaa : start')
    let res = await this.promise12;
    Logger.info('MePage aaa : ' + res)
    return res;
  }

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
