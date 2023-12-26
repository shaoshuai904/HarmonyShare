import Logger from '../utils/Logger';

/**
 * Web 页面.
 */
@Entry
@Component
export struct WebPage {
  private controller = new WebController();
  private pageUrl: string = 'https://developer.huawei.com/consumer/cn/';

  // private pageUrl: string = 'https://baidu.com';
  // 本地文件
  // private pageUrl: string | Resource = $rawfile('textWeb.html');

  build() {
    Column() {

      Row() {
        Button('前进').onClick(() => {
          this.controller.forward();
        })
        Button('后退').onClick(() => {
          this.controller.backward();
        })
        Button('刷新').onClick(() => {
          this.controller.refresh();
        })
        Button('停止').onClick(() => {
          this.controller.stop();
        })
      }

      Row() {
        Button('清除历史').onClick(() => {
          this.controller.clearHistory();
        })
        Button('register JS').onClick(() => {
          this.controller.registerJavaScriptProxy({
            object: {
              method1: (data: string) => {
                Logger.info(`app 中 method 1 run = ${data}`)
                return `method 1 str = ${data}`
              },
              method2: () => {
                Logger.info(`app 中 method 2 run !`)
              }
            },
            name: 'objName',
            methodList: ['method1', 'method2']
          });
          this.controller.refresh();
        })
      }

      Web({ src: this.pageUrl, controller: this.controller })
        .zoomAccess(true)// 支持手势缩放
        .textZoomRatio(150)// 文本缩放，默认值100
        .javaScriptAccess(true)// 启用 js
          // .onConfirm((event) => {
          //   Logger.info(`WebPage event = ${event.message}` )
          //   return true
          // })
          // 调试日志
          // .onConsole((event) => {
          //   Logger.info(`WebPage onConsole = ${event.message.getMessage()}` )
          //   return false
          // })
        .onPageEnd(e => {
          this.controller.runJavaScript({
            script: 'test()',
            callback: result => {
              Logger.info(`执行JS中的方法 ： ${result}`)
            }
          })
        })

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.detail_page_background'))
  }
}
