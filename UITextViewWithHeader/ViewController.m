//
//  ViewController.m
//  UITextViewWithHeader
//
//  Created by Xummer on 14-3-27.
//  Copyright (c) 2014年 Xummer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<
    UITextFieldDelegate,
    UITextViewDelegate
>
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UITextField *textField;
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self setupSubviews];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupSubviews {
    
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    _textView.delegate = self;
    [self.view addSubview:_textView];
    
    CGRect frame = _textView.bounds;
    frame.size.height = 160;
    frame.origin.y = - CGRectGetHeight(frame);
    
//    UIScrollView *header = [[UIScrollView alloc] initWithFrame:frame];
    UIView *header = [[UIView alloc] initWithFrame:frame];
    header.backgroundColor = [UIColor lightGrayColor];
    
    frame = (CGRect){
        .origin.x = 10,
        .origin.y = 44,
        .size.width = CGRectGetWidth(header.frame) - 20,
        .size.height = 40
    };;
    self.textField = [[UITextField alloc] initWithFrame:frame];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.placeholder = @"Input";
    _textField.delegate = self;
    [header addSubview:_textField];
    
    [_textView setContentInset:UIEdgeInsetsMake(CGRectGetHeight(header.frame), 0, 0, 0)];
    [_textView addSubview:header];
    
    
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    [self.view endEditing:YES];
}

@end
