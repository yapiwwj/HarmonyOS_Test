@Component
export struct NavigationBar {
  @Prop title: string

  build() {
    Column() {

      Row() {
        Text(this.title).layoutWeight(1).textAlign(TextAlign.Center).fontSize(20).fontColor($r("app.color.top_title"))
      }

    }.width('100%').alignItems(HorizontalAlign.Start).padding(10)
  }
}