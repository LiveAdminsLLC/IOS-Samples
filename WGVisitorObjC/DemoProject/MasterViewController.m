//
//  MasterViewController.m
//  WGOperator
//
//  Created by Pro on 5/27/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "MasterViewController.h"

#import "AppDelegate.h"

@import MCLocalization;
@import WGVisitor;

@interface MasterViewController ()

@end

@implementation MasterViewController

@synthesize dataArray;
@synthesize delegate;
#define CURRENT_DEVICE [[UIDevice currentDevice]userInterfaceIdiom]


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.dataArray = [NSArray arrayWithObjects:@"Add SubView",@"ByTabBar",@"ByPush",@"Presentation",@"Language Selection" , nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    self.selectedRow = indexPath.row;

    if(CURRENT_DEVICE == UIUserInterfaceIdiomPad)
        [self.delegate didSelectRow:indexPath.row];
    else
    {
        
        
        if(indexPath.row == 0)
        {
            
//            UIViewController * cont  = [self.storyboard instantiateViewControllerWithIdentifier:@"UserViewController"];
//            [self.navigationController pushViewController:cont animated:YES];
            
        }
        
        else if(indexPath.row == 1)
        {
            [self performSegueWithIdentifier:@"PushToTabBar" sender:@(1)];
        }
        
        else if (indexPath.row == 2)
        {
            [self performSegueWithIdentifier:@"simplePush" sender:@(2)];
        }
        
        else if (indexPath.row == 3)
        {
            [self performSegueWithIdentifier:@"ViewControllerByPresentation" sender:nil];
        }
        else if (indexPath.row == 4)
        {
            [self performSegueWithIdentifier:@"languageSelectionViewController" sender:nil];
        }
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    NSNumber * row = (NSNumber *)sender;
    BOOL isHTTPSession=NO;

    if(row.integerValue == 1)
    {
       
        UITabBarController * tabBar = segue.destinationViewController;
        WGVisitorViewController * visitor = [tabBar.viewControllers firstObject];
        visitor.isHTTPSession=isHTTPSession;

         UIBarButtonItem * bt = [[UIBarButtonItem alloc]initWithTitle:[MCLocalization stringForKey:@"Close"] style:UIBarButtonItemStyleDone target:nil action:nil];
        
        tabBar.navigationItem.rightBarButtonItem = bt;
        
        
        [visitor addTargetSessionClosedForBarButton:bt closed:^(WGVisitorStatus sessionStatus) {
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
//                [self handleSesssionStatus:sessionStatus];
            });

        }];

    }
    
    if(row.integerValue == 2)
    {
        WGVisitorViewController *visitor = segue.destinationViewController;

        visitor.isHTTPSession=isHTTPSession;
        
        UIBarButtonItem * bt = [[UIBarButtonItem alloc]initWithTitle:[MCLocalization stringForKey:@"Close"] style:(UIBarButtonItemStyleDone) target:nil action:nil];
        

        visitor.barButtonType=WGVisitorBarButtonLeft;
        
        
        [visitor addTargetSessionClosedForBarButton:bt closed:^(WGVisitorStatus sessionStatus) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
//                [self handleSesssionStatus:sessionStatus];
            });
            
        }];
        
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
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)rightHandler{


}

- (void)backHandler{


    [[self.view viewWithTag:101] removeFromSuperview];
    self.navigationItem.leftBarButtonItem = nil;


}


@end
