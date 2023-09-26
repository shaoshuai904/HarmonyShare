import hilog from '@ohos.hilog'

class Logger {
  private domain: number
  private prefix: string
  private format: string = '%{public}s'

  constructor(prefix: string) {
    this.prefix = prefix
    this.domain = 0xFF00
  }

  debug(msg: string) {
    hilog.debug(this.domain, this.prefix, this.format, msg)
  }

  info(msg: string) {
    hilog.info(this.domain, this.prefix, this.format, msg)
  }

  warn(msg: string) {
    hilog.warn(this.domain, this.prefix, this.format, msg)
  }

  error(msg: string) {
    hilog.error(this.domain, this.prefix, this.format, msg)
  }
}

export default new Logger('[Ms_Log]')