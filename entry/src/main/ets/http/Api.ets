//获取验证码
import { instance } from './Axios';

export function sendCode(phone: string) {
  // instance.get('/work/user/code',{params:{phone:"1111111"}})
  // .then((res:AxiosResponse)=>{console.log(JSON.stringify(res))})
  return instance.get('/word/user/code', { params: { phone: phone } });
}

interface loginPost{
  phone:string,
  code: string
}

//登录
export function login(phone: string, code: string) {
  return instance.post('/word/user/login',{ phone: phone, code: code } as loginPost );
}

interface createPosts{
  rightCount: number,
  answeredCount: number,
  timeUsed: number
}
// 打卡
export function createPost(post: createPosts) {
  return instance.post('/word/post/create', post)
}

//获取全部打卡列表
export function getAllPost(page: number, size: number) {
  return instance.get('/word/post/getAll', { params: { page: page, size: size } })
}

//点赞
export function like(postId: number) {
  return instance.get('/word/like/create', { params: { postId: postId } })
}

//取消点赞
export function cancelLike(postId: number) {
  return instance.get('/word/like/cancel', { params: { postId: postId } })
}

//获取登录用户信息
export function info() {
  return instance.get('/word/user/info')
}

//获取我的登录打卡记录
export function getMyPost(page: number, size: number) {
  return instance.get('/word/post/getMine', { params: { page: page, size: size } })
}