import { NavigationBar } from "../../components/navigationBar"
import router from '@ohos.router';
import type { Setting } from "../../types/usercenter/type"
import { it } from '@ohos/hypium';

//设置分割线
class DividerTmp {
  strokeWidth: Length = 1;
  startMargin: Length = 60;
  endMargin: Length = 10;
  color: ResourceColor = '#ffe9f0f0';

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth;
    this.startMargin = startMargin;
    this.endMargin = endMargin;
    this.color = color;
  }
}

@Entry
@Component
struct Settings {
  private setting_top: Setting[] = [
    {
      id: 0,
      title: "账号与安全",
      icon: $r("app.media.my_normal"),
      path: ''
    },
    {
      id: 1,
      title: "消息通知与设置",
      icon: $r("app.media.message"),
      path: ''
    }, {
    id: 2,
    title: "通用设置",
    icon: $r("app.media.settings"),
    path: ''
  },
    {
      id: 3,
      title: "隐私设置",
      icon: $r("app.media.lock"),
      path: ''
    },

  ]
  private setting_bottom: Setting[] = [
    {
      id: 0,
      title: "关于app",
      icon: $r("app.media.about"),
      path: ''
    },
    {
      id: 1,
      title: "分享app",
      icon: $r("app.media.share_icon"),
      path: ''
    }
  ]
  @State egDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0');

  build() {
    Column() {
      NavigationBar({ title: '设置' })

      List() {
        ForEach(this.setting_top, (item: Setting) => {
          ListItem() {
            Row() {
              Image(item.icon)
                .width(20)
                .margin(10)
              Text(item.title)
              Blank()
                .layoutWeight(1)
              Image($r("sys.media.ohos_ic_public_arrow_right"))
                .size({ height: 30, width: 30 })
            }
            .width('100%')
            .onClick(() => {
              router.pushUrl({ url: item.path })
            })
          }
        }, (item: Setting) => JSON.stringify(item))
      }
      .width('90%')
      .divider(this.egDivider)
      .shadow({
        radius: 10,
        color: Color.Gray,
        offsetX: 0,
        offsetY: 0
      })
      .padding(5)
      .borderRadius(8)
      .margin({ bottom: 20 })

      //下选项
      List() {
        ForEach(this.setting_bottom, (item: Setting) => {
          ListItem() {
            Row() {
              Image(item.icon)
                .width(20)
                .margin(10)
              Text(item.title)
              Blank()
                .layoutWeight(1)
              Image($r("sys.media.ohos_ic_public_arrow_right"))
                .size({ height: 30, width: 30 })
            }
            .width('100%')
            .onClick(() => {
              router.pushUrl({ url: item.path })
            })
          }
        }, (item: Setting) => JSON.stringify(item))
      }
      .width('90%')
      .divider(this.egDivider)
      .shadow({
        radius: 10,
        color: Color.Gray,
        offsetX: 0,
        offsetY: 0
      })
      .padding(5)
      .borderRadius(8)
      .margin({ bottom: 20 })

      Button("退出登录", { type: ButtonType.Normal, stateEffect: true }).width("80%").borderRadius(8).margin(10)
    }
    .width('100%')
    .height('100%')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}
