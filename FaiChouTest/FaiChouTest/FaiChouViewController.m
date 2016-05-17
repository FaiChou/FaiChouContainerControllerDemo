//
//  FaiChouViewController.m
//  FaiChouTest
//
//  Created by dhl on 16/5/10.
//  Copyright (c) 2016年 FaiChou. All rights reserved.
//

#import "FaiChouViewController.h"

@interface FaiChouViewController ()<UITextViewDelegate,
  UIAlertViewDelegate,
  UIActionSheetDelegate,
  UIPickerViewDataSource,
  UIPickerViewDelegate>

@property (nonatomic) UILabel *fcLabel;
@property (nonatomic) UITextView *fcTextView;
@property (nonatomic) UIActivityIndicatorView *fcActivityIndicatorView;
@property (nonatomic) UIProgressView *fcProgressView;
@property (nonatomic) UIAlertView *fcAlertView;
@property (nonatomic) UIActionSheet *fcActionSheet;
@property (nonatomic) UIPickerView *fcPickerView;

@property (nonatomic) NSMutableArray *fcLetter;

@end

@implementation FaiChouViewController

- (void)dealloc {
    self.fcTextView.delegate = nil;
    self.fcAlertView.delegate = nil;
    self.fcActionSheet.delegate = nil;
    self.fcPickerView.delegate = nil;
    self.fcPickerView.dataSource = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //执行一些资源、变量的初始化工作
        _fcLetter = [[NSMutableArray alloc] initWithObjects:@"fai", @"chou", @"letter", nil];
        self.title = @"fcv";
    }
    return self;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [kSharedUserInfo logIn];
    [self.view addSubview:self.fcView];
    [self.view addSubview:self.fcLabel];
    [self.view addSubview:self.fcTextView];
    [self.view addSubview:self.fcActivityIndicatorView];
    [self.view addSubview:self.fcProgressView];
    [self.view addSubview:self.fcPickerView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.fcView.frame = CGRectMake(20, 20, 80, 80);
    self.fcLabel.frame = CGRectMake(20, 120, 270, 50);
    self.fcTextView.frame = CGRectMake(20, 200, 270, 100);
    self.fcActivityIndicatorView.center = CGPointMake(150, 50);
    self.fcProgressView.frame = CGRectMake(20, 320, 280, 20);
    self.fcPickerView.frame = CGRectMake(20, 350, 280, 150);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - delegate
#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"%s",__func__);
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"%s",__func__);
    [self.fcAlertView show];
}
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"%s",__func__);
}
- (void)textViewDidChangeSelection:(UITextView *)textView {
    NSLog(@"%s",__func__);
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 0) {
        switch (buttonIndex) {
            case 0: {
                NSLog(@"0");
                break;
            }
            case 1: {
                NSLog(@"1");
                [self.fcActionSheet showInView:self.view];
                break;
            }
            default:
                break;
        }
    }
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag == 0) {
        switch (buttonIndex) {
            case 0: {
                NSLog(@"0");
                break;
            }
            case 1: {
                NSLog(@"1");
                break;
            }
            case 2: {
                NSLog(@"2");
                break;
            }
            default:
                break;
        }
    }
    
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger numberOfRows = 30;
    if (component == 1) {
        numberOfRows = self.fcLetter.count;
    }
    return numberOfRows;
}
#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat width=0.0;
    switch (component)
    {
        case 0:
            width=150;
            break;
        case 1:
            width=50;
            break;
        case 2:
            width=100;
            break;
        default:
            break;
    }
    return width;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 44;
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    NSString *rowTitle=[NSString stringWithFormat:@"%zd %zd", component, row];
    if (component==1)
    {
        rowTitle=[self.fcLetter objectAtIndex:row];
    }
    return rowTitle;
}
#pragma mark - event response

#pragma mark - private methods

#pragma mark - setters & getters

