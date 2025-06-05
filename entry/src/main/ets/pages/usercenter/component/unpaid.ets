import type { Order } from "../../../types/usercenter/type"

@Component
export default struct UnPaid {
  // @State OrderList: Order[] = [{
  //   id: 0,
  //   img: $r("app.media.waterflow_1"),
  //   title: "应县木塔",
  //   state: "待付款",
  //   price: 100.00
  // },
  //   {
  //     id: 1,
  //     img: $r("app.media.waterflow_1"),
  //     title: "珐琅五福瓶",
  //     state: "待付款",
  //     price: 100.00
  //   }]
  @State OrderList: Order[] = []

  build() {
    Column() {
      List() {
        ForEach(this.OrderList, (item: Order) => {
          ListItem() {
            Row() {
              Row() {
                Image(item.img).width("100").borderRadius(8)
                Column() {
                  Text(item.title).fontSize(18).fontWeight(600)
                  Text(`${item.price.toFixed(2)}元`).fontWeight(600)
                }
                .height(100)
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(HorizontalAlign.Start)
                .padding({ top: 10, bottom: 10, left: 10 })
              }

              Column() {
                Text(item.state).fontColor($r("app.color.orange_font")).fontWeight(600)
                Text("去付款")
                  .fontColor($r("app.color.blue_font"))
                  .backgroundColor(Color.White)
                  .border({ width: 1, color: $r("app.color.blue_font") })
                  .padding({
                    top: 5,
                    bottom: 5,
                    left: 10,
                    right: 10
                  })
                  .borderRadius(8)
              }
              .height(100)
              .justifyContent(FlexAlign.SpaceBetween)
              .padding({ top: 10, bottom: 10, right: 10 })

            }
            .width("99%")
            .height(100)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding(10)
            .borderRadius(8)
            .shadow({
              radius: 10,
              color: Color.Gray,
              offsetX: 0,
              offsetY: 0
            })

          }.width("100%").height(100).margin({ top: 10, bottom: 10 })
        })
      }
      .alignListItem(ListItemAlign.Center)

      Text("暂无更多").margin(20)
    }.width("90%").height("100%")
  }
}