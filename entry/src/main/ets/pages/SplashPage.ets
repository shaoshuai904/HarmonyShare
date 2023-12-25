import common from '@ohos.app.ability.common';
import Logger from '../utils/Logger';
import router from '@ohos.router';
import { AppSettingKV } from '../utils/AppSettingKV';
import UserPrivacyDialog from '../view/dialog/UserPrivacyDialog';

/**
 * 启动页面.
 */
@Entry
@Component
export struct SplashPage {
  @State duration: number = 5; // 5s
  private intervalId: number = -1; // 计时器ID，记得关闭
  private timerId: number = -1; // 定时器ID
  private context = getContext(this) as common.UIAbilityContext;
  private dialogController: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      cancel: () => {
        this.exitApp()
      },
      confirm: () => {
        AppSettingKV.getInstance(this.context).setUserPrivacy(true)
        this.jumpHomePage();
      }
    }),
    cancel: () => {
      this.exitApp()
    },
    autoCancel: false,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -24 }
  });

  aboutToAppear() {
    // 开启计时器：固定时间刷新UI
    this.intervalId = setInterval(() => {
      if (this.duration > 0) {
        this.duration -= 1;
      }
    }, 1000)
    // 是否同意了用户隐私协议
    AppSettingKV.getInstance(this.context).getUserPrivacy().then((firstOpen) => {
      Logger.info('SplashPage aboutToAppear 首次打开app ？ ' + firstOpen)
      if (firstOpen === true) {
        this.dialogController.open();
      } else {
        // 开启定时器：3秒后自动跳转
        this.timerId = setTimeout(() => {
          this.jumpHomePage();
        }, 3000);
      }
    });
  }

  jumpHomePage() {
    router.replaceUrl({
      url: 'pages/MainPage',
      params: { data: 'Splash_Page_Data' }
    });
  }

  aboutToDisappear() {
    Logger.info('SplashPage aboutToDisappear ：timerId = ' + this.timerId + ' intervalId = ' + this.intervalId)
    // 用完了 setTimeout() 后需要关闭定时器 clearTimeout(id)
    clearTimeout(this.timerId);
    // 用完了 setInterval() 后需要关闭计时器 clearInterval(id)
    clearInterval(this.intervalId);
  }

  exitApp() {
    this.context.terminateSelf();
  }

  build() {
    Column() {

      Row() {
        if (this.duration > 0) {
          Text(`跳过 ${this.duration} s`)
            .fontSize("12vp")
            .fontColor("#FFFFFF")
            .borderRadius("16vp")
            .letterSpacing(0.1)
            .height("36vp")
            .backgroundColor('rgba(0,0,0,0.20)')
            .border({ color: "#FFFFFF", width: "1vp" })
            .margin({ top: "24vp" })
            .padding("8vp")
            .onClick(() => this.jumpHomePage())
        }
      }
      .width('90%')
      .height("60vp")
      .justifyContent(FlexAlign.End)

      Image($r('app.media.ic_launcher'))
        .width("120vp")
        .aspectRatio(1)
        .margin({ top: "90vp" });
      Text($r('app.string.app_name'))
        .fontFamily("HarmonyHeiTi-Bold")
        .fontSize("24vp")
        .fontColor("#182431")
        .fontWeight(700)
        .letterSpacing(0.1)
        .margin({ top: "20vp", bottom: "8vp" })
      Text("爱上分享新方式")
        .fontFamily("HarmonyHeiTi")
        .fontSize("16vp")
        .fontColor("#182431")
        .fontWeight(400)
        .letterSpacing(3.4)
        .opacity(0.6)
    }
    .width('100%')
    .height('100%')
    .backgroundImagePosition({ x: 0, y: 0 })
    .backgroundImage($r('app.media.ic_splash_bg'))
    .backgroundImageSize({ width: '100%', height: '100%' })

  }
}
