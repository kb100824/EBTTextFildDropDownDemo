//
//  EBTTextFieldDropDownView.m
//  EBTTextFildDropDownDemo
//
//  Created by ebaotong on 2017/2/16.
//  Copyright © 2017年 com.csst. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "EBTTextFieldDropDownView.h"
#import "EBTDropDownCell.h"

@interface EBTTextFieldDropDownView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *listTableView;
   
}
@property(nonatomic,strong)NSMutableArray *array_List;
@end


@implementation EBTTextFieldDropDownView

+ (EBTTextFieldDropDownView *)sharedInstance{
   
    static dispatch_once_t onceToken = 0;
    static EBTTextFieldDropDownView *dropdownView = nil;
    dispatch_once(&onceToken, ^{
        dropdownView = [[EBTTextFieldDropDownView alloc]init];
    });
    return dropdownView;

}
- (instancetype)init
{
    
    if (self = [super init])
    {
        [self setUp];
    }
    return self;
    
}

- (void)setUp
{

    
    listTableView = [[UITableView alloc]init];
    listTableView.frame = CGRectZero;
    listTableView.backgroundColor = UIColorFromRGB(0xffffff);
    listTableView.delegate = self;
    listTableView.dataSource = self;
    [listTableView registerNib:[UINib nibWithNibName:@"EBTDropDownCell" bundle:nil] forCellReuseIdentifier:@"EBTDropDownCell"];
    listTableView.tableFooterView = [UIView new];
    listTableView.layer.masksToBounds = YES;
    listTableView.layer.cornerRadius = 3.f;
    listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    
    
    
}


- (NSMutableArray *)array_List{

    
    if (!_array_List) {
        _array_List = [NSMutableArray array];
    }
    return _array_List;

}
- (void)showDropDown:(UIView *)baseSuperView{

    //listTableView设置frame
    CGFloat pointX = baseSuperView.frame.origin.x;
    CGFloat width = baseSuperView.frame.size.width;
    CGFloat pointY = baseSuperView.frame.origin.y +baseSuperView.bounds.size.height;
    CGFloat height = 0;
    CGRect newFrame = CGRectMake(pointX, pointY, width, height);
    listTableView.frame = newFrame;
    listTableView.hidden = NO;
    //动画来改变listTableView高度
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect oldFrame = listTableView.frame;
        oldFrame.size.height= self.array_List.count>=7?210:self.array_List.count*30;
        listTableView.frame = oldFrame;
        
    } completion:^(BOOL finished) {
        
        
    }];

}
- (void)dismissDropDown{
   
    //动画来改变listTableView高度
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect oldFrame = listTableView.frame;
        oldFrame.size.height= 0;
        listTableView.frame = oldFrame;
        
    } completion:^(BOOL finished) {
        
        listTableView.hidden = YES;
    }];



}
- (void)showDrowpDownListInView:(UIView *)baseView withOptionArray:(NSArray *)listArray withCompleteHandler:(EBTDropDownListSelectOptionCompleteHandler)selectOptionCompleteHandler{
   
    [baseView.superview addSubview:listTableView];
     myCompleteHandler = [selectOptionCompleteHandler copy];
    [self.array_List removeAllObjects];
    self.array_List = [listArray mutableCopy];
    [listTableView reloadData];
    
    [[EBTTextFieldDropDownView sharedInstance] showDropDown:baseView];
    
    
    

}
+ (void)showDrowpDownListInView:(UIView *)baseView withOptionArray:(NSArray *)listArray withCompleteHandler:(EBTDropDownListSelectOptionCompleteHandler)selectOptionCompleteHandler{

    
    [[EBTTextFieldDropDownView sharedInstance] showDrowpDownListInView:baseView withOptionArray:listArray withCompleteHandler:selectOptionCompleteHandler];
    
    
    

}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array_List.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EBTDropDownCell *dropdownCell = [tableView dequeueReusableCellWithIdentifier:@"EBTDropDownCell" forIndexPath:indexPath];
    dropdownCell.titleDescription = self.array_List?self.array_List[indexPath.row]:@"";
    return dropdownCell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (myCompleteHandler)
    {
        myCompleteHandler(indexPath.row,self.array_List?self.array_List[indexPath.row]:@"");
        
    }
   
    [[EBTTextFieldDropDownView sharedInstance] dismissDropDown];
    
}
@end
