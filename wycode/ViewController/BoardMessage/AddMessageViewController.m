//
//  AddMessageViewController.m
//  wycode
//
//  Created by wangyu on 16/3/1.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "AddMessageViewController.h"
#import "WyResult.h"
#import "EasyHttp.h"
#import "UIColor+Extension.h"
#import "SVProgressHUD.h"

@interface AddMessageViewController () <UITextViewDelegate>
@property(weak, nonatomic) IBOutlet UITextView *tvContent;
@property(weak, nonatomic) IBOutlet UILabel *lbPlaceHolder;

@property(weak, nonatomic) IBOutlet UITextField *tfName;
@property(weak, nonatomic) IBOutlet UIButton *btnSubmit;

@end

@implementation AddMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tvContent.layer.cornerRadius = 6;
    _tvContent.layer.borderWidth = 0.5;
    _tvContent.layer.borderColor = [UIColor red:200 green:200 blue:200].CGColor;
    _tvContent.layer.masksToBounds = YES;

    _btnSubmit.layer.cornerRadius = 6;
    _btnSubmit.layer.masksToBounds = YES;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)submit:(UIButton *)sender {
    if (!_tvContent.text.length) {
        return;
    }
    if (!_tfName.text.length) {
        return;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"name"] = _tfName.text;
    params[@"content"] = _tvContent.text;
    params[@"secret"] = SERVER_SECRET;
    [SVProgressHUD show];
    [EasyHttp doPost:@"/api/board/addMessage"
              params:params
        successBlock:^(WyResult *result) {
            [SVProgressHUD dismiss];
//            BoardMessage *message = [[BoardMessage alloc] initWithDictionary:(NSDictionary *) result.data error:nil];
            [self.navigationController popViewControllerAnimated:YES];
        }
        failureBlock:^(NSString *message, int code) {
            [SVProgressHUD dismiss];
        }
    ];
}


//控制输入字符不能大于200字
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *toBeString = [textView.text stringByReplacingCharactersInRange:range withString:text];
    if (toBeString.length > 200) {
        _tvContent.text = [toBeString substringToIndex:200];
        return NO;
    }
    _lbPlaceHolder.hidden = toBeString.length != 0;
    return YES;
}


@end
