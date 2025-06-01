import type { GoodsList, ScalerInfoList } from "../../../types/home/component/type"
import { WaterFlowDataSource } from '../../../types/home/component/waterFlow';

@Component
export default struct RecommondContent {
  RecommondScroller: Scroller = new Scroller();
  GoodsScroller: Scroller = new Scroller();
  ScalerScroller: Scroller = new Scroller();
  private goodsList: GoodsList[] = [
    {
      id: 0,
      img: "app.media.test1",
      title: "甲辰青绿",
      subscribe: "1W+",
      total: 1200,
      price: 100
    },
    {
      id: 1,
      img: "app.media.test1",
      title: "甲辰青绿",
      subscribe: "1W+",
      total: 1200,
      price: 100
    },
    {
      id: 2,
      img: "app.media.test1",
      title: "甲辰青绿",
      subscribe: "1W+",
      total: 1200,
      price: 100
    },
    {
      id: 3,
      img: "app.media.test1",
      title: "甲辰青绿",
      subscribe: "1W+",
      total: 1200,
      price: 100
    },
    {
      id: 4,
      img: "app.media.test1",
      title: "甲辰青绿",
      subscribe: "1W+",
      total: 1200,
      price: 100
    },
  ];
  private scalerInfoList: ScalerInfoList[] = [
    { id: 0, scalerID: 111, username: "宫廷" },
    { id: 1, scalerID: 222, username: "紫轩阁" },
    { id: 2, scalerID: 333, username: "文玩老店" },
    { id: 3, scalerID: 444, username: "哑舍" },
    { id: 4, scalerID: 555, username: "古董淘" },
    { id: 5, scalerID: 666, username: "瓷斋" },
    { id: 6, scalerID: 777, username: "木雕之王" },
  ]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()

  @Builder
  titleBuilder(title: string) {
    Row() {
      Text("——").fontColor($r("app.color.sub_font")).fontWeight(600)
      Text(title).fontWeight(600).padding({ left: 5, right: 5 })
      Text("——").fontColor($r("app.color.sub_font")).fontWeight(600)
    }.margin({ top: 5, right: 5, bottom: 10 })
  }

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
    Scroll(this.RecommondScroller) {
      Column() {
        //商品推荐
        Column() {
          this.titleBuilder("商品推荐")
          Scroll(this.GoodsScroller) {
            Row() {
              ForEach(this.goodsList, (item: GoodsList) => {
                Column() {
                  // 使用模板渲染每个商品的内容
                  Image($r(`${item.img}`)).width("100%").objectFit(ImageFit.Contain).borderRadius(8)
                  Text(item.title).fontWeight(600)
                  Text(`${item.subscribe}订阅`).fontWeight(400).fontSize(10).fontColor($r("app.color.sub_font"))
                  Row() {
                    Row() {
                      Text("限量")
                        .backgroundColor($r("app.color.orange_font"))
                        .fontSize(10)
                        .fontColor(Color.White)
                        .padding({ left: 2, right: 5 })
                        .margin({ right: 2 })
                        .borderRadius({ topLeft: 8, bottomLeft: 8 })
                      Text(`${item.total}份`).fontWeight(400).fontSize(10).fontColor($r("app.color.orange_font"))
                    }

                    Text(`￥${item.price}`).fontWeight(600).fontSize(14).fontColor($r("app.color.orange_font"))
                  }.justifyContent(FlexAlign.SpaceBetween).width("100%")
                }.width("33%").alignItems(HorizontalAlign.Start).margin({ left: 10, right: 10 })
              })
            }.alignItems(VerticalAlign.Top)
          }
          .scrollBarWidth(0)
          .scrollable(ScrollDirection.Horizontal) // 滚动方向为水平方向
          .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        }.margin({ bottom: 20 })

        //卖家推荐
        Column() {
          this.titleBuilder("卖家推荐")

          Scroll(this.ScalerScroller) {
            Row() {
              ForEach(this.scalerInfoList, (item: ScalerInfoList) => {
                Column() {
                  // 使用模板渲染每个商品的内容
                  Image($r("app.media.scaler")).width("100%")
                  Text(`${item.username}`).padding({ top: 5, bottom: 5 }).fontSize(14)
                  Text("关注")
                    .fontSize(12)
                    .backgroundColor($r("app.color.orange_font"))
                    .fontColor(Color.White)
                    .padding({ left: 5, right: 5 })
                    .borderRadius(8)

                }.width("20%").alignItems(HorizontalAlign.Center).margin({ left: 5, right: 5 })
              })
            }.alignItems(VerticalAlign.Top)
          }
          .scrollBarWidth(0)
          .scrollable(ScrollDirection.Horizontal) // 滚动方向为水平方向
          .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        }.margin({ bottom: 20 })

        //甄品推荐
        Column() {
          this.titleBuilder("甄品推荐")
          WaterFlow({ footer: this.itemFoot.bind(this) }) {
            LazyForEach(this.dataSource, (item: Resource, index: number) => {
              FlowItem() {
                Column() {
                  Image(item).objectFit(ImageFit.Fill).borderRadius({ topLeft: 8, topRight: 8 })
                  Column() {
                    Text("甲辰青绿").fontWeight(600)
                    Text("1w+订阅").fontColor($r("app.color.sub_font")).fontSize(10).margin({ bottom: 10 })
                    Row() {
                      Row() {
                        Text("限量")
                          .backgroundColor($r("app.color.orange_font"))
                          .fontSize(10)
                          .fontColor(Color.White)
                          .padding({ left: 2, right: 5 })
                          .margin({ right: 2 })
                          .borderRadius({ topLeft: 8, bottomLeft: 8 })
                        Text("100份")
                          .fontWeight(400)
                          .fontSize(10)
                          .fontColor($r("app.color.orange_font"))
                      }

                      Text("￥100").fontWeight(600).fontSize(14).fontColor($r("app.color.orange_font"))
                    }.justifyContent(FlexAlign.SpaceBetween).width("100%")
                  }.padding(10).alignItems(HorizontalAlign.Start)
                }
                .borderRadius(8)
                .justifyContent(FlexAlign.Start)
                .alignItems(HorizontalAlign.Start)
                .shadow({ radius: 10, color: Color.Gray })
              }
            })
          }.columnsTemplate("1fr 1fr").columnsGap(10).rowsGap(10)

        }.margin({ bottom: 20 })
      }.width("100%").justifyContent(FlexAlign.Start)
    }

  }
}
