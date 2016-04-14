//
//  AppDelegate.m
//  For3DTouchDemo
//
//  Created by noc on 16/4/14.
//  Copyright © 2016年 syy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SubViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) ViewController *rootviewController;

@end

@implementation AppDelegate

- (UIViewController *)rootviewController{
    if (_rootviewController == nil) {
        _rootviewController = [[ViewController alloc] init];
    }
    return _rootviewController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:self.rootviewController];
    [self.window makeKeyAndVisible];
    
    [self configShortcutItems];
    
    return YES;
}

- (void)configShortcutItems{
    UIApplicationShortcutItem *item0 = [[UIApplicationShortcutItem alloc]initWithType:@"0" localizedTitle:@"NO.1"localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd] userInfo:nil];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"1" localizedTitle:@"NO.2"localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd] userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"2" localizedTitle:@"NO.3"localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd] userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item0, item1, item2];
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    SubViewController *subVC = [[SubViewController alloc] init];
    subVC.isPop = YES;
    subVC.number = [shortcutItem.type integerValue] + 1;
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:self.rootviewController];
    [self.rootviewController.navigationController pushViewController:subVC animated:NO];
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
