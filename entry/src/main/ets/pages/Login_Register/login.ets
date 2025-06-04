import { NavigationBar } from "../../components/navigationBar"
import router from '@ohos.router';
import type { LoginRequest, LoginResponse } from "../../types/login_register/type"
import ApiService from '../../utils/ApiService';

@Entry
@Component
struct Login {
  @State username: string = ''
  @State password: string = ''

  @Builder
  SubTittle(content: string) {
    Text(content)
      .fontColor($r("app.color.sub_font"))
      .fontSize(14)
      .margin({ left: 10, bottom: 10 })
      .textAlign(TextAlign.Start)
      .width("100%")
  }

  login() {
    const data: LoginRequest = {
      username: this.username,
      password: this.password
    }

    ApiService.post("/harmonyos/login", data).then((res) => {
      if (JSON.stringify(res.code) === '200') {
        router.pushUrl({ url: "pages/layout/layoutIndex" })
      }
    })
  }

  build() {
    Column() {
      NavigationBar({ title: '登录' })
      Text('输入你的用户名及密码登录').fontColor($r("app.color.top_subtitle")).fontSize(14)

      Column() {

        //输入用户名
        TextInput({
          placeholder: '用户名',
          text: $$this.username
        }).borderRadius(8).margin({ top: 5, bottom: 5 })
        this.SubTittle('请输入6-12位字符，仅支持小写字母及数字')

        //密码
        TextInput({
          placeholder: '密码',
          text: $$this.password
        }).borderRadius(8).margin({ top: 5, bottom: 5 }).type(InputType.Password)
        this.SubTittle('请输入6-12位字符，仅支持小写字母及数字')

        //登录
        Button('确定', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(16)
          .borderRadius(8)
          .width('100%')
          .margin({ top: 20, bottom: 15 })
          .onClick(() => {
            this.login()
          })

        Row() {
          Text('忘记密码？')
            .fontColor($r("app.color.blue_font"))
            .fontSize(14)
          Row() {
            Text('需要帮助？').fontColor($r("app.color.sub_font")).fontSize(14)
            Text('联系客服').fontColor($r("app.color.blue_font")).fontSize(14)
          }
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)

      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .padding({
        top: 10,
        left: 20,
        right: 20,
        bottom: 10
      })
    }
    .width('100%')
    .height('100%')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}
