import common from '@ohos.app.ability.common';
import Logger from '../utils/Logger';
import router from '@ohos.router';
import { BackTitleBar } from '../view/BackTitleBar';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';


/**
 * 启动页面.
 */
@Entry
@Component
export struct SplashPage {
  private titleParam: string = 'Splash';
  private context = getContext(this) as common.UIAbilityContext;

  aboutToDisappear() {
    // 3秒后自动跳转
    Logger.info('SplashPage 3秒后自动跳转')
    setTimeout(() => {
      this.gotoHomePage()
    }, 3000);
  }

  gotoHomePage() {
    Logger.info('SplashPage 成功跳转页面')
    // let want: Want = {
    //   deviceId: '', // deviceId为空表示本设备
    //   bundleName: 'com.maple.ishare',
    //   moduleName: 'entry', // moduleName非必选
    //   abilityName: 'EntryAbility',
    //   parameters: { // 自定义信息
    //     instanceKey: 'custom info',
    //   },
    // }
    // this.context.startAbility(want).then(() => {
    //   Logger.info('成功跳转页面')
    // }).catch((err: BusinessError) => {
    //   Logger.info(`跳转页面失败，error code: ${err.code}, msg: ${err.message}`)
    // })

    router.replaceUrl({
      // url: 'ability/EntryAbility',
      url: 'pages/MainPage',
      params: { data: 'item.title' }
    });

    // postCardAction(this, {
    //   'action': 'router',
    //   'abilityName': 'ability/EntryAbility', // 只能跳转到当前应用下的UIAbility
    //   'params': {
    //     'targetPage': 'funB' // 在EntryAbility中处理这个信息
    //   }
    // })
  }

  build() {
    Column() {
      BackTitleBar({ title: this.titleParam })

      Button('点击跳转')
        .onClick(() => {
          this.gotoHomePage()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }
}
