//
//  constant.h
//  EasyTipsCalculator
//
//  Created by Bingqing Huang on 3/7/14.
//  Copyright (c) 2014 Bingqing Huang. All rights reserved.
//

#import <Foundation/Foundation.h>


#define IsLandscape              UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)
#define IsIphone5     ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
