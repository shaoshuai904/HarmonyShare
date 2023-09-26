import { BackTitleBar } from '../view/BackTitleBar';
import Logger from '../utils/Logger';
import preferences from '@ohos.data.preferences';
import ThemeDesktop from '../view/ThemeDesktop';

const THEMES: Record<string, string | Resource>[][] = [
  [
    { 'image': $r('app.media.settings'), 'name': '电话' },
    { 'image': $r('app.media.settings'), 'name': '商城' },
    { 'image': $r('app.media.settings'), 'name': '备忘录' },
    { 'image': $r('app.media.settings'), 'name': '设置' },
    { 'image': $r('app.media.settings'), 'name': '相机' },
    { 'image': $r('app.media.settings'), 'name': '相册' },
    { 'image': $r('app.media.settings'), 'name': '音乐' },
    { 'image': $r('app.media.settings'), 'name': '视频' },
  ],
  [
    { 'image': $r("app.media.setting_simplicity"), 'name': '电话_s' },
    { 'image': $r("app.media.setting_simplicity"), 'name': '商城_s' },
    { 'image': $r("app.media.setting_simplicity"), 'name': '备忘录_s' },
    { 'image': $r("app.media.setting_simplicity"), 'name': '设置_s' },
    { 'image': $r("app.media.setting_simplicity"), 'name': '相机_s' },
    { 'image': $r("app.media.setting_simplicity"), 'name': '相册_s' },
    { 'image': $r("app.media.setting_simplicity"), 'name': '音乐_s' },
    { 'image': $r("app.media.setting_simplicity"), 'name': '视频_s' },
  ],
  [
    { 'image': $r("app.media.setting_pw"), 'name': '电话_pw' },
    { 'image': $r("app.media.setting_pw"), 'name': '商城_pw' },
    { 'image': $r("app.media.setting_pw"), 'name': '备忘录_pw' },
    { 'image': $r("app.media.setting_pw"), 'name': '设置_pw' },
    { 'image': $r("app.media.setting_pw"), 'name': '相机_pw' },
    { 'image': $r("app.media.setting_pw"), 'name': '相册_pw' },
    { 'image': $r("app.media.setting_pw"), 'name': '音乐_pw' },
    { 'image': $r("app.media.setting_pw"), 'name': '视频_pw' },
  ]
]
const PREFERENCES_NAME = 'theme.db'
const THEME_NAMES: string[] = ['default', 'simplicity', 'pomeloWhtie']
let preferenceTheme: preferences.Preferences | null = null

/**
 * 消息箱 页面.
 */
@Entry
@Component
export struct MessagePage {
  @State nowTheme: string = ''
  @State themeDatas: Record<string, string | Resource>[] = []

  async aboutToAppear() {
    //从内存中获取轻量级存储db文件
    await this.getPreferencesFromStorage()
    //从轻量级存储db文件中获取键名为theme的键值
    this.nowTheme = await this.getPreference()
    Logger.info(`sp get ${this.nowTheme}`)
    let index = THEME_NAMES.indexOf(this.nowTheme)
    this.themeDatas = THEMES[index]
  }

  async getPreferencesFromStorage() {
    let context = getContext(this) as Context
    preferenceTheme = await preferences.getPreferences(context, PREFERENCES_NAME)
  }

  async putPreference(data: string) {
    Logger.info(`Put begin`)
    if (preferenceTheme !== null) {
      await preferenceTheme.put('theme', data)
      await preferenceTheme.flush()
    }
  }

  async getPreference(): Promise<string> {
    Logger.info(`Get begin`)
    let theme: string = ''
    if (preferenceTheme !== null) {
      theme = await preferenceTheme.get('theme', 'default') as string
    }
    return theme
  }

  changeTheme(themeNum: number) {
    this.themeDatas = THEMES[themeNum]
    this.putPreference(THEME_NAMES[themeNum])
  }

  build() {
    Column() {
      BackTitleBar({ title: 'Message' })

      this.buildKVDemo()
      // DetailListComponent()

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }

  @Builder
  buildKVDemo() {
    Column() {
      Row() {
        Image($r('app.media.startIcon'))
          .height(30)
          .layoutWeight(1)
          .objectFit(ImageFit.ScaleDown)
          .bindMenu([
            {
              value: THEME_NAMES[0],
              action: () => {
                this.changeTheme(0)
              }
            },
            {
              value: THEME_NAMES[1],
              action: () => {
                this.changeTheme(1)
              }
            },
            {
              value: THEME_NAMES[2],
              action: () => {
                this.changeTheme(2)
              }
            }
          ])
      }
      .width('100%')
      .height(50)
      .backgroundColor('#0D9FFB')

      ThemeDesktop({ themeDatas: $themeDatas })
    }
    .width('100%')
    .height('100%')
  }
}

