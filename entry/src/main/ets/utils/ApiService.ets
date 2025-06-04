import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import { GetInfo } from './GetInfo';


const environment: string = 'http://127.0.0.1:3007' // 切换环境

export default class ApiService {
  static get(stringPath: string, params: object | null): Promise<GetInfo> {
    return new Promise((resolve, reject) => {
      const url = `${environment}${stringPath}`

      // 创建axios实例
      const instance = axios.create()

      // 添加请求拦截器
      instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
        console.log('Request URL:', config.url) // URL
        console.log('Request Params:', JSON.stringify(config.params)) // 参数
        return config;
      }, (error: AxiosError) => {
        return Promise.reject(error);
      })

      // 发送请求
      instance.get(url, {
        params: params
      })
        .then((resp: AxiosResponse) => {
          if (resp.status === 200) {
            console.log('查询成功', JSON.stringify(resp.data));
            resolve(resp.data);
          } else {
            console.log('查询信息失败，error：', JSON.stringify(resp));
            reject('查询信息失败')
          }
        })
        .catch((err: AxiosError) => {
          console.log('查询信息失败，error：', JSON.stringify(err));
          reject('查询信息失败')
        });
    });
  }

  static post(stringPath: string, data: object, cookie?: string): Promise<GetInfo> {
    return new Promise((resolve, reject) => {
      const url = `${environment}${stringPath}`;

      // 创建axios实例并配置
      const instance = axios.create({
        baseURL: environment,
        headers: {
          'cookie': cookie,
        },
      });

      // 添加请求拦截器，设置请求头中的Cookie
      instance.interceptors.request.use(
        (config: InternalAxiosRequestConfig) => {
          // 如果cookie不为空，则添加到请求头中
          if (cookie) {
            config.headers.Cookie = cookie;
          }
          console.log('Request URL:', config.url); // URL
          console.log('Request Data:', JSON.stringify(config.data)); // 数据
          console.log('Request Headers:', JSON.stringify(config.headers));
          return config;
        },
        (error: AxiosError) => {
          return Promise.reject(error);
        }
      );

      // 发送请求
      instance
        .post(url, data)
        .then((resp: AxiosResponse) => {
          if (resp.status === 200) {
            console.log('提交成功');
            resolve(resp.data); // 返回数据
          } else {
            console.log('提交失败，error：', JSON.stringify(resp));
            reject('提交失败');
          }
        })
        .catch((err: AxiosError) => {
          console.log('提交失败，error：', JSON.stringify(err));
          reject('提交失败');
        });
    });
  }
}