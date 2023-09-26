/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class arrayType {
  image: Resource | null = null;
  name: string = '';
}

@Component
export default struct ThemeDesktop {
  @Link themeDatas: Array<arrayType>
  @State default: Array<arrayType> = [
    { image: $r('app.media.settings'), name: '电话' },
    { image: $r('app.media.settings'), name: '商城' },
    { image: $r('app.media.settings'), name: '备忘录' },
    { image: $r('app.media.settings'), name: '设置' },
    { image: $r('app.media.settings'), name: '相机' },
    { image: $r('app.media.settings'), name: '相册' },
    { image: $r('app.media.settings'), name: '音乐' },
    { image: $r('app.media.settings'), name: '视频' },
  ]

  build() {
    Grid() {
      ForEach(this.themeDatas, (item: arrayType) => {
        GridItem() {
          Column() {
            Image(item.image!)
              .width(70)
              .height(70)
              .objectFit(ImageFit.Fill)
            Text(item.name).fontSize(15)
          }
          .width(90)
          .height(90)
        }
      })
    }
    .rowsGap(10)
    .width('100%')
    .columnsGap(10)
    .layoutWeight(1)
    .padding({ top: 20 })
    .backgroundColor('#e5e5e5')
    .columnsTemplate('1fr 1fr 1fr 1fr')
  }
}