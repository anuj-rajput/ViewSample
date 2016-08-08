//
//  PhoneVerificationTopView.m
//  ViewSample
//
//  Created by Anuj Rajput on 29/07/16.
//  Copyright © 2016 Anuj Rajput. All rights reserved.
//

#import "PhoneVerificationTopView.h"

@interface PhoneVerificationTopView ()

#pragma mark - Views

@property (nonatomic, weak) UIImageView *profileImageView;
@property (nonatomic, weak) UILabel *titleTextLabel;
@property (nonatomic, weak) UILabel *subtitleTextLabel;

#pragma mark - Properties

@property (nonatomic) NSURL *profileImageURL;
@property (nonatomic) NSString *titleText;
@property (nonatomic) NSString *subtitleText;
@property (nonatomic) BOOL constraintsAdded;

@end

@implementation PhoneVerificationTopView

+ (instancetype)viewWithTitleText:(NSString *)titleText andSubtitleText:(NSString *)subtitleText andProfileImageURL:(NSURL *)profileImageURL {
    PhoneVerificationTopView *topView = [super new];
    if (topView) {
        topView.titleText = [titleText copy];
        topView.subtitleText = [subtitleText copy];
        topView.profileImageURL = [profileImageURL copy];
    }
    return topView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self createImageView];
    [self createTitleView];
    [self createSubtitleView];
    
    MASAttachKeys(self.profileImageView,
                  self.titleTextLabel,
                  self.subtitleTextLabel);
}

#pragma mark - Views setup

- (void)createImageView {
    self.profileImageView = [self createAndAddSubView:UIImageView.class];
    self.profileImageView.layer.cornerRadius = 50.f;
    self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.borderWidth = 3.f;
}

- (void)createTitleView {
    self.titleTextLabel = [self createAndAddSubView:UILabel.class];
    self.titleTextLabel.textAlignment = NSTextAlignmentCenter;
    self.titleTextLabel.text = self.titleText;
}

- (void)createSubtitleView {
    self.subtitleTextLabel = [self createAndAddSubView:UILabel.class];
    self.subtitleTextLabel.textAlignment = NSTextAlignmentCenter;
    self.subtitleTextLabel.numberOfLines = 2;
    self.subtitleTextLabel.text = self.subtitleText;
}

#pragma mark - Constraints

- (void)updateConstraints {
    if (!self.constraintsAdded) {
        [self.profileImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.height.equalTo(@100);
            make.top.equalTo(self);
        }];
        [self.titleTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.profileImageView);
            make.top.equalTo(self.profileImageView.mas_bottom).with.offset(20.f);
        }];
        [self.subtitleTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.titleTextLabel);
            make.width.equalTo(self.mas_width).multipliedBy(0.7);
            make.top.equalTo(self.titleTextLabel.mas_bottom).with.offset(10.f);
        }];
        
        self.constraintsAdded = YES;
    }
    
    [super updateConstraints];
}

@end
