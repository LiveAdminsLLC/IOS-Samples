//
//  ViewController.m
//  DemoObjc
//
//  Created by Pro on 04/02/2019.
//  Copyright © 2019 Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * closeBtn = [[UIBarButtonItem alloc]initWithTitle:[MCLocalization stringForKey:@"Close"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    if (self.tabBarController != nil) {
        self.tabBarController.navigationItem.rightBarButtonItem = closeBtn;
    }
    __weak typeof(self) weakSelf = self;
    [self addTargetSessionClosedForBarButton:closeBtn closed:^(WGVisitorStatus sessionStatus) {
        
        [weakSelf handleSesssionStatus:sessionStatus];
        
    }];
    
}

- (void)handleSesssionStatus: (WGVisitorStatus) sessionStatus{
    
    switch (sessionStatus) {
        case INTERNET_UNAVAILABLE_TO_INITIATE_CHAT:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"Internet appears to be offline"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            break;
            
        case CLOSE_BUTTON_PRESSED:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"Close button press"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            // Close Button Intentionally Pressed to close end session
            
            break;
            
        case  AUTOMATIC_CLOSED :
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"Automatic Closed"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            //Session closed automatically because visitor may be for a long time
            
            break;
            
        case NO_OPERATOR_FOUND:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"No operator found"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            
            // No Operator Found
            
            break;
        case NETWORK_ERROR:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"Network error"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            // Call to webserver failed
            
            break;
        case USER_BLOCKED:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"User block"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            //
            
            break;
        case WEBSITE_NOT_FOUND:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"Website not found"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            break;
        case EMAIL_SENT:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Success"] message:[MCLocalization stringForKey:@"Email sent"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            //launch close button here
            
            break;
        case EMAIL_NOT_SENT:
            
            [[[UIAlertView alloc]initWithTitle:[MCLocalization stringForKey:@"Error"] message:[MCLocalization stringForKey:@"Unable to send email"] delegate:nil cancelButtonTitle:[MCLocalization stringForKey:@"Ok"] otherButtonTitles: nil]show];
            
            //launch close button here
            
            break;
        default:
            break;
            
            
    }
    
    //[self.navigationController popViewControllerAnimated:YES];
    
}


@end
