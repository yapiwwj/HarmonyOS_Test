export interface CreateCard {
  id: number,
  uuid?: number,
  title: string,
  subtitle: string,
  type: string,
  form: string,
  views: number,
  cardImage: ResourceStr,
}

export interface CreateSpaceParams {
  title: string,
  img: ResourceStr
}