//
//  ViewController.m
//  outOfBounds
//
//  Created by apple   on 2018/9/20.
//  Copyright © 2018年 钱龙. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+ErrorHandel.h"
#import "UIImage+TBCityIconFont.h"
#import "TBCityIconFont.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = [NSArray arrayWithObject:@1];
    NSLog(@"%@",[arr objectAtIndex:2]);
    
    NSLog(@"%ld",arr.count?:0);
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:self.view.bounds];
    UIFont *iconfont = [UIFont fontWithName:@"iconfont" size:100];
    label.font = iconfont;
    label.text = @"\U0000e626 \U0000e627 \U0000e628";
    [self.view addSubview: label];
    
    UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    imgv.center = self.view.center;
    imgv.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e626", 100, [UIColor redColor])];
    [self.view addSubview:imgv];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
