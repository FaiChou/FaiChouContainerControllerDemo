//
//  FaiChouView.m
//  FaiChouTest
//
//  Created by dhl on 16/5/10.
//  Copyright (c) 2016年 FaiChou. All rights reserved.
//

#import "FaiChouView.h"

@implementation FaiChouView

- (id)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"\n\n%@\n\n%s\n\n", self, __func__);
    CGPoint touchPoint=[[touches anyObject] locationInView:self];
    NSLog(@"%@", NSStringFromCGPoint(touchPoint));
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"\n\n%@\n\n%s\n\n", self, __func__);
    CGPoint touchPoint=[[touches anyObject] locationInView:self];
    NSLog(@"%@", NSStringFromCGPoint(touchPoint));
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"\n\n%@\n\n%s\n\n", self, __func__);
    CGPoint touchPoint=[[touches anyObject] locationInView:self];
    NSLog(@"%@", NSStringFromCGPoint(touchPoint));
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"\n\n%@\n\n%s\n\n", self, __func__);
    CGPoint touchPoint=[[touches anyObject] locationInView:self];
    NSLog(@"%@", NSStringFromCGPoint(touchPoint));
}

@end
