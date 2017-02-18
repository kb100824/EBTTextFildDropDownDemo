//
//  EBTTextFieldDropDownView.h
//  EBTTextFildDropDownDemo
//
//  Created by ebaotong on 2017/2/16.
//  Copyright © 2017年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EBTDropDownListSelectOptionCompleteHandler)(NSInteger selectIndex ,NSString*selectOption);

@interface EBTTextFieldDropDownView : UIView
{
    EBTDropDownListSelectOptionCompleteHandler myCompleteHandler;
}

/***
 * @paragram baseView 显示在它下面
 * @paragram listArray 数据源
 * @selectOptionCompleteHandler 回调
 */
+(void)showDrowpDownListInView:(UIView *)baseView withOptionArray:(NSArray *)listArray withCompleteHandler:(EBTDropDownListSelectOptionCompleteHandler)selectOptionCompleteHandler;


@end
