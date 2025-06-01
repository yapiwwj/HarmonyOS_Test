let baseInfoRules: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
  'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
}

let avatarRules: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'bottom': { 'anchor': '__container__', 'align': HorizontalAlign.Center }
}

let iconRules: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
}


@Component
@Preview
export default struct UserCenterContent {
  @State message: string = 'Hello World';

  build() {
    Column() {
      RelativeContainer() {
        Column() {
          RelativeContainer() {
            Row() {
              Image($r("app.media.scan")).width(20).margin({ right: 10 })
              Image($r("app.media.message")).width(20)
            }
            .width("100%")
            .justifyContent(FlexAlign.End)
            .width("100%")
            .alignRules(iconRules)
            .offset({ x: -10, y: -5 })

            Row() {
              Image($r("app.media.scaler")).width("60").offset({
                x: 20,
                y: -30
              }).border({ width: 2, color: Color.Black }).borderRadius(90)

              Text("编辑资料")
                .fontSize(14)
                .margin(10)
                .padding({
                  top: 5,
                  bottom: 5,
                  left: 15,
                  right: 15
                })
                .backgroundColor(Color.White)
                .border({ width: 1, color: $r("app.color.blue_font") })
                .fontColor($r("app.color.blue_font"))
                .borderRadius(16)
            }
            .width("100%")
            .alignRules(avatarRules)
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(VerticalAlign.Top)

            Column() {
              Text("数技1王文杰").fontSize(18).fontWeight(600)
              Row() {
                Text("ID: 220207137").fontSize(12).fontColor($r("app.color.sub_font"))
                Text("  |  ").fontSize(12).fontColor($r("app.color.sub_font"))
                Text("IP属地：浙江").fontSize(12).fontColor($r("app.color.sub_font"))
              }.margin({ top: 5, bottom: 5 })

              Text("区块链地址：8dsdhjjds89—dadsddshdkrjkr47348").fontSize(12).fontColor($r("app.color.sub_font"))
            }.width("100%").offset({ x: 20, y: 40 }).alignItems(HorizontalAlign.Start)
          }
        }
        .justifyContent(FlexAlign.Center)
        .width("100%")
        .height(120)
        .backgroundColor(Color.White)
        .alignRules(baseInfoRules)
        .id("baseInfo")
        .shadow({
          radius: 10,
          color: Color.Gray,
          offsetX: 20,
          offsetY: 20
        })
        .borderRadius({ topLeft: 16, topRight: 16 })

      }
      .width("100%")
      .height(250)
      .backgroundImage($r("app.media.user_bg"))
      .backgroundImageSize({ width: "100%", height: "100%" })

      Column() {
        Text("123")
      }
    }.width("100%").height("100%").expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

  }
}