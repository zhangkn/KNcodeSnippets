//
//  KNNSURLComponents.m
//  KNcodeSnippets
//
//  Created by devzkn on 09/02/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import "KNNSURLComponents.h"

@implementation KNNSURLComponents
    
    
    
    /**
    使用NSURLComponents 进行 url请求 ge参数的构建
     */
    + (void)setupNsUrl{
        
        NSURLComponents *components = [NSURLComponents componentsWithString:@"url"];
        
        NSURLQueryItem * v = [NSURLQueryItem queryItemWithName:@"v" value:@"2"];

        [components setQueryItems:@[v]];
        
        NSURL* url = [components URL];

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                           timeoutInterval:30];
        
        
    }
    
    
    

@end
