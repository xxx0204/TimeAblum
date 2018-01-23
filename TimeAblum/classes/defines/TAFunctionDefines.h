//
//  TAFunctionDefines.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#ifndef TAFunctionDefines_h
#define TAFunctionDefines_h

#define BackFunction [TANavigationViewGenerator createNaviType:HHZNavigationViewGeneratorLeft Title:nil nolmalImage:[UIImage imageNamed:@"back"] selectedImage:[UIImage imageNamed:@"back"] andNavi:self andSEL:@selector(back)];

#define LoadingCommonStart [[HHZActivityLoadingView shareLoadingView] showMCActivityViewTopSpace:kTopBarHeight andBottomSpace:0 andText:CommonPromptMessage];
#define LoadingCommonStop [[HHZActivityLoadingView shareLoadingView] stopLoadingView];


#endif /* TAFunctionDefines_h */
