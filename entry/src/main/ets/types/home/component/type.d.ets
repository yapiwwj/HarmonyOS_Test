export interface GoodsList {
  id: number,
  img: ResourceStr
  title: string
  subscribe: string
  total: number
  price: number
}

export interface ScalerInfoList {
  id: number,
  scalerID: number,
  username: string,
  avatar: string
}

export type GoodsListResponse = GoodsList

export interface TreasureList {
  id: number,
  title: string,
  subscribe: string,
  total: number,
  price: number,
  img: string
}