//
//  KNdispatch_semaphore_t.h
//  KNcodeSnippets
//
//  Created by devzkn on 02/02/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KNdispatch_semaphore_t : NSObject
    typedef void(^KNCallback)( NSString *errorMsg, id result);
+ (void)setupSwitchIp:(KNCallback)callback;
    
@end
