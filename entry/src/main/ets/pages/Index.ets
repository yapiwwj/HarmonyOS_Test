import router from '@ohos.router';

@Extend(Text)
function TitleStyles() {
  .fontSize(20)
  .fontColor(Color.White)
}

@Entry
@Component
struct Index {
  aboutToAppear(): void {
  }

  build() {
    Column() {
      //标题
      Row() {
        Text('——').TitleStyles()
        Text('甄品').TitleStyles().fontSize(30)
        Text('——').TitleStyles()
      }

      Text('NTF').fontColor(Color.White).fontSize(12)

      //button1
      Button() {
        Row() {
          Text('登录').layoutWeight(1).fontColor(Color.White)
        }
      }
      .width(150)
      .padding(10)
      .backgroundColor($r("app.color.blue_font"))
      .opacity(.8)
      .margin(10)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/Login_Register/login'
        })
      })

      //button2
      Button() {
        Row() {
          Text('注册').layoutWeight(1).fontColor($r("app.color.blue_font"))
        }
      }
      .width(150)
      .padding(10)
      .backgroundColor("#ffffff")
      .border({
        width: 1,
        color: "#2669fe"
      })
      .opacity(.9)
      .margin(10)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/Login_Register/register'
        })
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#bde6f9')
    .backgroundImage($r('app.media.background'))
    .backgroundImageSize({
      width: 700,
      height: 600
    })
    .backgroundImagePosition({
      x: -200,
      y: -150
    })
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}