//
//  ViewController.m
//  CHAutoSizeLabel
//
//  Created by Chin-Hui Hsieh  on 5/13/16.
//  Copyright © 2016 Chin-Hui Hsieh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fontSize = 22;
    [self addLabelBtnWithHeaderTitle:@"匯率" footerTitle:@"%" buttonTitle:@"32.33"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addLabelBtnWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle buttonTitle:(NSString *)buttonTitle{
    
    NSString *string =[NSString stringWithFormat:@"%@%@%@",headerTitle,footerTitle,buttonTitle];
    CGFloat viewWidth = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_fontSize]}].width;
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"autoSizeLabel" owner:self options:0]lastObject];
    
    view.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *headerLabel    = (UILabel *)[view viewWithTag:1];
    UILabel *footerLabel    = (UILabel *)[view viewWithTag:2];
    UIButton *functionBtn   = (UIButton *)[view viewWithTag:3];
    
    headerLabel.text = headerTitle;
    headerLabel.font = [UIFont systemFontOfSize:_fontSize];
    footerLabel.text = footerTitle;
    footerLabel.font = [UIFont systemFontOfSize:_fontSize];
    [functionBtn setTitle:buttonTitle forState:UIControlStateNormal];
    [functionBtn.titleLabel setFont:[UIFont systemFontOfSize:_fontSize]];
    
    
    CGRect newFrame = CGRectMake(0, 50, viewWidth+10, _fontSize);
    view.frame = newFrame;
    [self.view addSubview:view];
}

@end
