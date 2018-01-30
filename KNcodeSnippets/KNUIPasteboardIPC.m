//
//  KNUIPasteboardIPC.m
//  KNcodeSnippets
//
//  Created by devzkn on 30/01/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import "KNUIPasteboardIPC.h"
#import <UIKit/UIKit.h>

@implementation KNUIPasteboardIPC

const NSString *KNpasteboardWithNameKeyUserID= @"KNpasteboardWithNameKeyUserID";
NSObject *_model;
/**
 应用级别的，数据在属于自己的应用内部共享；
 (默认情况下是不会把数据写进沙盒的，也就是说（复制、剪切）粘贴内容会因为应用的退出而销毁掉，我们可以设置相关属性 persistent值为 YES让其进行数据的持久化存储起来)
 
 Ps：例如 persistent 是否进行数据持久化 还有 changeCount 改变次数（剪切板）系统重启方才重新计数
 
 */
- (NSObject *)model{
    
    if (_model == nil) {
        
        NSString *contentUserID =@"";
        UIPasteboard *pasteboardUserID = [UIPasteboard pasteboardWithName:KNpasteboardWithNameKeyUserID create:NO];
        
        if (pasteboardUserID){
            contentUserID = pasteboardUserID.string;////获取内容
        }
        
        _model = [[NSObject alloc]init];
//        _model.UserId =contentUserID;
        
        
    }
    return _model;
}
//pasteboardWithName 方法的使用
- (void)setModel:(NSObject *)model{
    _model = model;
    
    if (model) {
        UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:KNpasteboardWithNameKeyUserID create:YES];
        pasteboard.persistent = YES;
//        pasteboard.string = model.UserId;//设置传递的内容
        
    }
}


@end
