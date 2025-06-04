import { NavigationBar } from "../../components/navigationBar"
import router from '@ohos.router';
import type { RegisterRequest, RegisterResponse } from "../../types/login_register/type"
import ApiService from '../../utils/ApiService';

// @CustomDialog
// struct ButtonDialog {
//   controller: CustomDialogController
//
//   build() {
//     Column() {
//       Image($r("app.media.success")).width(30).height(30).objectFit(ImageFit.Contain)
//       Text("您已成功注册！").margin({ top: 10, bottom: 10 }).fontColor($r("app.color.sub_font"))
//       Text('返回登录').fontColor($r("app.color.top_subtitle")).fontColor($r("app.color.blue_font")).onClick(() => {
//         router.pushUrl({ url: "pages/Login_Register/login" })
//         this.controller.close()
//       })
//     }.justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center).borderRadius(8).height(150)
//   }
// }

@Entry
@Component
@Preview
struct Register {
  // dialogController: CustomDialogController = new CustomDialogController({
  //   builder: ButtonDialog(),
  // })

  @Builder
  OtherRegisterButton(title: ResourceStr, imgURL: string, path: string) {
    Row() {
      Image($r(`${imgURL}`)).width(20).margin({ left: 10, right: 10 })
      Text(title).fontSize(14).fontColor($r("app.color.sub_font")).fontSize(16)
    }
    .width('100%')
    .height(40)
    .border({ width: 1, color: $r("app.color.sub_font") })
    .borderRadius(8)
    .borderRadius(8)
    .justifyContent(FlexAlign.Center)
    .margin({ bottom: 10 })
    .onClick(() => router.pushUrl({ url: path }))
  }

  @Builder
  SubTittle(content: string) {
    Text(content)
      .fontColor($r("app.color.sub_font"))
      .fontSize(14)
      .margin({ left: 10, bottom: 10 })
      .textAlign(TextAlign.Start)
      .width("100%")
  }

  @State username: string = ''
  @State password: string = ''
  @State confirmedPassword: string = ''
  @State phoneNumber: string = ''
  @State inviteCode: string = ''
  @State select: boolean = false

  register() {
    const data: RegisterRequest = {
      username: this.username,
      password: this.password,
      phoneNumber: this.phoneNumber
    }
    ApiService.post("/harmonyos/register", data)
  }

  build() {
    Column() {
      NavigationBar({ title: '注册' })
      Text('快速创建账户，只要1分钟').fontColor($r("app.color.top_subtitle")).fontSize(14)

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

        //确认密码
        TextInput({
          placeholder: '密码',
          text: $$this.confirmedPassword
        }).borderRadius(8).margin({ top: 5, bottom: 5 }).type(InputType.Password)
        this.SubTittle('请输入6-12位字符，仅支持小写字母及数字')

        //输入手机号码
        TextInput({ placeholder: '手机号码', text: $$this.phoneNumber })
          .borderRadius(8)
          .type(InputType.PhoneNumber)
          .margin({ bottom: 10 })
        //输入邀请码
        TextInput({ placeholder: '邀请码（非必要）', text: $$this.inviteCode }).borderRadius(8).type(InputType.Normal)
        //单选框
        Row() {
          Checkbox().width(16).select($$this.select).margin(5)
          Text('我已年满18岁，并同意').fontColor($r("app.color.sub_font")).fontSize(14)
          Text('用户服务条款').fontColor($r("app.color.blue_font")).fontSize(14)
        }.padding(5)

        Button('立即注册', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(16)
          .borderRadius(8)
          .width('100%')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.register()
            // this.dialogController.open();
          })

        Text('OR').fontSize(14).fontColor($r("app.color.sub_font")).margin({ top: 10, bottom: 20 })

        //谷歌&微信登录
        this.OtherRegisterButton('使用谷歌注册', 'app.media.chrome', '')
        this.OtherRegisterButton('使用微信注册', 'app.media.weixin', '')

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
