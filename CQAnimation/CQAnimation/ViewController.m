//
//  ViewController.m
//  CQAnimation
//
//  Created by chenq@kensence.com on 16/8/4.
//  Copyright © 2014年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"

#define IsIOS7orAbove ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)
#define kYOffset        (IsIOS7orAbove ? (44 + 20) : 0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initScaleLayer];
    [self initMoveLayer];
    [self initRotateLayer];
    [self initGroupLayer];
    
    
}

- (void)initScaleLayer
{
    scaleLayer = [[CALayer alloc]init];
    scaleLayer.backgroundColor = [UIColor orangeColor].CGColor;
    scaleLayer.frame = CGRectMake(60, 20 + kYOffset, 50, 50);
    scaleLayer.cornerRadius = 5;
    [self.view.layer addSublayer:scaleLayer];
    
    //设定动画效果
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:3];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeBackwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 1;
    
    //添加动画
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

- (void)initMoveLayer
{
    MoveLayer = [[CALayer alloc]init];
    MoveLayer.backgroundColor = [UIColor cyanColor].CGColor;
    MoveLayer.frame = CGRectMake(60, 130 + kYOffset, 50, 50);
    MoveLayer.cornerRadius = 5;
    [self.view.layer addSublayer:MoveLayer];

    
    //动画路线
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:MoveLayer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width - 20,MoveLayer.position.y)];
    moveAnimation.autoreverses = YES;
    moveAnimation.fillMode = kCAFillModeForwards;
    moveAnimation.repeatCount = MAXFLOAT;
    moveAnimation.duration = 3;
    
    //添加动画效果
    [MoveLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
}

- (void)initRotateLayer
{
    rotateLayer = [CALayer new];
    rotateLayer.backgroundColor = [UIColor brownColor].CGColor;
    rotateLayer.frame = CGRectMake(60, 240, 50, 50);
    rotateLayer.cornerRadius = 5;
    [self.view.layer addSublayer:rotateLayer];
    
    
    //动画效果
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:2.0 * M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.fillMode = kCAFillModeForwards;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    
    [rotateLayer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
    
    
    
}


- (void)initGroupLayer
{
    GroupLayer = [CALayer new];
    GroupLayer.frame = CGRectMake(60, 340 + kYOffset, 50, 50);
    GroupLayer.cornerRadius = 5;
    GroupLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:GroupLayer];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 1.0;
    
    CABasicAnimation *moveAnmation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnmation.fromValue = [NSValue valueWithCGPoint:GroupLayer.position];
    moveAnmation.toValue = [NSValue valueWithCGPoint:CGPointMake(150, GroupLayer.position.y)];
    moveAnmation.autoreverses = YES;
    moveAnmation.repeatCount = MAXFLOAT;
    moveAnmation.duration = 2;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 4;
    groupAnimation.autoreverses = YES;
    groupAnimation.animations = @[moveAnmation ,scaleAnimation,rotateAnimation];
    groupAnimation.repeatCount = MAXFLOAT;
    [GroupLayer addAnimation:groupAnimation forKey:@"groupAnimation"];
}






@end
