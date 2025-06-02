import { NavigationBar } from "../../components/navigationBar"
import UnPaid from "./component/unpaid"
import HasPaid from "./component/haspaid"
import HasCanceled from "./component/hascanceled"

@Entry
@Component
struct Order {
  @State message: string = 'Hello World';

  build() {
    Column() {
      NavigationBar({ title: '我的订单' })
      Tabs() {
        TabContent() {
          UnPaid()
        }
        .tabBar('全部')

        TabContent() {
          UnPaid()
        }
        .tabBar('待付款')

        TabContent() {
          HasPaid()
        }.tabBar('已付款')

        TabContent() {
          HasCanceled()
        }.tabBar("已取消")
      }.barMode(BarMode.Scrollable).divider({ strokeWidth: 1 })
    }.width("100%").height("100%")
  }
}