- (FaiChouView *)fcView {
    if (_fcView == nil) {
        _fcView = [[FaiChouView alloc] init];
        _fcView.backgroundColor = [UIColor purpleColor];
        _fcView.layer.cornerRadius = 10;
        _fcView.layer.borderWidth = 1;
        _fcView.layer.borderColor = [UIColor blueColor].CGColor;
        _fcView.layer.shadowOffset = CGSizeMake(0, 0);
        _fcView.layer.shadowOpacity = YES;
        _fcView.layer.shadowRadius = 10;
        _fcView.layer.shadowColor = [UIColor redColor].CGColor;
    }
    return _fcView;
}

- (UILabel *)fcLabel {
    if (_fcLabel == nil) {
        _fcLabel = [[UILabel alloc] init];
        _fcLabel.textColor = [UIColor blackColor];
        _fcLabel.backgroundColor = [UIColor whiteColor];
        _fcLabel.textAlignment = NSTextAlignmentLeft;
        NSString *aText = @"And I will love you, baby - Always. And I'll be there forever and a day - Always. I'll be there till the stars don't shine. Till the heavens burst and the words don't rhyme. And I know when I die, you'll be on my mind. And I'll love you - Always.";
//        for (NSInteger i = 28; i > 8; i--) {
//            aFont = [aFont fontWithSize:i];
//            CGSize constraintSize = CGSizeMake(320.0f, MAXFLOAT);
//            CGSize labelSize = [aText sizeWithFont:aFont
//                                 constrainedToSize:constraintSize
//                                     lineBreakMode:NSLineBreakByWordWrapping];
//            if (labelSize.height <= 60.0f) {
//                break;
//            }
//        }
//        _fcLabel.text = aText;
//        _fcLabel.font = aFont;
//        _fcLabel.numberOfLines = 4;
        
//        _fcLabel.numberOfLines = 0;
//        [_fcLabel sizeToFit];
        
        _fcLabel.numberOfLines = 5;
        _fcLabel.adjustsFontSizeToFitWidth = YES;
        
        _fcLabel.text = aText;
    }
    return _fcLabel;
}

- (UITextView *)fcTextView {
    if (_fcTextView == nil) {
        _fcTextView = [[UITextView alloc] initWithFrame:CGRectZero textContainer:nil];
        _fcTextView.text = @"write a world using your hand...";
        _fcTextView.delegate = self;
        _fcTextView.backgroundColor = [UIColor whiteColor];
        _fcTextView.textColor = [UIColor blackColor];
    }
    return _fcTextView;
}
- (UIActivityIndicatorView *)fcActivityIndicatorView {
    if (_fcActivityIndicatorView == nil) {
        _fcActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _fcActivityIndicatorView.color = [UIColor redColor];
        [_fcActivityIndicatorView startAnimating];
//        if ([_fcActivityIndicatorView isAnimating]) {
//            [_fcActivityIndicatorView stopAnimating];
//        }
        _fcActivityIndicatorView.hidesWhenStopped = YES;
    }
    return _fcActivityIndicatorView;
}
- (UIProgressView *)fcProgressView {
    if (_fcProgressView == nil) {
        _fcProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _fcProgressView.progress = 0.0;
        [_fcProgressView setProgress:0.8 animated:YES];
    }
    return _fcProgressView;
}
- (UIAlertView *)fcAlertView {
    if (_fcAlertView == nil) {
        _fcAlertView = [[UIAlertView alloc] initWithTitle:@"FaiChou"
                                                  message:@"This is FaiChou Alert View!"
                                                 delegate:self
                                        cancelButtonTitle:@"Cancel"
                                        otherButtonTitles:@"OK", nil];
        _fcAlertView.tag = 0;
    }
    return _fcAlertView;
}
- (UIActionSheet *)fcActionSheet {
    if (_fcActionSheet == nil) {
        _fcActionSheet = [[UIActionSheet alloc] initWithTitle:@"FaiChou"
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                       destructiveButtonTitle:@"destructive"
                                            otherButtonTitles:@"other", nil];
        _fcActionSheet.tag = 0;
    }
    return _fcActionSheet;
}
- (UIPickerView *)fcPickerView {
    if (_fcPickerView == nil) {
        _fcPickerView = [[UIPickerView alloc] init];
        _fcPickerView.delegate = self;
        _fcPickerView.dataSource = self;
        _fcPickerView.showsSelectionIndicator = YES;
    }
    return _fcPickerView;
}
@end
