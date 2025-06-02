@Component
export default struct HasCanceled {
  build() {
    Column() {
      Image($r("app.media.shopcar")).width("40%").margin({ top: 20, bottom: 20 })
      Text("您还没有相关订单").fontWeight(600)
      Text("此处将展示您购买的数字藏品订单").fontColor($r("app.color.sub_font")).margin({ top: 10 })
    }.width("100%").height("100%").justifyContent(FlexAlign.Start)
  }
}