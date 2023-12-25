import { Context } from '@ohos.abilityAccessCtrl'
import preferences from '@ohos.data.preferences'

let preferenceTheme: preferences.Preferences | null = null

export class BaseKV {
  constructor(context: Context, fileName: string) {
    this.getPreferencesFromStorage(context, fileName)
  }

  async getPreferencesFromStorage(context: Context, fileName: string) {
    preferenceTheme = await preferences.getPreferences(context, fileName)
  }

  async put(key: string, value: preferences.ValueType) {
    if (preferenceTheme !== null) {
      await preferenceTheme.put(key, value)
      await preferenceTheme.flush()
    }
  }

  async get(key: string, defValue: preferences.ValueType): Promise<preferences.ValueType> {
    if (preferenceTheme !== null) {
      return await preferenceTheme.get(key, defValue)
    }
    return defValue
  }

  // string
  async putString(key: string, value: string) {
    if (preferenceTheme !== null) {
      await preferenceTheme.put(key, value)
      await preferenceTheme.flush()
    }
  }

  async getString(key: string, defValue: string): Promise<string> {
    if (preferenceTheme !== null) {
      return await preferenceTheme.get(key, defValue) as string
    }
    return defValue
  }

  // boolean
  async putBoolean(key: string, value: boolean) {
    if (preferenceTheme !== null) {
      await preferenceTheme.put(key, value)
      await preferenceTheme.flush()
    }
  }

  async getBoolean(key: string, defValue: boolean): Promise<boolean> {
    if (preferenceTheme !== null) {
      return await preferenceTheme.get(key, defValue) as boolean
    }
    return defValue
  }

  // int
  async putNumber(key: string, value: number) {
    if (preferenceTheme !== null) {
      await preferenceTheme.put(key, value)
      await preferenceTheme.flush()
    }
  }

  async getNumber(key: string, defValue: number): Promise<number> {
    if (preferenceTheme !== null) {
      return await preferenceTheme.get(key, defValue) as number
    }
    return defValue
  }
}
