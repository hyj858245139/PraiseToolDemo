//
//  ShowViewController.m
//  PraiseToolDemo
//
//  Created by 111 on 2018/11/28.
//  Copyright © 2018 111. All rights reserved.
//

#import "ShowViewController.h"
#import "PraiseToolVC.h"

@interface ShowViewController ()
/// 点赞效果背景视图
@property (weak, nonatomic) IBOutlet UIView *praiseView;
/// 点赞效果工具
@property (nonatomic, strong) PraiseToolVC *praiseTools;
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"点赞效果展示";
    // 配置点赞效果工具
    [self configPraiseTools];
}

/**
 配置点赞效果工具
 */
- (void)configPraiseTools {
    self.praiseTools = [[PraiseToolVC alloc] init];
    [self.praiseView addSubview:self.praiseTools.view];
    self.praiseTools.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.praiseView.bounds), CGRectGetHeight(self.praiseView.bounds));
    
    // 图片初始位置的左侧约束
    self.praiseTools.imageViewInitialLeadingConstraints = (self.praiseView.frame.size.width - self.praiseTools.imageWidth) / 2;
}

/**
 点赞
 */
- (IBAction)clickPraiseButton:(id)sender {
    [self.praiseTools praiseAnimation];
}


@end
