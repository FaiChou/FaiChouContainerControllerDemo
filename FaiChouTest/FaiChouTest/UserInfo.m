//
//  UserInfo.m
//  FaiChouTest
//
//  Created by dhl on 16/5/10.
//  Copyright (c) 2016年 FaiChou. All rights reserved.
//

#import "UserInfo.h"
@implementation UserInfo

static UserInfo *sharedUserInfoInstance = nil;

- (id)init {
    if (self = [super init]) {
        _userName = @"fcName";
        _userPassword = @"fcPassword";
    }
    return self;
}

+ (UserInfo *)sharedUserInfo {
    @synchronized(self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedUserInfoInstance = [[UserInfo alloc] init];
        });
    }
    return sharedUserInfoInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if(sharedUserInfoInstance == nil){
            sharedUserInfoInstance = [super allocWithZone:zone];
            return sharedUserInfoInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (void)logIn {
    NSLog(@"%s",__func__);
}
- (void)logOff {
    NSLog(@"%s",__func__);
}
- (void)saveUserName {
    NSLog(@"%s",__func__);
}
- (void)saveUserPassword {
    NSLog(@"%s",__func__);
}

@end
