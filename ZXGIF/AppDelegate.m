//
//  AppDelegate.m
//  ZXGIF
//
//  Created by FreeGeek on 16/1/13.
//  Copyright © 2016年 ZhongXi. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (nonatomic , strong) MainViewController * mainVC;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.mainVC = [[MainViewController alloc]init];
    [self.window.contentView addSubview:self.mainVC.view];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
