//
//  WGVisitorViewController.h
//  WGOperator
//
//  Created by  on 09/05/2014.
//  Copyright (c) 2014 . All rights reserved.
//


#import <UIKit/UIKit.h>


@import WGVisitorCore;


@interface WGVisitorViewController : UIViewController



- (void)addTargetSessionClosedForButton:(UIButton*)control  closed:( void(^)(WGVisitorStatus sessionStatus))sucess;


- (void)addTargetSessionClosedForBarButton:(UIBarButtonItem*)control  closed:( void(^)(WGVisitorStatus sessionStatus))sucess;

@property(assign) WGVisitorBarButtonType barButtonType;

@property(nonatomic,assign) BOOL isHTTPSession; //by default its true which means it will be giving xmpp session

+(void)setPreferredLanguage:(NSString*)languageCode;// "ar" for arabic

+(void)setDomainForArabic:(NSString*)arabicDomain;

+(void)setDomainForEnglish:(NSString*)englishDomain;

+(void)shouldShowChatHead:(Boolean)flag;
+(void)chatHeadColour:(UIColor *)color;

+(void)setVisitorName:(NSString*)visitorName phoneNumber:(NSString*)phoneNumber email:(NSString*) email;

//Customization



@property (nonatomic, retain)UIColor * outGoingTextColor;
@property (nonatomic, retain)UIColor * outGoingBackgroundColor;
@property (nonatomic, retain)UIColor * inComingTextColor;
@property (nonatomic, retain)UIColor * inComingBackgroundColor;

@property (nonatomic, retain)UIColor * sendButtonTextColor;
@property (nonatomic, retain)UIColor * sendButtonBackGroundColor;
@property (nonatomic, retain)UIImage * sendButtonBackGroundImage;

@end
