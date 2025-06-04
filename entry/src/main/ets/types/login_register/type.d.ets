interface Response {
  status: number,
  message: string
}

export interface RegisterRequest {
  username: string,
  password: string,
  phoneNumber: string
}

export type RegisterResponse = Response

export interface LoginRequest {
  username: string,
  password: string,
}

export type LoginResponse = Response