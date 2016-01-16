//
//  NSProgressIndicator+Color.m
//  ZXGIF
//
//  Created by FreeGeek on 16/1/13.
//  Copyright © 2016年 ZhongXi. All rights reserved.
//
#import <Quartz/Quartz.h>
#import "NSProgressIndicator+Color.h"

@implementation NSProgressIndicator (Color)
-(void)setCustomColor:(NSColor *)color
{
    CIFilter *colorPoly = [CIFilter filterWithName:@"CIColorPolynomial"];
    [colorPoly setDefaults];
    
    CIVector *redVector = [CIVector vectorWithX:color.redComponent Y:0 Z:0 W:0];
    CIVector *greenVector = [CIVector vectorWithX:color.greenComponent Y:0 Z:0 W:0];
    CIVector *blueVector = [CIVector vectorWithX:color.blueComponent Y:0 Z:0 W:0];
    [colorPoly setValue:redVector forKey:@"inputRedCoefficients"];
    [colorPoly setValue:greenVector forKey:@"inputGreenCoefficients"];
    [colorPoly setValue:blueVector forKey:@"inputBlueCoefficients"];
    [self setContentFilters:[NSArray arrayWithObjects:colorPoly, nil]];
}
@end
