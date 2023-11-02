import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import Logger from '../utils/Logger';

/**
 * 程序启动页面.
 */
export default class SplashAbility extends UIAbility {

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('SplashAbility Ability onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.info('SplashAbility Ability onWindowStageCreate');

    windowStage.loadContent("pages/SplashPage", (err, data) => {
      if (err.code) {
        Logger.error(`Failed to load the content. Cause: ${JSON.stringify(err) ?? ''}`);
        return;
      }
      Logger.info(`Succeeded in loading the content. Data: ${JSON.stringify(data) ?? ''}`);
    });
  }

  // gotoHomePage() {
  //   Logger.info('gotoHomePage')
  //   let context: common.UIAbilityContext = getContext() as common.UIAbilityContext
  //   let want: Want = {
  //     deviceId: '', // deviceId为空表示本设备
  //     bundleName: 'com.maple.ishare',
  //     moduleName: 'entry', // moduleName非必选
  //     abilityName: 'EntryAbility',
  //     parameters: { // 自定义信息
  //       instanceKey: 'custom info',
  //     },
  //   }
  //   context.startAbility(want).then(() => {
  //     Logger.info('成功跳转页面')
  //   }).catch((err: BusinessError) => {
  //     Logger.info(`跳转页面失败，error code: ${err.code}, msg: ${err.message}`)
  //   })
  // }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.info('SplashAbility Ability onForeground');

    // 3秒后自动跳转
    // setTimeout(() => {
    //   this.gotoHomePage()
    // }, 3000);
  }

  onBackground(): void {
    // Ability has back to background
    Logger.info('SplashAbility Ability onBackground');
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.info('SplashAbility Ability onWindowStageDestroy');
  }

  onDestroy(): void {
    Logger.info('SplashAbility Ability onDestroy');
  }
}