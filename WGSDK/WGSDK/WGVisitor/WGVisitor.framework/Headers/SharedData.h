//
//  SharedData.h
//  WGOperator
//
//  Created by Pro on 5/26/14.fd
//  Copyright (c) 2014 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface SharedData : NSObject

+ (SharedData *)getSharedInstance;

@property (nonatomic, assign)BOOL isLoggedIn;

- (UIViewController *)getCurrentDetailViewControler;
- (UIViewController *)getCurrentMasterViewControler;
- (UIInterfaceOrientation)getDeviceOrientation;

@property (nonatomic, retain)UIActivityIndicatorView * spinner;

- (void)showActivityIndicator:(UIView *)view;
- (void)hideActivityIndicator;


@property (nonatomic, retain)UIColor * outGoingTextColor;
@property (nonatomic, retain)UIColor * outGoingBackgroundColor;
@property (nonatomic, retain)UIColor * inComingTextColor;
@property (nonatomic, retain)UIColor * inComingBackgroundColor;

@property (nonatomic, retain)UIColor * sendButtonTextColor;
@property (nonatomic, retain)UIColor * sendButtonBackGroundColor;
@property (nonatomic, retain)UIImage * sendButtonBackGroundImage;

@property (nonatomic, retain)NSString *selectedLanguage;

@property (nonatomic, retain)NSBundle *resourcesBundle;

@property(nonatomic,strong) NSString * websiteDomainNameArabic;
@property(nonatomic,strong) NSString * websiteDomainNameEnglish;


@property(nonatomic,assign) Boolean shouldShowChatHead;
@property(nonatomic,strong) UIColor * chatHeadColour;


-(NSMutableArray *)allRooms;
-(void) showChatHeadIfNeeded;

@end
