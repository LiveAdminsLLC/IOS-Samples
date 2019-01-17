//
//  WGContactUsViewController.h
//  WGOperator
//
//  Created by  on 09/05/2014.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WGVisitorCore/WGVisitorConstants+status.h"

@interface WGContactUsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>


@property (nonatomic,retain)NSString *domainNameArabic;
@property (nonatomic,retain)NSString *domainNameEnglish;

- (id)initWithBlock:(void (^)(WGVisitorStatus status))sucess;


@end
