//
//  PraiseToolVC.h
//  testProject
//
//  Created by 111 on 2018/11/28.
//  Copyright © 2018 111. All rights reserved.
//
/**
 *  点赞效果控制器
 *
 *  @author hyj
 */
#import <UIKit/UIKit.h>

@interface PraiseToolVC : UIViewController

/// 图片初始位置的左侧约束
@property (nonatomic, assign) CGFloat imageViewInitialLeadingConstraints;
/// 图片宽
@property (nonatomic, assign) CGFloat imageWidth;
/// 图片高
@property (nonatomic, assign) CGFloat imageHeight;
/// 图片名数组
@property (nonatomic, strong) NSArray *imageNameArrays;

/**
 点赞动画
 */
- (void)praiseAnimation;

@end
