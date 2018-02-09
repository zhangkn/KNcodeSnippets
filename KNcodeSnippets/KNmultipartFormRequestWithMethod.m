//
//  KNmultipartFormRequestWithMethod.m
//  KNcodeSnippets
//
//  Created by devzkn on 09/02/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import "KNmultipartFormRequestWithMethod.h"

@implementation KNmultipartFormRequestWithMethod
    
/**
 AFMultipartFormData  上传验证码图片进行识别- 打码100
 POST http://dama.a4a.cn/api/upload HTTP/1.1
 file	表单文件	要上传到服务器识别的文件	m.gif


 @param imageData <#imageData description#>
 @param onSuccess <#onSuccess description#>
 @param onFailure <#onFailure description#>
 */
- (void)uploadChallenge:(NSData *)imageData success:(void (^)(NSURLResponse *, id))onSuccess failure:(void (^)(NSError *))onFailure {
    
    
    NSError *error;

    
//    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];

//    
//    NSMutableURLRequest *request = [serializer multipartFormRequestWithMethod:@"POST"
//                                                                    URLString:apiURLString
//                                                                   parameters:parameters
//                                                    constructingBodyWithBlock:^(id <AFMultipartFormData> formData) {
//                                                        [formData appendPartWithFileData:imageData name:@"file" fileName:@"captcha.gif" mimeType:@"image/gif"];
//                                                        [imageData release];
//                                                    }
//                                                                        error:&error];
//    if (!request) {
//        onFailure(error);
//        
//        
//    }
//        NSURLSessionDataTask *task = [manager uploadTaskWithStreamedRequest:request....
    
    
}
    
    /**
     请求打码兔的接口，进行解码

     
fileDataBase64
     
     通过POST文件打码方式二	Base64编码的字符串
     
     @param imageData <#imageData description#>
     @param onSuccess <#onSuccess description#>
     @param onFailure <#onFailure description#>
     */
    - (void)setup:(NSData *)imageData success:(void (^)(NSURLResponse *, id))onSuccess failure:(void (^)(NSError *))onFailure {
        
        NSString *apiURLString = @"http://api.dama2.com:7766/app/d2File";

        NSString *imgBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

//
//        AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
//        NSMutableURLRequest *request = [serializer requestWithMethod:@"POST"
//                                                           URLString:apiURLString
//                                                          parameters:nil
//                                                               error:nil];
//        request.timeoutInterval = 30;
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        [request setHTTPBody:[self makeHttpBody:parameters]];
        
        
//
        
//        AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
//        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//                                                     @"text/html",
//                                                     @"text/json",
//                                                     @"text/javascript",
//                                                     @"text/plain",
//                                                     nil];
        
//        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//        manager.responseSerializer = responseSerializer;
//        
//        [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//            
//            if (!error) {
//                onSuccess(response, responseObject);
//            } else {
//                onFailure(error);
//            }
//        }] resume];
        
        
    }
    
    
    

@end
