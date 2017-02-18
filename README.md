#TextField添加下拉选择菜单支持block回调

#使用pod指令把类库集成到项目中:
```
<pre>
  pod 'EBTTextFiledDropDown'
<pre>
```


<pre>
<code>

    NSArray *result = @[@"option0",@"option1",@"option2",@"option3",@"option4",@"option5",@"option6"];
    
    [EBTTextFieldDropDownView showDrowpDownListInView:self.textField withOptionArray:result withCompleteHandler:^(NSInteger selectIndex,NSString *selectOption) {
        
        self.textField.text = nil;
        self.textField.text = [NSString stringWithFormat:@"第%ld行，内容=%@",selectIndex,selectOption];
        NSLog(@"option=%@,index =%ld",selectOption,selectIndex);
        
    }];

</code>
</pre>







#效果演示图
![Image](https://github.com/KBvsMJ/EBTTextFildDropDownDemo/blob/master/demogif/1.gif)
