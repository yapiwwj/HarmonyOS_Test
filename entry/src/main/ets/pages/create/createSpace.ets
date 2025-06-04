import { router } from '@kit.ArkUI';
import type { CreateSpaceParams } from "../../types/create/type"

@Entry
@Component
struct CreateSpace {
  @State preParams: string = JSON.stringify(router.getParams())
  @State params: CreateSpaceParams = JSON.parse(this.preParams)

  build() {
    Column() {
      Column() {
        Button("创作", { type: ButtonType.Normal }).padding({ left: 30, right: 30 }).borderRadius(8)
      }.width("100%").alignItems(HorizontalAlign.End).margin({ top: 20, bottom: 20 })

      Column() {
        Row() {
          Text(this.params.title).fontColor("#8388B4").fontSize(18)
          Image($r("app.media.edit")).width("15").margin({ left: 5 })
        }.width("100%")

        Column() {
          TextArea({ placeholder: "在此写下您的寄语..." })
            .placeholderColor(Color.White)
            .placeholderFont({ size: 14 })
            .fontColor(Color.White)
        }
        .backgroundImage(this.params.img)
        .width("100%")
        .backgroundImageSize(ImageSize.Contain)
        .layoutWeight(1)
        .borderRadius(8)
      }
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r("app.media.createBg"))
    .backgroundImageSize(ImageSize.Cover)
    .padding({ left: 20, right: 20 })
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}