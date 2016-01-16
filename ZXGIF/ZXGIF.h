//
//  ZXGIF.h
//  ZXGIF
//
//  Created by FreeGeek on 16/1/13.
//  Copyright © 2016年 ZhongXi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <ImageIO/ImageIO.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreServices/CoreServices.h>

@interface ZXGIF : NSObject
+(void)createGIFformVideoURL:(NSURL *)videoURL completion:(void(^)(NSString * gifURL))completionBlock;
@end
