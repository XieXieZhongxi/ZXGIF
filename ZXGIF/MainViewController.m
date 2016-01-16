//
//  MainViewController.m
//  ZXGIF
//
//  Created by FreeGeek on 16/1/13.
//  Copyright © 2016年 ZhongXi. All rights reserved.
//

#import "MainViewController.h"
#import "ZXDragView.h"
#import "NSProgressIndicator+Color.h"
#import "ZXGIF.h"
@interface MainViewController ()<ZXDragViewDelegate>
@property (weak) IBOutlet ZXDragView *backgroundView;
@property (weak) IBOutlet NSTextField *tipTextField;
@property (weak) IBOutlet NSImageView *videoImageView;
@property (weak) IBOutlet NSImageView *arrowImageView;
@property (weak) IBOutlet NSImageView *GIFImageView;
@property (weak) IBOutlet NSProgressIndicator *ActivityIndicator;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [_backgroundView setWantsLayer:YES];
    [_backgroundView.layer setBackgroundColor:[NSColor colorWithCalibratedRed:0.980f green:0.929f blue:0.808f alpha:1.00f].CGColor];
    _backgroundView.delegate = self;
    [_ActivityIndicator setCustomColor:[NSColor colorWithCalibratedRed:0.635f green:0.325f blue:0.710f alpha:1.00f]];
}

-(void)dragView:(ZXDragView *)dragView didDragItem:(NSString *)item
{
    [self setHidden:NO];
    [ZXGIF createGIFformVideoURL:[NSURL fileURLWithPath:item] completion:^(NSString *gifURL) {
        [self setHidden:YES];
        [[NSWorkspace sharedWorkspace] openFile:gifURL];
    }];
}

-(void)setHidden:(BOOL)hidden
{
    _tipTextField.hidden = !hidden;
    _arrowImageView.hidden = hidden;
    _GIFImageView.hidden = hidden;
    _ActivityIndicator.hidden = hidden;
    if (hidden) {
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
            context.duration = 2.f;
            _videoImageView.animator.frame = CGRectOffset(_videoImageView.frame, +100, 0);
        } completionHandler:nil];
        [_ActivityIndicator stopAnimation:nil];
    }
    else
    {
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
            context.duration = 2.f;
            _videoImageView.animator.frame = CGRectOffset(_videoImageView.frame, -100, 0);
        } completionHandler:nil];
        [_ActivityIndicator startAnimation:nil];
    }
}

@end
