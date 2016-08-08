//
//  PhoneVerificationPhoneNumberView.m
//  ViewSample
//
//  Created by Anuj Rajput on 29/07/16.
//  Copyright © 2016 Anuj Rajput. All rights reserved.
//

#import "PhoneVerificationPhoneNumberView.h"

@interface PhoneVerificationPhoneNumberView () <UITextFieldDelegate>

#pragma mark - Views

@property (nonatomic, weak) UILabel *phoneNumberTitleTextLabel;
@property (nonatomic, weak) UIView *phoneNumberTextView;
@property (nonatomic, weak) UILabel *countryCodeLabel;
@property (nonatomic, weak) UITextField *phoneNumberTextField;
@property (nonatomic, strong) UIButton *whyButton;
@property (nonatomic, strong) UIButton *sendButton;

#pragma mark - Properties

@property (nonatomic) BOOL constraintsAdded;

@end

@implementation PhoneVerificationPhoneNumberView

#pragma mark - Lifecycle

+ (instancetype)view {
    PhoneVerificationPhoneNumberView *phoneNumberView = [super new];
    if (phoneNumberView) {
        
    }
    return phoneNumberView;
}


#pragma mark - Views

- (void)layoutSubviews {
    [super layoutSubviews];
    [self createPhoneNumberTitleTextLabel];
    [self createPhoneNumberTextView];
    [self createCountryCodeLabel];
    [self createPhoneNumberTextField];
    [self createWhyButton];
    [self createSendButton];
    
    MASAttachKeys(self.phoneNumberTitleTextLabel,
                  self.phoneNumberTextView,
                  self.countryCodeLabel,
                  self.phoneNumberTextField,
                  self.whyButton,
                  self.sendButton);
}

- (void)createPhoneNumberTitleTextLabel {
    self.phoneNumberTitleTextLabel = [self createAndAddSubView:UILabel.class];
    self.phoneNumberTitleTextLabel.text = [@"Phone Number" uppercaseString];
}

- (void)createPhoneNumberTextView {
    self.phoneNumberTextView = [self createAndAddSubView:UIView.class];
    [self.phoneNumberTextView addBorderToTop:YES bottom:YES left:NO right:NO];
}

- (void)createCountryCodeLabel {
    self.countryCodeLabel = [self.phoneNumberTextView createAndAddSubView:UILabel.class];
    [self.countryCodeLabel addBorderToTop:NO bottom:NO left:NO right:YES];
    self.countryCodeLabel.text = @"+91";
    self.countryCodeLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)createPhoneNumberTextField {
    self.phoneNumberTextField = [self.phoneNumberTextView createAndAddSubView:UITextField.class];
    self.phoneNumberTextField.textAlignment = NSTextAlignmentLeft;
    self.phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneNumberTextField.delegate = self;
    [self.phoneNumberTextField becomeFirstResponder];
}

- (void)createWhyButton {
    self.whyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.whyButton setTitle:@"Why?" forState:UIControlStateNormal];
    [self.phoneNumberTextView addSubview:self.whyButton];
}

- (void)createSendButton {
    self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sendButton setTitle:[@"Send" uppercaseString] forState:UIControlStateNormal];
    [self.sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.sendButton.layer.cornerRadius = 20.f;
    self.sendButton.hidden = YES;
    [self.sendButton addTarget:self action:@selector(blah) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sendButton];
}

- (void)updateConstraints {
    if (!self.constraintsAdded) {
        [self.phoneNumberTitleTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self).with.offset(20.f);
        }];
        [self.phoneNumberTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phoneNumberTitleTextLabel.mas_bottom).with.offset(10.f);
            make.left.right.equalTo(self);
            make.height.equalTo(@60);
        }];
        [self.countryCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.phoneNumberTextView);
            make.width.equalTo(self.phoneNumberTextView.mas_width).multipliedBy(0.15);
        }];
        [self.phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.countryCodeLabel.mas_right).with.offset(15.f);
            make.top.bottom.equalTo(self.phoneNumberTextView);
            make.width.equalTo(self.phoneNumberTextView.mas_width).multipliedBy(0.6);
        }];
        [self.whyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.phoneNumberTextView);
            make.width.equalTo(self.phoneNumberTextView.mas_width).multipliedBy(0.25);
        }];
        [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.equalTo(self).multipliedBy(0.4);
            make.height.equalTo(@40);
            make.top.equalTo(self.phoneNumberTextView.mas_bottom).with.offset(30.f);
        }];
        
        self.constraintsAdded = YES;
    }
    
    [super updateConstraints];
}

- (void)blah {
    
}

@end
