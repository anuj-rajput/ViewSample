//
//  UIView+Essentials.m
//  ViewSample
//
//  Created by Anuj Rajput on 22/07/16.
//  Copyright © 2016 Anuj Rajput. All rights reserved.
//

#import "UIView+Essentials.h"

#import <Masonry/Masonry.h>

@interface UIBorderView : UIView

+ (instancetype)borderWithColor:(UIColor *)color;

@end

@implementation UIBorderView

+ (instancetype)borderWithColor:(UIColor *)color {
    UIBorderView *borderView = [UIBorderView new];
    borderView.backgroundColor = color;
    return borderView;
}

@end

@implementation UIView (Essentials)

- (void)addBorderToTop:(BOOL)top
                bottom:(BOOL)bottom
                  left:(BOOL)left
                 right:(BOOL)right {
    [self addBorderToTop:top
                  bottom:bottom
                    left:left
                   right:right
                   width:1.0f];
}

- (void)addBorderToTop:(BOOL)top
                bottom:(BOOL)bottom
                  left:(BOOL)left
                 right:(BOOL)right
                 width:(CGFloat)width {
    [self addBorderToTop:top
                  bottom:bottom
                    left:left
                   right:right
                   width:width
                   color:[UIColor grayColor]];
}

- (void)addBorderToTop:(BOOL)top
                bottom:(BOOL)bottom
                  left:(BOOL)left
                 right:(BOOL)right
                 width:(CGFloat)width
                 color:(UIColor *)color {
    if (top) {
        UIView *border = [UIBorderView borderWithColor:color];
        [self insertSubview:border atIndex:10];
        [border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.width.equalTo(self);
            make.height.equalTo(@(width));
        }];
    }
    if (bottom) {
        UIView *border = [UIBorderView borderWithColor:color];
        [self insertSubview:border atIndex:10];
        [border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.width.equalTo(self);
            make.height.equalTo(@(width));
        }];
    }
    if (left) {
        UIView *border = [UIBorderView borderWithColor:color];
        [self insertSubview:border atIndex:10];
        [border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.height.equalTo(self);
            make.width.equalTo(@(width));
        }];
    }
    if (right) {
        UIView *border = [UIBorderView borderWithColor:color];
        [self insertSubview:border atIndex:10];
        [border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.height.equalTo(self);
            make.width.equalTo(@(width));
        }];
    }
}

- (void)clearBorders {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:UIBorderView.class]) {
            [view removeFromSuperview];
        }
    }
}

- (id)createAndAddSubView:(Class)modelClass {
    id temporaryView = [modelClass new];
    [self insertSubview:(UIView *)temporaryView atIndex:self.subviews.count];
    return temporaryView;
}

@end
