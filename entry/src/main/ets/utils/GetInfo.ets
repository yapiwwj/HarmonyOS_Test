export class GetInfo {
  code: number
  msg: string
  data: null | string | number | Array<object> | object

  constructor(code: number, msg: string, data: null | string | number | Array<object> | object) {
    this.code = code
    this.msg = msg
    this.data = data
  }
}