//
//  UIView+DraggableView.h
//  WGOperator
//
//  Created by Pro on 26/09/2018.
//  Copyright © 2018 Maavratech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DraggableView)



-(void)makeRound:(NSInteger)radius;
- (void)makeRound;

- (void)shouldAnimateChanges:(BOOL)yesNo finished:(void(^)())isDone;

-(void) backgroundGlowAnimationFromColor:(UIColor *)startColor toColor:(UIColor *)destColor clearAnimationsFirst:(BOOL)reset;
-(BOOL) backgroundAnimationExist;

-(void)showHeighlightAnimationFromColor:(UIColor *)startColor;

-(BOOL) removeBackgroundAnimation;



@end
