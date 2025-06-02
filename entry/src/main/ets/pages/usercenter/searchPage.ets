import { NavigationBar } from "../../components/navigationBar"
import router from '@ohos.router';

@Entry
@Component
struct SearchPage {
  build() {
    Column() {
      NavigationBar({ title: '区块链信息查询' })
      Text("请输入哈希值（含区块链地址）").margin({ bottom: 10 })
      Text("支持藏品、账户相关区块链信息查询").fontSize(12).fontColor($r("app.color.sub_font"))
      TextArea()
        .width("80%")
        .height(100)
        .border({ width: 1, color: $r("app.color.blue_font") })
        .borderRadius(8)
        .margin({ top: 10, bottom: 10 })

      Button("查询", { type: ButtonType.Normal, stateEffect: true }).width("80%").borderRadius(8).margin(10)
    }
    .width('100%')
    .height('100%')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}
