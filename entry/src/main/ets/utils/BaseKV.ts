import { Context } from '@ohos.abilityAccessCtrl'
import preferences from '@ohos.data.preferences'

let preferenceTheme: preferences.Preferences | null = null

class BaseKV {

  constructor(context: Context, fileName: string) {
     this.getPreferencesFromStorage(context, fileName)
  }

  async getPreferencesFromStorage(context: Context, fileName: string) {
    preferenceTheme = await preferences.getPreferences(context, fileName)
  }

  async putString(key: string, value: string) {
    if (preferenceTheme !== null) {
      await preferenceTheme.put(key, value)
      await preferenceTheme.flush()
    }
  }

  async getString(key: string, defValue: string): Promise<string> {
    let theme: string = ''
    if (preferenceTheme !== null) {
      theme = await preferenceTheme.get(key, defValue) as string
    }
    return theme
  }

}

// export default new Logger('[Preferences]')