import { AxiosError } from '@ohos/axios';
import type { GoodsList, ScalerInfoList, GoodsListResponse, TreasureList } from "../../../types/home/component/type"
import { WaterFlowDataSource } from '../../../types/home/component/waterFlow';
import ApiService from '../../../utils/ApiService';
import { GetInfo } from '../../../utils/GetInfo';

@Component
export default struct RecommondContent {
  RecommondScroller: Scroller = new Scroller();
  GoodsScroller: Scroller = new Scroller();
  ScalerScroller: Scroller = new Scroller();
  @State private goodsList: GoodsList[] = [];
  @State private scalerInfoList: ScalerInfoList[] = []
  @State private treasureList: TreasureList[] = []
  datasource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];
  @State minSize: number = 130;
  @State maxSize: number = 260;

  @Builder
  titleBuilder(title: string) {
    Row() {
      Text("——").fontColor($r("app.color.sub_font")).fontWeight(600)
      Text(title).fontWeight(600).padding({ left: 5, right: 5 })
      Text("——").fontColor($r("app.color.sub_font")).fontWeight(600)
    }.margin({ top: 5, right: 5, bottom: 10 })
  }

  @Builder
  itemFoot() {
    Row() {
      LoadingProgress()
        .color(Color.Blue).height(50).aspectRatio(1).width('20%')
      Text(`正在加载`)
        .fontSize(20)
        .width('30%')
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }.width('100%').justifyContent(FlexAlign.Center)
  }

  getGoodsList() {
    ApiService.get("/harmonyos/goodslist", null)
      .then((respose: GetInfo) => {
        this.goodsList = respose.data as GoodsList[]
      })
      .catch((error: AxiosError) => {
        console.log(JSON.stringify(error))
      })
  }

  // 计算FlowItem宽/高，使用智能随机算法
  getSize(prevHeight: number | null = null) {
    let baseRandom = Math.random();
    let ret: number;
    if (prevHeight === null) {
      // 第一个元素，正常随机生成
      ret = Math.floor(baseRandom * (this.maxSize - this.minSize)) + this.minSize;
    } else {
      // 考虑前一个元素的高度，避免高度差异过大
      let adjustmentRange = Math.min(30, (this.maxSize - this.minSize) / 2);
      let minAdjusted = Math.max(this.minSize, prevHeight - adjustmentRange);
      let maxAdjusted = Math.min(this.maxSize, prevHeight + adjustmentRange);
      ret = Math.floor(baseRandom * (maxAdjusted - minAdjusted)) + minAdjusted;
    }
    return ret;
  }

  // 设置FlowItem的宽/高数组
  setItemSizeArray() {
    let prevHeight: number | null = null;
    ApiService.get("/harmonyos/treasureList", null).then((res: GetInfo) => {
      this.treasureList = res.data as TreasureList[]
      // console.log(this.treasureList.length + "")
      for (let i = 0; i < this.treasureList.length; i++) {
        let width = this.getSize();
        let height = this.getSize(prevHeight);
        this.itemWidthArray.push(width);
        this.itemHeightArray.push(height);
        prevHeight = height;
      }
    })

  }

  getScalerInfoList() {
    ApiService.get("/harmonyos/scalerInfoList", null).then((res: GetInfo) => {
      this.scalerInfoList = res.data as ScalerInfoList[]
    }).catch((error: AxiosError) => {
      console.log(JSON.stringify(error))
    })
  }

  // 新增数据，并保存flow item宽/高
  getTreasureList() {
    ApiService.get("/harmonyos/treasureList", null).then((res: GetInfo) => {
      this.treasureList = res.data as TreasureList[]
      console.log(this.treasureList.length + "")
    })

    // for (let i = 0; i < this.treasureList.length; i++) {
    //   this.datasource.updateData(i)
    // }
  }

  aboutToAppear() {
    this.getGoodsList()
    this.getScalerInfoList()
    // this.getTreasureList()

    this.setItemSizeArray();
  }

  build() {
    Scroll(this.RecommondScroller) {
      Column() {
        // //商品推荐
        // Column() {
        //   this.titleBuilder("商品推荐")
        //   Scroll(this.GoodsScroller) {
        //     Row() {
        //       ForEach(this.goodsList, (item: GoodsList) => {
        //         Column() {
        //           // 使用模板渲染每个商品的内容
        //           Image(`${item.img}`).width("120").objectFit(ImageFit.Contain).borderRadius(8)
        //           Text(item.title).fontWeight(600)
        //           Text(`${item.subscribe}订阅`).fontWeight(400).fontSize(10).fontColor($r("app.color.sub_font"))
        //           Row() {
        //             Row() {
        //               Text("限量")
        //                 .backgroundColor($r("app.color.orange_font"))
        //                 .fontSize(10)
        //                 .fontColor(Color.White)
        //                 .padding({ left: 2, right: 5 })
        //                 .margin({ right: 2 })
        //                 .borderRadius({ topLeft: 8, bottomLeft: 8 })
        //               Text(`${item.total}份`).fontWeight(400).fontSize(10).fontColor($r("app.color.orange_font"))
        //             }
        //
        //             Text(`￥${item.price}`).fontWeight(600).fontSize(14).fontColor($r("app.color.orange_font"))
        //           }.justifyContent(FlexAlign.SpaceBetween).width("100%")
        //         }.width("33%").alignItems(HorizontalAlign.Start).margin({ left: 10, right: 10 })
        //       })
        //     }.alignItems(VerticalAlign.Top)
        //   }
        //   .scrollBarWidth(0)
        //   .scrollable(ScrollDirection.Horizontal) // 滚动方向为水平方向
        //   .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        // }.margin({ bottom: 20 })
        //
        // //卖家推荐
        // Column() {
        //   this.titleBuilder("卖家推荐")
        //
        //   Scroll(this.ScalerScroller) {
        //     Row() {
        //       ForEach(this.scalerInfoList, (item: ScalerInfoList) => {
        //         Column() {
        //           // 使用模板渲染每个商品的内容
        //           Image(item.avatar).width(60).height(60).objectFit(ImageFit.Contain).borderRadius(90)
        //           Text(`${item.username}`).padding({ top: 5, bottom: 5 }).fontSize(14)
        //           Text("关注")
        //             .fontSize(12)
        //             .backgroundColor($r("app.color.orange_font"))
        //             .fontColor(Color.White)
        //             .padding({ left: 5, right: 5 })
        //             .borderRadius(8)
        //
        //         }.width("20%").alignItems(HorizontalAlign.Center).margin({ left: 5, right: 5 })
        //       })
        //     }.alignItems(VerticalAlign.Top)
        //   }
        //   .scrollBarWidth(0)
        //   .scrollable(ScrollDirection.Horizontal) // 滚动方向为水平方向
        //   .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        // }.margin({ bottom: 20 })

        //甄品推荐
        Column() {
          this.titleBuilder("甄品推荐")
          WaterFlow() {
            LazyForEach(this.datasource, (item: number) => {
              FlowItem() {
                Column() {
                  Text("N" + item).fontSize(12).height('16')
                  // 存在对应的文件才会显示图片
                  // Image($r('app.media.phone4'))
                  //   .objectFit(ImageFit.Fill)
                  //   .width('100%')
                  //   .layoutWeight(1)
                }
              }
              .width('100%')
              .height(this.itemHeightArray[item % 100])
            }, (item: string) => item)
          }
          .columnsTemplate("1fr 1fr")
          .columnsGap(10)
          .rowsGap(5)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('100%')

        }.margin({ bottom: 20 })
      }.width("100%").height("100%").justifyContent(FlexAlign.Start)
    }
  }
}