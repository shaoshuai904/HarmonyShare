import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { GlobalContext } from '../common/constants/GlobalContext';
import Logger from '../utils/Logger';

/**
 * 应用程序主入口
 * Lift cycle management of Ability.
 */
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    GlobalContext.getContext()
      .setObject("want", want)
      .setObject("launchParam", launchParam)

    Logger.info('EntryAbility Ability onCreate');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam) {
    GlobalContext.getContext()
      .setObject('abilityWant', want)
      .setObject('launchParam', launchParam);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    GlobalContext.getContext()
      .setObject("isForeground", true)

    // Main window is created, set main page for this ability
    Logger.info('EntryAbility Ability onWindowStageCreate');

    windowStage.loadContent("pages/SplashPage", (err, data) => {
      if (err.code) {
        Logger.info(`Failed to load the content. Cause: ${JSON.stringify(err) ?? ''}`);
        return;
      }
      Logger.info(`Succeeded in loading the content. Data: ${JSON.stringify(data) ?? ''}`);
    });
  }

  onForeground(): void {
    GlobalContext.getContext()
      .setObject("isForeground", true)
      .setObject("taskListChange", false)
    // Ability has brought to foreground
    Logger.info('EntryAbility Ability onForeground');
  }

  onBackground(): void {
    // 页面回退时，可以做一些数据更新保存操作
    // FormUtils.backgroundUpdateCard(GlobalContext.getContext().getObject('taskListChange') as boolean);

    // Ability has back to background
    Logger.info('EntryAbility Ability onBackground');
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.info('EntryAbility Ability onWindowStageDestroy');
  }

  onDestroy(): void {
    Logger.info('EntryAbility Ability onDestroy');
  }
}