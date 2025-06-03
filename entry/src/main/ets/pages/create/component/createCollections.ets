import type { CreateCard } from "../../../types/create/type"
import { router } from '@kit.ArkUI'

let CardTopRules: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
}

let CardBottomRules: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'left': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'bottom': { 'anchor': '__container__', 'align': HorizontalAlign.End }
}

@Component
export default struct CrerateCollections {
  @State CreateCardList: CreateCard[] = [
    {
      id: 0,
      title: "日暮长城",
      subtitle: "中国·长城",
      type: "图文",
      form: "明信片",
      views: 6.2,
      cardImage: $r("app.media.card1"),
    },
    {
      id: 1,
      title: "泰姬陵",
      subtitle: "印度",
      type: "图文",
      form: "明信片",
      views: 6.2,
      cardImage: $r("app.media.card2")
    },
    {
      id: 0,
      title: "自由女神像",
      subtitle: "美国",
      type: "图文",
      form: "明信片",
      views: 6.2,
      cardImage: $r("app.media.card3")
    }
  ]

  build() {
    Column() {
      List() {
        ForEach(this.CreateCardList, (item: CreateCard) => {
          ListItem() {
            Column() {
              RelativeContainer() {
                //头部
                Column() {
                  Text(item.title).fontSize(22).fontColor(Color.White)
                  Text(item.subtitle).fontColor(Color.White).margin({ top: 10, bottom: 10 }).fontSize(14)
                  Row() {
                    Text(item.type)
                      .fontSize(14)
                      .margin({ right: 5 })
                      .padding({ left: 5, right: 5 })
                      .fontColor(Color.White)
                      .backgroundColor("rgba(255,255,255,0.2)")
                      .border({ width: 1, color: Color.White })
                      .borderRadius(8)
                    Text(item.form)
                      .fontSize(14)
                      .margin({ right: 5 })
                      .padding({ left: 5, right: 5 })
                      .fontColor(Color.White)
                      .backgroundColor("rgba(255,255,255,0.2)")
                      .border({ width: 1, color: Color.White })
                      .borderRadius(8)
                  }
                }
                .alignRules(CardTopRules)
                .padding({ left: 5, top: 10 })
                .alignItems(HorizontalAlign.Start)

                //底部
                Row() {
                  Row() {
                    Image($r("app.media.eye")).width("20").margin({ left: 10, right: 10 })
                    Text(`${item.views}万人使用`).fontColor(Color.White).fontSize(12)
                  }

                  Text("立即使用")
                    .fontColor(Color.White)
                    .fontSize(12)
                    .border({ width: 1, color: Color.White })
                    .borderRadius(8)
                    .padding(5)
                    .onClick(() => {
                      router.pushUrl({
                        url: "pages/create/createSpace",
                        params: { title: item.title, img: item.cardImage }
                      })
                    })
                }
                .alignRules(CardBottomRules)
                .width("100%")
                .justifyContent(FlexAlign.SpaceBetween)
                .borderRadius({ bottomRight: 8, bottomLeft: 8 })
                .backgroundColor("rgba(0,0,0,0.6)")
                .padding(5)
              }
            }
            .width("90%")
            .height(200)
            .backgroundImage(item.cardImage)
            .backgroundImageSize(ImageSize.Cover)
            .margin(10)
            .borderRadius(8)
            .shadow({
              radius: 10,
              color: Color.Gray,
              offsetX: 0,
              offsetY: 0
            })
          }
        })
      }
      .alignListItem(ListItemAlign.Center)
    }.height("100%").justifyContent(FlexAlign.Start)
  }
}