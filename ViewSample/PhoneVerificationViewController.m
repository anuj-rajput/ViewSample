//
//  PhoneVerificationViewController.m
//  ViewSample
//
//  Created by Anuj Rajput on 27/07/16.
//  Copyright © 2016 Anuj Rajput. All rights reserved.
//

#import "PhoneVerificationViewController.h"

#import "PhoneVerificationTopView.h"
#import "PhoneVerificationPhoneNumberView.h"

@interface PhoneVerificationViewController () <UITextFieldDelegate>

#pragma mark - Views

@property (nonatomic, weak) UIImageView *profileImageView;
@property (nonatomic, weak) UILabel *titleTextLabel;
@property (nonatomic, weak) UILabel *subtitleTextLabel;
@property (nonatomic, weak) UILabel *phoneNumberTitleTextLabel;
@property (nonatomic, weak) UIView *phoneNumberTextView;
@property (nonatomic, weak) UILabel *countryCodeLabel;
@property (nonatomic, weak) UITextField *phoneNumberTextField;
@property (nonatomic, strong) UIButton *whyButton;
@property (nonatomic, strong) UIButton *sendButton;

@property (nonatomic) PhoneVerificationTopView *topView;
@property (nonatomic) PhoneVerificationPhoneNumberView *phoneNumberView;

#pragma mark - Properties

@property (nonatomic) NSString *phoneNumber;

@end

@implementation PhoneVerificationViewController

#pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topView = [PhoneVerificationTopView viewWithTitleText:[@"Hey " stringByAppendingString:@"Anuj"] andSubtitleText:@"We are thrilled to have you onboard!\nLets start by verifying your phone" andProfileImageURL:[NSURL URLWithString:@""]];
    [self.view addSubview:self.topView];
    [self.topView setNeedsLayout];
    [self.topView layoutIfNeeded];
    
    self.phoneNumberView = [PhoneVerificationPhoneNumberView view];
    [self.view addSubview:self.phoneNumberView];
    [self.phoneNumberView setNeedsLayout];
    [self.phoneNumberView layoutIfNeeded];
    
    NSLog(@"Self: %@", NSStringFromCGRect(self.view.frame));
    NSLog(@"Top: %@", NSStringFromCGRect(self.topView.frame));
    NSLog(@"Phone: %@", NSStringFromCGRect(self.phoneNumberView.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View Constraints

- (void)updateViewConstraints {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top);
    }];
    [self.phoneNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.topView.mas_bottom);
    }];

    [super updateViewConstraints];
}

@end
