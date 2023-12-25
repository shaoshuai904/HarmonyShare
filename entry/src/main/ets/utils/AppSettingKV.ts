import { Context } from '@ohos.abilityAccessCtrl';
import { BaseKV } from './BaseKV';

// setting key-value 文件名
const APP_SETTING_KV_FILE: string = 'app_kv_setting';

// /**
//  * 是否是第一次打开app
//  */
// const KEY_IS_FIRST_OPEN: string = 'key_is_first_open';
//
// export function setFirstOpen(context: Context, value: boolean) {
//   let kvm = new BaseKV(context, APP_SETTING_KV_FILE)
//   kvm.putBoolean(KEY_IS_FIRST_OPEN, value)
// }
//
// export function isFirstOpen(context: Context): Promise<boolean> {
//   let kvm = new BaseKV(context, APP_SETTING_KV_FILE)
//   return kvm.getBoolean(KEY_IS_FIRST_OPEN, false)
// }

export class AppSettingKV {
  private static instance: AppSettingKV;
  private _kvm: BaseKV;

  private constructor(context: Context) {
    this._kvm = new BaseKV(context, APP_SETTING_KV_FILE)
  }

  public static getInstance(context: Context): AppSettingKV {
    if (!AppSettingKV.instance) {
      AppSettingKV.instance = new AppSettingKV(context);
    }
    return AppSettingKV.instance;
  }

  // ----------------------------------------------------------
  private IS_PRIVACY: string = 'key_is_privacy';

  public setUserPrivacy(value: boolean) {
    this._kvm.putBoolean(this.IS_PRIVACY, value)
  }

  public getUserPrivacy(): Promise<boolean> {
    return this._kvm.getBoolean(this.IS_PRIVACY, false);
  }
}