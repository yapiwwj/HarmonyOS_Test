import RecommondContent from "../home/component/recommond"
import NewContent from "../home/component/new"
import HotContent from "../home/component/hot"
import GoodContent from '../home/component/good'

@Component
export default struct homeContent {
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      //logo
      Row() {
        Row() {
          Image($r("app.media.logo")).width(40).objectFit(ImageFit.Contain)
          Text("甄品").margin({ left: 5 }).fontSize(20).fontWeight(600)
        }

        Image($r("app.media.message")).width(25).objectFit(ImageFit.Contain)
      }.width("100%").justifyContent(FlexAlign.SpaceBetween)

      //search
      Row() {
        Image($r("app.media.search")).width(40).objectFit(ImageFit.Contain)
        TextInput({ placeholder: '搜索藏品' }).width("70%")
        Image($r("app.media.rl")).width(20).objectFit(ImageFit.Contain)
      }.width("100%").justifyContent(FlexAlign.SpaceAround)

      Scroll(this.scroller) {
        Column() {
          //轮播图
          Swiper() {
            Text('0')
              .width('95%')
              .height('150')
              .backgroundColor(Color.Orange)
              .textAlign(TextAlign.Center)
              .fontSize(30)

            Text('1')
              .width('95%')
              .height('150')
              .backgroundColor(Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(30)

            Text('2')
              .width('95%')
              .height('150')
              .backgroundColor(Color.Pink)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }
          .loop(true)
          .autoPlay(true)
          .interval(3000)
          .margin({ top: 10, bottom: 10 })
          .borderRadius(8)

          //邀请
          Image($r("app.media.invite")).width("100%")

          Column() {
            Tabs({ barPosition: BarPosition.Start }) {
              TabContent() {
                RecommondContent()
              }
              .tabBar('推荐')

              TabContent() {
                NewContent()
              }
              .tabBar('最新')

              TabContent() {
                HotContent()
              }
              .tabBar('最火')

              TabContent() {
                GoodContent()
              }
              .tabBar("甄选")
            }
          }
        }

      }
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(5) // 滚动条宽度
      .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹

    }.width("100%").height("100%").padding({ left: 10, right: 10 }).justifyContent(FlexAlign.Start)
  }
}