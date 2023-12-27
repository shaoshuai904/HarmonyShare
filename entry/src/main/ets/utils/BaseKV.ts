import { Context } from '@ohos.abilityAccessCtrl';
import preferences from '@ohos.data.preferences';

export class BaseKV {
  private context: Context;
  private fileName: string;

  constructor(context: Context, fileName: string) {
    this.context = context;
    this.fileName = fileName;
  }

  getKVM(): Promise<preferences.Preferences> {
    return preferences.getPreferences(this.context, this.fileName);
  }

  async put(key: string, value: preferences.ValueType) {
    let kvm = await this.getKVM();
    await kvm.put(key, value);
    await kvm.flush();
  }

  async get(key: string, defValue: preferences.ValueType): Promise<preferences.ValueType> {
    let kvm = await this.getKVM();
    return await kvm.get(key, defValue);
  }

  // string
  async putString(key: string, value: string) {
    this.put(key, value);
  }

  async getString(key: string, defValue: string): Promise<string> {
    let kvm = await this.getKVM();
    return await kvm.get(key, defValue) as string;
  }

  // boolean
  async putBoolean(key: string, value: boolean) {
    this.put(key, value);
  }

  async getBoolean(key: string, defValue: boolean): Promise<boolean> {
    let kvm = await this.getKVM();
    return await kvm.get(key, defValue) as boolean;
  }

  // int
  async putNumber(key: string, value: number) {
    this.put(key, value);
  }

  async getNumber(key: string, defValue: number): Promise<number> {
    let kvm = await this.getKVM();
    return await kvm.get(key, defValue) as number;
  }
}
