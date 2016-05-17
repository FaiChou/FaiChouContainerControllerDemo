//
//  AppDelegate.m
//  FaiChouTest
//
//  Created by dhl on 16/5/10.
//  Copyright (c) 2016年 FaiChou. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTableViewController.h"
#import "FaiChouViewController.h"
#import "FaiChouPlusViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor lightGrayColor];
    [self.window makeKeyAndVisible];
    
    RootTableViewController *fcTableViewController = [[RootTableViewController alloc]
                                                      initWithStyle:UITableViewStylePlain];
    fcTableViewController.title = @"root";
    UINavigationController *fcNavigationController = [[UINavigationController alloc]
                                                      initWithRootViewController:fcTableViewController];
    fcNavigationController.navigationBar.translucent = NO;
    
    // ?
    fcNavigationController.tabBarItem.image = [[UIImage imageNamed:@"icon1"]
                                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fcNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    FaiChouViewController *fcViewController = [[FaiChouViewController alloc] init];
    UINavigationController *fcNController = [[UINavigationController alloc] initWithRootViewController:fcViewController];
    fcNController.navigationBar.translucent = NO;
    fcNController.tabBarItem.badgeValue = @"1";

    FaiChouPlusViewController *fcpViewController = [[FaiChouPlusViewController alloc] init];
    UINavigationController *fcpNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:fcpViewController];
    fcpNavigationController.navigationBar.translucent = NO;
    
    UITabBarController *fcTabBarController = [[UITabBarController alloc] init];
    fcTabBarController.viewControllers = @[fcNavigationController, fcNController, fcpNavigationController];
    
    self.window.rootViewController = fcTabBarController;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
