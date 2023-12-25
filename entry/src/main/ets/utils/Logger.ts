import hilog from '@ohos.hilog'

class Logger {
  private domain: number
  private prefix: string
  private format: string = '%{public}s'

  constructor(prefix: string = '', domain: number = 0xFF02) {
    this.prefix = prefix
    this.domain = domain
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