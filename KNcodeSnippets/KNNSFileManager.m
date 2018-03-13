//
//  KNNSFileManager.m
//  KNcodeSnippets
//
//  Created by devzkn on 04/03/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import "KNNSFileManager.h"

@implementation KNNSFileManager




/**
 removeItemAtPath - error: couldn’t be removed because you don’t have permission to access it

 Error Domain=NSCocoaErrorDomain Code=513 "“SSAppImageDatabaseCacheEntry” couldn’t be removed because you don’t have permission to access it." UserInfo={NSFilePath=/var/mobile/Library/Caches/com.apple.storeservices/SSAppImageDatabaseCacheEntry, NSUserStringVariant=(
 Remove
 ), NSUnderlyingError=0x10042c5b0 {Error Domain=NSPOSIXErrorDomain Code=66 "Directory not empty"}}] => 1
 
 NSFileManager - (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error NS_AVAILABLE(10_5, 2_0);
iPhone:~ root# ls -lrt /var/mobile/Library/Caches/sharedCaches
 
 */
+ (void)setupremoveItemAtPath{
    NSError* err = nil;
    NSString *fullpath = @"/var/mobile/Library/Caches/sharedCaches";
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    //遍历 https://play.itunes.apple.com/WebObjects/MZPlay.woa/wa/fuseNoCarrierBundleSubscription
//    https://init.itunes.apple.com/bag.xml?ix=6&os=10&locale=zh_CNX-Apple-Store-Front
//    https://xp.apple.com/register
//    https://play.itunes.apple.com/WebObjects/MZPlay.woa/wa/createMusicToken
    //https://github.com/prabhu/iTunes
//    devzkndeMacBook-Pro:CloudDocs devzkn$ cat  ~/Library/Application\ Support/CloudDocs/account.1
//    https://github.com/prabhu/iCloud
//    https://setup.icloud.com/setup/ws/1/validate?clientBuildNumber=
//    POST to url https://setup.icloud.com/setup/ws/1/login?clientBuildNumber=&clientId= JSON {"apple_id":"","password":"","extended_login":false}
    


    [fm removeItemAtPath:fullpath error:&err];
}


/**
 NSData *data = [text dataUsingEncoding: NSUTF8StringEncoding];
 往文件写数据--字符串
 */
- (void) setupwriteToFile{
    
//    NSString  *sandboxPath  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) firstObject];
    // 写数据到
    NSString *contentUserID = nil;
    NSString *realFile = @"/var/mobile/Media/real.txt";
    NSLog(@"realFile");
    if ([[NSFileManager defaultManager] fileExistsAtPath:realFile]) {
        // NSString *deviceID = GetUniqueDeviceID();
        NSLog(@"fileExistsAtPath fileExistsAtPath");
        if (contentUserID) {
            NSLog(@"contentUserID contentUserID");
            //将字符串转成NSData类型
            NSData *data = [contentUserID dataUsingEncoding: NSUTF8StringEncoding];
            
            // [contentUserID writeToFile:realFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
            [data writeToFile:realFile atomically:YES];
            
        }
    }else{
        
        [[NSFileManager defaultManager] createFileAtPath:realFile contents:[contentUserID dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
        
    }
    
}
//从文件读取字符串
//NSData *data = [NSData dataWithContentOfFile:filePath];

- (void)getContent{
    [NSThread sleepForTimeInterval:3];//测试code
    // timer = [NSTimer scheduledTimerWithTimeInterval:60 repeats:YES block:^(NSTimer * _Nonnull timer) {
    NSString *realFile = @"/var/mobile/Media/real.txt";
    NSString *content = [NSString stringWithContentsOfFile:realFile encoding:NSUTF8StringEncoding error:nil];
    NSString *contentUserID =content;
}

@end
