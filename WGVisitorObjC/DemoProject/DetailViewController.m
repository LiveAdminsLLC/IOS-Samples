//
//  DetailViewController.m
//  WGOperator
//
//  Created by Pro on 5/27/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "DetailViewController.h"

#import "AppDelegate.h"

@import MCLocalization;
@import WGVisitor;

@interface DetailViewController ()

@property (nonatomic, retain)WGVisitorViewController *visitor;
@property (nonatomic, assign)UIPopoverController * pop;

@end

@implementation DetailViewController

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
    
    self.splitViewController.delegate = self;
   UINavigationController *masterNavi =  [self.splitViewController.viewControllers objectAtIndex:0];
   MasterViewController * master = [masterNavi.viewControllers firstObject];
    
    master.delegate = self;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showMenu:) name:@"showMenu" object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideMenu:) name:@"hideMenu" object:nil];


}



- (IBAction)leftBtnHander:(UIBarButtonItem *)sender{

    [[NSNotificationCenter defaultCenter]postNotificationName:@"showMenu" object:sender];

}

- (void)swipeHandler:(UISwipeGestureRecognizer *)sender{


    UIBarButtonItem *bar = [UIBarButtonItem new];;
    
    [self.pop presentPopoverFromBarButtonItem:bar permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];


}

- (void)hideMenu:(NSNotification *)sender{
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

    if(orientation ==UIInterfaceOrientationPortrait || orientation ==UIInterfaceOrientationPortraitUpsideDown)
    [self.pop dismissPopoverAnimated:NO];

}

- (void)showMenu:(NSNotification *)sender{

    UIBarButtonItem * bar = [sender object];

    
UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(orientation ==UIInterfaceOrientationPortrait || orientation ==UIInterfaceOrientationPortraitUpsideDown)
    [self.pop presentPopoverFromBarButtonItem:bar permittedArrowDirections:(UIPopoverArrowDirectionAny) animated:YES];

}


- (void)splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController{


    self.pop = pc;


}


- (void)splitViewController:(UISplitViewController *)iSplitViewController
     willHideViewController:(UIViewController *)iViewController
          withBarButtonItem:(UIBarButtonItem *)iBarButtonItem
       forPopoverController:(UIPopoverController *)iPopoverController
{
    self.pop = iPopoverController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectRow:(NSInteger)row{
    
    BOOL isHTTPSession=NO;
    
    self.visitor = [[WGVisitorViewController alloc]init];
    
    self.visitor.isHTTPSession=isHTTPSession;
    
    
        [self.navigationController popToRootViewControllerAnimated:NO];
    if(row == 0)
    {
        
        
//   UIViewController * cont = [self.storyboard instantiateViewControllerWithIdentifier:@"UserViewController"];
//
//
//
//        [self.navigationController pushViewController:cont animated:YES];
        
    }
    
   else if(row == 1)
    {
    
        

        UITabBarController * tabBar = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarViewController"];
        UINavigationController *nav = [tabBar.viewControllers objectAtIndex:1];
        WGVisitorViewController * wg = [nav.viewControllers firstObject];
        
        wg.isHTTPSession=isHTTPSession;
        
        UIBarButtonItem * barButton = [[UIBarButtonItem alloc]initWithTitle:[MCLocalization stringForKey:@"Close"] style:(UIBarButtonItemStyleDone) target:nil action:nil];
        wg.navigationItem.rightBarButtonItem = barButton;
        
        [wg addTargetSessionClosedForBarButton:barButton closed:^(WGVisitorStatus sessionStatus) {

            
            dispatch_async(dispatch_get_main_queue(), ^{
                
//                [self handleSesssionStatus:sessionStatus];
            });
        

        }];
        
        [self.navigationController pushViewController:tabBar animated:YES];
    }
    
    else if (row == 2)
    {
        
        WGVisitorViewController * wgVisitorViewController = self.visitor;
        
        wgVisitorViewController.isHTTPSession=isHTTPSession;

        
        UIBarButtonItem * barButton = [[UIBarButtonItem alloc]initWithTitle:[MCLocalization stringForKey:@"Close"] style:(UIBarButtonItemStyleDone) target:nil action:nil];
        wgVisitorViewController.navigationItem.rightBarButtonItem = barButton;
        
        
        [wgVisitorViewController addTargetSessionClosedForBarButton:barButton closed:^(WGVisitorStatus sessionStatus) {
           
            dispatch_async(dispatch_get_main_queue(), ^{
                
//                [self handleSesssionStatus:sessionStatus];
            });
            
        }];
        
        [self.navigationController pushViewController:wgVisitorViewController animated:YES];
        
    }
    
    else if (row == 3)
    {
        
        UIViewController * present = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerByPresentation"];

        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"hideMenu" object:nil];;
        
        [self.navigationController pushViewController:present animated:YES];
        
    }
    
    else if (row == 4)
    {
        
        UIViewController * present = [self.storyboard instantiateViewControllerWithIdentifier:@"languageSelectionViewController"];
        
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"hideMenu" object:nil];;
        
        [self.navigationController pushViewController:present animated:YES];
        
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)dealloc{

}

@end
