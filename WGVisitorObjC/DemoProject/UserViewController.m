//
//  UserViewController.m
//  WGOperator
//
//  Created by Pro on 5/27/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "UserViewController.h"

#import "AppDelegate.h"
@import MCLocalization;


@import WGVisitor;

@interface UserViewController ()


@property(nonatomic, retain) WGVisitorViewController *visitorController ;
@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CGRect)statusBarFrameViewRect:(UIView*)view
{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    
    
    return statusBarFrame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self statusBarFrameViewRect:self.view];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    BOOL isHTTPSession=NO;
    
    [self.closeButton setTitle:[MCLocalization stringForKey:@"Close"] forState:(UIControlStateNormal)];
    
    self.visitorController = [[WGVisitorViewController alloc]init];

    self.visitorController.isHTTPSession=isHTTPSession;
    
    __weak typeof(self) weakSelf = self;
    
    [self.visitorController addTargetSessionClosedForButton:self.closeButton closed:^(WGVisitorStatus sessionStatus) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
//            [weakSelf handleSesssionStatus:sessionStatus];
        });
        
    }];
    
    self.visitorController.view.frame=CGRectMake(0,0,CGRectGetWidth(self.containerView.frame),CGRectGetHeight(self.containerView.frame));
    
    [self.containerView addSubview:self.visitorController.view];

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
    
    if (!(sessionStatus==NETWORK_ERROR)) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneHandler:(id)sender{

    [self.visitorController.view removeFromSuperview];

}

- (void)dealloc{

}

@end
