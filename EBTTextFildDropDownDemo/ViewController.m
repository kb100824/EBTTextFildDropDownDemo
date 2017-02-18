//
//  ViewController.m
//  EBTTextFildDropDownDemo
//
//  Created by ebaotong on 2017/2/16.
//  Copyright © 2017年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTTextFieldDropDownView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(UIButton *)sender {
    
    NSArray *result = @[@"option0",@"option1",@"option2",@"option3",@"option4",@"option5",@"option6"];
    
    [EBTTextFieldDropDownView showDrowpDownListInView:self.textField withOptionArray:result withCompleteHandler:^(NSInteger selectIndex,NSString *selectOption) {
        
        self.textField.text = nil;
        self.textField.text = [NSString stringWithFormat:@"第%ld行，内容=%@",selectIndex,selectOption];
        NSLog(@"option=%@,index =%ld",selectOption,selectIndex);
        
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
