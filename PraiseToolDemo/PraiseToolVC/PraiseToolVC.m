//
//  PraiseToolVC.m
//  testProject
//
//  Created by 111 on 2018/11/28.
//  Copyright © 2018 111. All rights reserved.
//

#import "PraiseToolVC.h"

@interface PraiseToolVC ()

@end

@implementation PraiseToolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 配置默认值
    [self configDefault];
}

/**
 配置默认值
 */
- (void)configDefault {
    // 图片名数组
    if (self.imageNameArrays == nil) {
        self.imageNameArrays = @[@"Heart0.png",@"Heart1.png",@"Heart2.png",@"Heart3.png"];
    }
    
    // 图片宽
    if (self.imageWidth == 0) {
        self.imageWidth = 35.f;
    }
    
    // 图片高
    if (self.imageHeight == 0) {
        self.imageHeight = 30.f;
    }
    
    // 图片初始位置的左侧约束
    if (self.imageViewInitialLeadingConstraints == 0) {
        self.imageViewInitialLeadingConstraints = 40.f;
    }
}

#pragma mark - 点赞动画
- (void)praiseAnimation {
    UIImageView *imageView = [[UIImageView alloc] init];
    CGRect frame = self.view.frame;
    //  初始frame，即设置了动画的起点
    imageView.frame = CGRectMake(self.imageViewInitialLeadingConstraints, frame.size.height - self.imageWidth, self.imageWidth, self.imageHeight);
    //  初始化imageView透明度为0
    imageView.alpha = 0;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.clipsToBounds = YES;
    //  用0.2秒的时间将imageView的透明度变成1.0，同时将其放大1.3倍，再缩放至1.1倍，这里参数根据需求设置
    [UIView animateWithDuration:0.2 animations:^{
        imageView.alpha = 1.0;
        imageView.frame = CGRectMake(self.imageViewInitialLeadingConstraints, frame.size.height - self.imageHeight - 20, self.imageWidth, self.imageHeight);
        CGAffineTransform transfrom = CGAffineTransformMakeScale(1.3, 1.3);
        imageView.transform = CGAffineTransformScale(transfrom, 1, 1);
    }];
    [self.view addSubview:imageView];
    //  随机产生一个动画结束点的X值
    CGFloat finishX = frame.size.width - round(random() % (int)frame.size.width);
    //  动画结束点的Y值
    CGFloat finishY = 0;
    //  imageView在运动过程中的缩放比例
    CGFloat scale = round(random() % 2) + 0.7;
    // 生成一个作为速度参数的随机数
    CGFloat speed = 1 / round(random() % 900) + 0.6;
    //  动画执行时间
    NSTimeInterval duration = 4 * speed;
//    NSLog(@"时间--%f",duration);
    //  如果得到的时间是无穷大，就重新附一个值（这里要特别注意，请看下面的特别提醒）
    if (duration == INFINITY) duration = 2.412346;
    // 随机生成一个图片数组的index
    int imageIndex = round(random() % self.imageNameArrays.count);
    
    //  开始动画
    [UIView beginAnimations:nil context:(__bridge void *_Nullable)(imageView)];
    //  设置动画时间
    [UIView setAnimationDuration:duration];
    //  拼接图片名字
    imageView.image = [UIImage imageNamed:self.imageNameArrays[imageIndex]];
    
    //  设置imageView的结束frame
    imageView.frame = CGRectMake( finishX, finishY, self.imageWidth * scale, self.imageHeight * scale);
    
    //  设置渐渐消失的效果，这里的时间最好和动画时间一致
    [UIView animateWithDuration:duration animations:^{
        imageView.alpha = 0;
    }];
    
    //  结束动画，调用onAnimationComplete:finished:context:函数
    [UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
    //  设置动画代理
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

/// 动画完后销毁iamgeView
- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    UIImageView *imageView = (__bridge UIImageView *)(context);
    [imageView removeFromSuperview];
    imageView = nil;
}

@end
