//
//  KNRegex.m
//  KNcodeSnippets
//
//  Created by devzkn on 21/01/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import "KNRegex.h"
#import <UIKit/UIKit.h>



@implementation KNRegex






/**
 从html 中匹配URL
 @param arg1 <#arg1 description#>
 */
- (void)webViewDidFinishLoad:(id)arg1{
//    %log();
//    %orig;
    UIWebView *webView =  [self webView];
    NSString *lJs = @"document.documentElement.innerHTML";//获取当前网页的html
    // - (void)evaluateJavaScriptFromString:(id)arg1 completionBlock:(CDUnknownBlockType)arg2;
    // - (void)evaluateJavaScriptFromString:(NSString *)arg1 completionBlock:(void (^)(NSString *, NSError *))arg2;
    [webView evaluateJavaScriptFromString:lJs completionBlock:^(NSString *currentHTML, NSError *err){
        // NSLog(@"currentHTML :%@",currentHTML);
       	// NSString *parten = @"<h4*h4>";
       	// [a-zA-z]+://[^\s]*
       	// (.+?)：“()”是分组匹配，“.”是任意字符匹配，“+”是匹配一到多个，“?”是非贪婪匹配，即最少字符匹配，否则会匹配到一些冗余信息。
       	// NSString *parten = @"<h4(.+?)hrefs=\"(\s\S)\">(\s\S)</h4>";//       	NSString *parten = @"<h(.+?)hrefs=\"(.+?)\">(.+?)</h4>";
       	// NSString *parten = @"[a-zA-z]+://(.+)";//       	NSString *parten = @"<h(.+?)hrefs=\"(.+?)\">(.+?)</h4>";
        //
       	NSString *parten = @"[a-zA-z]+://mp.weixin.qq.com/s?.__biz=(.+)";//       	NSString *parten = @"<h(.+?)hrefs=\"(.+?)\">(.+?)</h4>";
       	NSError* error = NULL;
       	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:parten options:nil error:&error];
        ///返回一个存有所有符合约定的字段的NSArray
       	if (regex != nil) {
            //用该方法解析出所有
            NSArray* array = [regex matchesInString:currentHTML options:NSMatchingCompleted range:NSMakeRange(0, [currentHTML length])];
            // NSLog(@"currentHTML :%@", array);//NSTextCheckingResult NSSimpleRegularExpressionCheckingResult
            NSMutableArray* stringArray = [[NSMutableArray alloc] init];
            //当解析出的数组至少有一个对象时，即原文本中存在至少一个符合规则的字段
            if (array.count != 0) {
                for (NSTextCheckingResult* result in array) {
                    //从NSTextCheckingResult类中取出range属性
                    NSRange range = result.range;
                    //从原文本中将字段取出并存入一个NSMutableArray中
                    // [stringArray addObject:[currentHTML substringWithRange:range]];
                    NSString *url = [currentHTML substringWithRange:range];
                    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
                    [param setObject:url forKey:@"url"];
                    [stringArray addObject:param];
                }
            }
            //打印结果
            NSLog(@"stringArray:%@",stringArray);
            // [self OnReturn];
        }
    }];//evaluateJavaScript stringByEvaluatingJavaScriptFromString
    //[self reload];//goBack
}

@end
