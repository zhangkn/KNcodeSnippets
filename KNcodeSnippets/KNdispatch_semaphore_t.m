//
//  KNdispatch_semaphore_t.m
//  KNcodeSnippets
//
//  Created by devzkn on 02/02/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import "KNdispatch_semaphore_t.h"

/**
 使用dispatch信号量是如何实现同步： iOS多线程的初步研究（十）-- dispatch同步
 - [iOS多线程的初步研究（十）-- dispatch同步  ](http://www.cnblogs.com/sunfrog/p/3313424.html)
 常常用于循环中控制xx过程的重复执行（比如切换IP）
 */
@implementation KNdispatch_semaphore_t
    
    
    /**
     二、dispatch信号量（dispatch semaphore）和 dispatch_sync(dispatch_get_main_queue()   ----威力强大，建议使用递归，在block中触发退出条件
     1. 创建信号量，可以设置信号量的资源数。0表示没有资源，调用dispatch_semaphore_wait会立即等待。
     
     dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
     2. 等待信号，可以设置超时参数。该函数返回0表示得到通知，非0表示超时。
     
     dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
     
     3. 通知信号，如果等待线程被唤醒则返回非0，否则返回0。
     
     dispatch_semaphore_signal(semaphore);
     
     
     一、 使用dispatch信号量是如何实现同步：
     
     尤其用于将异步的block 变成同步中
     */
    
+ (void)run{
    
    while (@"condition") {
        
        dispatch_semaphore_t  semaphore = dispatch_semaphore_create(0);
        dispatch_semaphore_wait(semaphore,dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 16 * NSEC_PER_SEC)));//保证是同步的
        
        
        [self setupSwitchIp:^(NSString *errorMsg, id result) {
            
            dispatch_semaphore_signal(semaphore);//激活信号
            
        }];
        
    }
    
}
    
    int _KNtryTimes;
    int  _KNwannaTryTimes;//递归退出条件，即调用自己几次
+ (void)setupRecursion{
    
    // 调用递归方法
    [self runOnce];
}
    
    + (void) runOnce{//多次执行runOnce，采用递归的方式
        _KNtryTimes++;
      
        [self setupproce];
    }
    + (void)setupproce{
        
        [self setupSwitchIp:^(NSString *errorMsg, id result) {
            if (errorMsg == nil && result != nil) {
                
                // 退出递归结束
                
            }else{
                
                if (_KNwannaTryTimes > 0 && _KNtryTimes >= _KNwannaTryTimes){//递归结束
                    
                    return;
                    
                }else{
                    
                    [self runOnce];//递归
                    
                }
                
            }
            
        }];
    }
    @end
