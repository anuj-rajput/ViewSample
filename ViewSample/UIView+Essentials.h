//
//  UIView+Essentials.h
//  ViewSample
//
//  Created by Anuj Rajput on 22/07/16.
//  Copyright © 2016 Anuj Rajput. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Essentials)

/**
 * These borders are attached to inside edge of views, with a default border color and size
 */
- (void)addBorderToTop:(BOOL)top
                bottom:(BOOL)bottom
                  left:(BOOL)left
                 right:(BOOL)right;

- (void)addBorderToTop:(BOOL)top
                bottom:(BOOL)bottom
                  left:(BOOL)left
                 right:(BOOL)right
                 width:(CGFloat)width;

- (void)addBorderToTop:(BOOL)top
                bottom:(BOOL)bottom
                  left:(BOOL)left
                 right:(BOOL)right
                 width:(CGFloat)width
                 color:(UIColor *)color;

/**
 * Remove all borders from this view
 */
- (void)clearBorders;

/**
 * Returns a new view added to the given view. Useful for when we need to create a new view but have a weak property reference.
 */
- (id)createAndAddSubView:(Class)modelClass;

@end
