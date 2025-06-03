import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { promptAction } from '@kit.ArkUI';

// 创建Axios实例
export const instance = axios.create({
  // 请求基地址 替换为自己项目的请求基地址
  baseURL: 'https://xxxxxxx',
});


// 请求拦截器  发请求之前进入这里
instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 这里可以对请求参数进行修改  比如请求头自动注入token
  return config;
}, (error: AxiosError) => {
  return Promise.reject(error);
});


// 响应拦截器
instance.interceptors.response.use((response: AxiosResponse) => {
  // 响应成功进入这里
  // 这里根据自己业务码进行判断  比如code为'ok'则返回数据  否则弹出错误提示
  if (response.data.code === '网络请求成功码') {
    return response.data.data;
  }
  // 提示错误信息  msg字段根据自己服务端返回的字段进行修改
  promptAction.showToast({ message: response.data.msg });
  return Promise.reject(new Error(response.data.msg));
}, (error: AxiosError) => {
  // 请求失败进入这里
  // 这里可以根据自己的业务逻辑进行修改 比如判断错误码进行错误提示 401 404 等等
  const res = error.response?.data as object;
  if (res) {
    // 提示服务端返回的错误信息
    promptAction.showToast({ message: res["msg"] });
  }
  return Promise.reject(error);
});


export class RequestAxios {
  // get请求
  static get<T>(url: string, params?: object): Promise<T> {
    return instance.get<null, T>(url, { params });
  }

  // post请求
  static post<T>(url: string, data?: object): Promise<T> {
    return instance.post<null, T>(url, data);
  }

  // delete请求
  static delete<T>(url: string, data?: object): Promise<T> {
    return instance.delete<null, T>(url, { data });
  }

  // put请求
  static put<T>(url: string, data?: object): Promise<T> {
    return instance.put<null, T>(url, data);
  }
}