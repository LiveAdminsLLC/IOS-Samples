//
//  Constants+Status.h
//  WGVisitorCore
//
//  Created by Pro on 9/24/14.
//  Copyright (c) 2014 Pro. All rights reserved.
//

typedef NS_ENUM(NSInteger, WGVisitorStatus){
    
    AUTOMATIC_CLOSED,
    CLOSE_BUTTON_PRESSED,
    NO_OPERATOR_FOUND,
    NETWORK_ERROR,
    USER_BLOCKED,
    WEBSITE_NOT_FOUND,
    EMAIL_SENT,
    EMAIL_NOT_SENT,
    INTERNET_UNAVAILABLE_TO_INITIATE_CHAT
    
};


typedef NS_ENUM(NSInteger, WGVisitorBarButtonType){
    
    WGVisitorBarButtonRight,
    WGVisitorBarButtonLeft
    
};

typedef NS_ENUM(NSInteger, WGVisitorStatusLocal){
    
    WGVisitorStatusAutomaticClosed=AUTOMATIC_CLOSED,
    WGVisitorStatusCloseButtonPressed=CLOSE_BUTTON_PRESSED,
    WGVisitorStatusNoOperatorFound=NO_OPERATOR_FOUND,
    WGVisitorStatusNetworkError=NETWORK_ERROR,
    WGVisitorStatusUserBlocked=USER_BLOCKED,
    WGVisitorStatusDomainNameError=WEBSITE_NOT_FOUND,
    WGVisitorStatusEmailSent=EMAIL_SENT,
    WGVisitorStatusEmailNotSent=EMAIL_NOT_SENT,
    WGVisitorStatusInternetUnavaliableToInitiateChat=INTERNET_UNAVAILABLE_TO_INITIATE_CHAT
    
};

