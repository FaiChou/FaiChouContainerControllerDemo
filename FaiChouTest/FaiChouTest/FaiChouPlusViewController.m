//
//  FaiChouPlusViewController.m
//  FaiChouTest
//
//  Created by dhl on 16/5/12.
//  Copyright (c) 2016年 FaiChou. All rights reserved.
//

#import "FaiChouPlusViewController.h"

@interface FaiChouPlusViewController ()<UIScrollViewDelegate,
  UITextFieldDelegate>

@property (nonatomic) UIImageView *fcImageView;
@property (nonatomic) UIScrollView *fcScrollView;
@property (nonatomic) UIView *view1;
@property (nonatomic) UIView *view2;
@property (nonatomic) UIWebView *fcWebView;
@property (nonatomic) UIButton *fcButton;
@property (nonatomic) UITextField *fcTextField;
@property (nonatomic) UITapGestureRecognizer *fcTapGestureRecognizer;
@property (nonatomic) UIPanGestureRecognizer *fcPanGestureRecognizer;

@end

@implementation FaiChouPlusViewController

- (void)dealloc {
    self.fcScrollView.delegate = nil;
    self.fcTextField.delegate = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"fcpv";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];    
    UIBarButtonItem *fcBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"right"
                                                                       style:UIBarButtonItemStyleDone
                                                                      target:self
                                                                      action:nil];
    
    self.navigationItem.rightBarButtonItem=fcBarButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    [self.view addSubview:self.fcImageView];
    [self.view addSubview:self.fcScrollView];
//    [self.view addSubview:self.fcWebView];
    [self.view addSubview:self.fcButton];
    [self.view addSubview:self.fcTextField];
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    NSLog(@"viewDidLoad-%@", NSStringFromCGRect(self.fcImageView.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    self.fcImageView.frame = CGRectMake(0, 0, 50, 50);
    self.fcScrollView.frame = CGRectMake(0, 50, 320, 200);
    self.fcWebView.frame = CGRectMake(0, 250, 320, 230);
    self.fcButton.frame = CGRectMake(50, 250, 220, 40);
    self.fcTextField.frame = CGRectMake(50, 300, 220, 50);
    NSLog(@"viewWillAppear-%@", NSStringFromCGRect(self.fcImageView.frame));
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
}
#pragma mark - UITextFieldDelegate


#pragma mark - events
- (void)fcButtonCall {
    NSLog(@"fai chou button touched!");
}
- (void)fcTextFieldCall {
    NSLog(@"faichou textfield end edit");
}
- (void)changeImageBackgroundColor:(id)sender {
    if ([sender isKindOfClass:[UITapGestureRecognizer class]]) {
        self.fcImageView.backgroundColor = [UIColor redColor];
    }else if ([sender isKindOfClass:[UIPanGestureRecognizer class]]) {
        self.fcImageView.backgroundColor = [UIColor greenColor];
    }else {
        NSLog(@"%@", sender);
    }
}
#pragma mark - setters

- (UIImageView *)fcImageView {
    if (_fcImageView == nil) {
        _fcImageView = [[UIImageView alloc] init];
        _fcImageView.image = [UIImage imageNamed:@"222"];
        _fcImageView.backgroundColor = [UIColor lightGrayColor];
        [_fcImageView sizeToFit];
        [_fcImageView addGestureRecognizer:self.fcTapGestureRecognizer];
        [_fcImageView addGestureRecognizer:self.fcPanGestureRecognizer];
        _fcImageView.userInteractionEnabled = YES;
        NSLog(@"setter-%@", NSStringFromCGRect(self.fcImageView.frame));
    }
    return _fcImageView;
}
- (UIScrollView *)fcScrollView {
    if (_fcScrollView == nil) {
        _fcScrollView = [[UIScrollView alloc] init];
        _fcScrollView.contentSize = CGSizeMake(320*2, 200);
        _fcScrollView.backgroundColor = [UIColor lightGrayColor];
        _fcScrollView.pagingEnabled = YES;
        _fcScrollView.delegate = self;
        [_fcScrollView addSubview:self.view1];
        [_fcScrollView addSubview:self.view2];
        
    }
    return _fcScrollView;
}
- (UIView *)view1 {
    if (_view1 == nil) {
        _view1 = [[UIView alloc] init];
        _view1.frame = CGRectMake(0, 0, 320, 200);
        _view1.backgroundColor = [UIColor redColor];
    }
    return _view1;
}
- (UIView *)view2 {
    if (_view2 == nil) {
        _view2 = [[UIView alloc] init];
        _view2.frame = CGRectMake(320, 0, 320, 200);
        _view2.backgroundColor = [UIColor yellowColor];
    }
    return _view2;
}
- (UIWebView *)fcWebView {
    if (_fcWebView == nil) {
        _fcWebView = [[UIWebView alloc] init];
        NSURLRequest *google = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com"]];
//        [_fcWebView loadRequest:google];
        _fcWebView.backgroundColor = [UIColor greenColor];
    }
    return _fcWebView;
}
- (UIButton *)fcButton {
    if (_fcButton == nil) {
        _fcButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _fcButton.backgroundColor = [UIColor grayColor];
        _fcButton.tintColor = [UIColor orangeColor];
        [_fcButton setTitle:@"FaiChou" forState:UIControlStateNormal];
        [_fcButton addTarget:self
                      action:@selector(fcButtonCall)
            forControlEvents:UIControlEventTouchUpInside];
    }
    return _fcButton;
}
- (UITextField *)fcTextField {
    if (_fcTextField == nil) {
        _fcTextField = [[UITextField alloc] init];
        _fcTextField.backgroundColor = [UIColor lightTextColor];
        _fcTextField.adjustsFontSizeToFitWidth = YES;
        _fcTextField.placeholder = @"fc";
        _fcTextField.borderStyle = UITextBorderStyleBezel;
        _fcTextField.delegate = self;
        [_fcTextField addTarget:self
                         action:@selector(fcTextFieldCall)
               forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return _fcTextField;
}
- (UITapGestureRecognizer *)fcTapGestureRecognizer {
    if (_fcTapGestureRecognizer == nil) {
        _fcTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                           action:@selector(changeImageBackgroundColor:)];
        
    }
    return _fcTapGestureRecognizer;
}
- (UIPanGestureRecognizer *)fcPanGestureRecognizer {
    if (_fcPanGestureRecognizer == nil) {
        _fcPanGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self
                                           action:@selector(changeImageBackgroundColor:)];
    }
    return _fcPanGestureRecognizer;
}
@end
