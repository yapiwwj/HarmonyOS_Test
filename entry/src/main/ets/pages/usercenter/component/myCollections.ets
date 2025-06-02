import { WaterFlowDataSource } from '../../../types/home/component/waterFlow';

@Component
export default struct MyCollections {
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()

  @Builder
  itemFoot() {
    Row() {
      LoadingProgress()
        .color(Color.Blue).height(50).aspectRatio(1).width('20%')
      Text(`正在加载`)
        .fontSize(20)
        .width('30%')
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }.width('100%').justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      WaterFlow({ footer: this.itemFoot.bind(this) }) {
        LazyForEach(this.dataSource, (item: Resource, index: number) => {
          FlowItem() {
            Column() {
              Image(item).objectFit(ImageFit.Fill).borderRadius({ topLeft: 8, topRight: 8 })
              Column() {
                Text("甲辰青绿").fontWeight(600)
                Text("编号：Csdhjs9u_dhfhjduiu")
                  .fontColor(Color.White)
                  .fontSize(10)
                  .backgroundColor($r("app.color.blue_font"))
                  .width("100%")
                  .margin({ top: 5, bottom: 5 })
                Text("浙传文化出品").fontColor($r("app.color.sub_font")).fontSize(10)
              }.padding(10).alignItems(HorizontalAlign.Start)
            }
            .borderRadius(8)
            .justifyContent(FlexAlign.Start)
            .alignItems(HorizontalAlign.Start)
            .shadow({ radius: 10, color: Color.Gray })
          }
        })
      }.columnsTemplate("1fr 1fr").columnsGap(10).rowsGap(10)
    }.width("90%").height("100%").justifyContent(FlexAlign.Start)

  }
}