//
//  UserInfo.h
//  FaiChouTest
//
//  Created by dhl on 16/5/10.
//  Copyright (c) 2016年 FaiChou. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSharedUserInfo [UserInfo sharedUserInfo]

@interface UserInfo : NSObject

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *userPassword;

+ (UserInfo *)sharedUserInfo;

- (void)logIn;
- (void)logOff;
- (void)saveUserName;
- (void)saveUserPassword;

@end
