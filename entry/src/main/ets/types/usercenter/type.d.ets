export interface UserOperation {
  id: number
  icon: Resource
  title: string
  path: string
}

export interface Setting {
  id: number,
  icon: Resource
  title: string,
  path: string
}

export interface Order {
  id: number,
  img: Resource,
  title: string,
  state: string,
  price: number
}