//
//  NetRequestManager.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, HttpRequestType) {
    GET = 0,
    POST
};

// 网络请求成功block
typedef void(^requestSuccess)(id successDic);
// 网络请求失败block
typedef void(^requestFailure)(NSError *error);
// 上传进度block
typedef void(^uploadProgress)(float progress);
// 下载进度block
typedef void(^downloadProgress)(float progress);

@interface NetRequestManager : AFHTTPSessionManager

/**
 *  单例方法
 *
 *  @return 实例对象
 */
+ (instancetype)shareManager;

/**
 *  网络请求的实例方法
 *
 *  @param type         get / post
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param successBlock 请求成功的回调
 *  @param failureBlock 请求失败的回调
 */
+ (void)requestWithType:(HttpRequestType)type withUrlString:(NSString *)urlString withParaments:(NSDictionary *)paraments withSuccessBlock:(requestSuccess)successBlock withFailureBlock:(requestFailure)failureBlock;

/**
 *  上传图片
 *
 *  @param parameters   上传图片预留参数---视具体情况而定 可移除
 *  @param imageArray   上传的图片数组
 *  @parm width      图片要被压缩到的宽度
 *  @param urlString    上传的url
 *  @param successBlock 上传成功的回调
 *  @param failureBlock 上传失败的回调
 *  @param progress     上传进度
 */
+ (void)uploadImageWithParaments:(NSDictionary *)parameters withImageArray:(NSArray *)imageArray withtargetWidth:(CGFloat)width withUrlString:(NSString *)urlString withSuccessBlock:(requestSuccess)successBlock withFailurBlock:(requestFailure)failureBlock withUpLoadProgress:(uploadProgress)progress;

/**
 *  视频上传
 *
 *  @param parameters   上传视频预留参数---视具体情况而定 可移除
 *  @param videoPath    上传视频的本地沙河路径
 *  @param urlString     上传的url
 *  @param successBlock 成功的回调
 *  @param failureBlock 失败的回调
 *  @param progress     上传的进度
 */
+ (void)uploadVideoWithParaments:(NSDictionary *)parameters withVideoPath:(NSString *)videoPath withUrlString:(NSString *)urlString withSuccessBlock:(requestSuccess)successBlock withFailureBlock:(requestFailure)failureBlock withUploadProgress:(uploadProgress)progress;


/**
 *  文件下载
 *
 *  @param parameters   文件下载预留参数---视具体情况而定 可移除
 *  @param savePath     下载文件保存路径
 *  @param urlString        请求的url
 *  @param successBlock 下载文件成功的回调
 *  @param failureBlock 下载文件失败的回调
 *  @param progress     下载文件的进度显示
 */
+ (void)downLoadFileWithParaments:(NSDictionary *)parameters withSavaPath:(NSString *)savePath withUrlString:(NSString *)urlString withSuccessBlock:(requestSuccess)successBlock withFailureBlock:(requestFailure)failureBlock withDownLoadProgress:(downloadProgress)progress;

/**
 *  取消所有的网络请求
 */
+(void)cancelAllRequest;

/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的url
 */
+(void)cancelHttpRequestWithRequestType:(NSString *)requestType requestUrlString:(NSString *)string;

@end
