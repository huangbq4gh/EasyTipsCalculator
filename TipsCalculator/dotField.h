//
//  dotField.h
//  EasyTipsCalculator
//
//  Created by Bingqing Huang on 3/7/14.
//  Copyright (c) 2014 Bingqing Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "constant.h"

@interface dotField : UITextField{
    UIButton *btnDot;
    BOOL isDot;
}
@property(nonatomic,retain)NSString *strSymbol;

+(BOOL)isPad;
@end
