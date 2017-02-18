//
//  EBTDropDownCell.m
//  EBTTextFildDropDownDemo
//
//  Created by ebaotong on 2017/2/16.
//  Copyright © 2017年 com.csst. All rights reserved.
//

#import "EBTDropDownCell.h"

@interface EBTDropDownCell ()

@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;

@property (weak, nonatomic) IBOutlet UIView *view_Line;

@end


@implementation EBTDropDownCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
  
    
    
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.view_Line.frame;
    rect.size.height = 1.0/[UIScreen mainScreen].scale;
    self.view_Line.frame  = rect;
    
    
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setTitleDescription:(NSString *)titleDescription{
    _titleDescription = titleDescription;
    self.lbl_Title.text = _titleDescription;

}
@end
