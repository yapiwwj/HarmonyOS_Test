import CreateCollections from "./component/createCollections"


@Component
export default struct CreateContent {
  build() {
    Column() {
      Tabs() {
        TabContent() {
          CreateCollections()
        }
        .tabBar('创作藏品')


        TabContent() {
          Text('实物定制').fontSize(30)
        }
        .tabBar('实物定制')


        TabContent() {
          Text('AI作画').fontSize(30)
        }
        .tabBar('AI作画')

        TabContent() {
          Text('区块链查询').fontSize(30)
        }
        .tabBar("区块链查询")
      }.barMode(BarMode.Scrollable)
    }.height("100%")
  }
}