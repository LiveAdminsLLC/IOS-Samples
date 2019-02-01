//
//  ViewControllerByPresentation.m
//  WGOperator
//
//  Created by Pro on 5/27/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "ViewControllerByPresentation.h"

#import "AppDelegate.h"

@import MCLocalization;
@import WGVisitor;

@interface ViewControllerByPresentation ()


@property (nonatomic, retain)WGVisitorViewController * visitorControlelr;
@end

@implementation ViewControllerByPresentation
@synthesize visitorControlelr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BOOL isHTTPSession=NO;
    
   self.visitorControlelr = [WGVisitorViewController new];
    
    self.visitorControlelr.isHTTPSession = isHTTPSession;
    
    UIButton * simpleButton = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];

    {
        simpleButton.frame = CGRectMake(10, 5, 80, 40); // Adjust Frame
        [simpleButton setTitle:[MCLocalization stringForKey:@"Close"] forState:(UIControlStateNormal)];
    }
    
    UINavigationBar *yourBar = [[UINavigationBar alloc] init];
    yourBar.backgroundColor = [UIColor blackColor];
    
    UINavigationController * navigationBar = [[UINavigationController alloc]initWithRootViewController:visitorControlelr];
    
    
    [navigationBar.navigationBar addSubview:simpleButton];
    
    __weak typeof(WGVisitorViewController *) weakCont = self.visitorControlelr;
    __weak typeof (ViewControllerByPresentation  *)weakSelf  =self;
    
    [visitorControlelr addTargetSessionClosedForButton:simpleButton closed:^(WGVisitorStatus sessionStatus) {

//        [weakSelf handleSesssionStatus:sessionStatus];
        [weakCont dismissViewControllerAnimated:YES completion:^{
            
            [weakSelf.navigationController popViewControllerAnimated:NO];
            //[[ChatHeadManager sharedInstance] addDragViewWithCoordinator:nil dataDelegate:nil chatViews:nil];
            
        }];
        
    }];
    
    [self presentViewController:navigationBar animated:YES completion:^{
        
    }];
    
        [visitorControlelr.view addSubview:yourBar];
    // Do any additional setup after loading the view.
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"dealloc");
}


@end
