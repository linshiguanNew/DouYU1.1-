//
//  BaseTabBarController.m
//  DouYU
//
//  Created by Alesary on 15/10/29.
//  Copyright © 2015年 Alesary. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNaviController.h"
#import "RecommendController.h"
#import "ColumnController.h"
#import "OnlineViewController.h"
#import "MineController.h"
#import "Public.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController
#warning 使用系统的默认就选择了第一个，不需要再添加什么
- (void)viewDidLoad {
    [super viewDidLoad];


    UIView *backView=[[UIView alloc]initWithFrame:self.tabBar.bounds];
    NSLog(@"backViewFrame =%@",NSStringFromCGRect(backView.frame));
    backView.backgroundColor=[UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.tintColor=TabBar_T_Color;
    
    [self initChildViewControllers];
}

-(void)initChildViewControllers
{
   NSMutableArray *childVCArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    //推荐
    RecommendController *RecommendVC = [[RecommendController alloc] init];
    [RecommendVC.tabBarItem setTitle:@"推荐"];
    [RecommendVC.tabBarItem setImage:[UIImage imageNamed:@"btn_home_normal"]];
    [RecommendVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_home_selected"]];
    BaseNaviController *RecommendNavC = [[BaseNaviController alloc] initWithRootViewController:RecommendVC];
    [childVCArray addObject:RecommendNavC];
    
    //栏目
     ColumnController *ColumnVC = [[ColumnController alloc] init];
    [ColumnVC.tabBarItem setTitle:@"栏目"];
    [ColumnVC.tabBarItem setImage:[UIImage imageNamed:@"btn_column_normal"]];
    [ColumnVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_column_selected"]];
     BaseNaviController *ColumnNavC = [[BaseNaviController alloc] initWithRootViewController:ColumnVC];
    [childVCArray addObject:ColumnNavC];
    
    //直播
    OnlineViewController *OnlineVC = [[OnlineViewController alloc] init];
    [OnlineVC.tabBarItem setTitle:@"直播"];
    [OnlineVC.tabBarItem setImage:[UIImage imageNamed:@"btn_live_normal"]];
    [OnlineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_live_selected"]];
    BaseNaviController *OnlineNavC = [[BaseNaviController alloc] initWithRootViewController:OnlineVC];
    [childVCArray addObject:OnlineNavC];
    
    //我的
    MineController *MineVC = [[MineController alloc] init];
    [MineVC.tabBarItem setTitle:@"我的"];
    [MineVC.tabBarItem setImage:[UIImage imageNamed:@"btn_user_normal"]];
    [MineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_user_selected"]];
    BaseNaviController *MineNavC = [[BaseNaviController alloc] initWithRootViewController:MineVC];
    [childVCArray addObject:MineNavC];


    [self setViewControllers:childVCArray];
    
}


@end
