//
//  ViewController.m
//  KNcodeSnippets
//
//  Created by devzkn on 21/01/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//
#import "KNconvertHexStrToString.h"

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [KNconvertHexStrToString convertHexStrToString:@"68747470733a2f2f6b756e6e616e2e6769746875622e696f2f"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
