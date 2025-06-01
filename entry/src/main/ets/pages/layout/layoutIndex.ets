import homeContent from "../home/homeContent"
import UserCenterContent from "../usercenter/UserCenterContent"

@Entry
@Component
struct LayoutIndex {
  @State currentIndex: number = 2;

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#3174d0' : '#000000')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End,
        index: this.currentIndex
      }) {
        TabContent() {
          homeContent()
        }.tabBar(this.tabBuilder('首页', 0, $r('app.media.home_sel'), $r('app.media.home_normal')))

        TabContent()
          .tabBar(this.tabBuilder('创作', 1, $r('app.media.codesandbox_sel'), $r('app.media.codesandbox_normal')))
        TabContent() {
          UserCenterContent()
        }.tabBar(this.tabBuilder('我的', 2, $r('app.media.my_sel'), $r('app.media.my_normal')))
      }.onChange((index: number) => {
        this.currentIndex = index
      })
    }.width('100%')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

  }
}