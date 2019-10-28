//
//  AppDelegate.m
//  DemoProject
//
//  Created by Pro on 10/22/14.
//  Copyright (c) 2014 Pro. All rights reserved.
//

#import "AppDelegate.h"


#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


@import WGVisitor;


@interface AppDelegate ()

{

}


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Fabric with:@[[Crashlytics class]]];
    
    
    NSString * language = @"en";
    
    if ([language isEqualToString:@"ar"])
    {
        [WGVisitorViewController setPreferredLanguage:@"ar"];
    }
    else
    {
        [WGVisitorViewController setPreferredLanguage:@"en"];
    }
    
    
    
    
    NSDictionary* chatConfigurations =    @{ @"en":@{
                                        @"PrivacyLink": @"https://www.eaglehills.com/privacy-policy/",
                                        @"DomainNameLink": @"thelivechatsoftware.com/les/chats/test6",
                                        @"RTL": @(NO) ,
                                        @"ApplicationName": @"Eagle Hills"
                                        },
                                 
                                             @"ar":@{
                                       
                                       @"PrivacyLink": @"https://www.eaglehills.com/ar/privacy-policy/",
                                       @"DomainNameLink": @"thelivechatsoftware.com/les/chats/test6",
                                       @"RTL": @(YES),
                                       @"ApplicationName" : @" إيجل هيلز"
                                       }
                                 
                                             };
    
    [WGVisitorViewController setChatConfigurations:chatConfigurations];
    
    
    NSDictionary* themeConfigurations = @{
                               
                                          
                                          
                               @"ThemeColor": [UIColor colorWithRed:32/255.0 green:42/255.0 blue:69/255.0 alpha:1],
                               
                               @"ChatHeadColour": [UIColor colorWithRed:32/255.0 green:42/255.0 blue:69/255.0 alpha:1],
                               
                               @"NavigationLogo":
                                   [UIImage imageNamed:@"logo"],
                               
                               
                               @"AgentMessage":@{
                                               
                                               @"backgroundColor":[UIColor colorWithRed:32/255.0 green:42/255.0 blue:69/255.0 alpha:1],
                                               @"textColor": [UIColor  whiteColor],
                                               @"linkTextColor": [UIColor yellowColor],
                                               @"avatar" :
                                                    [UIImage imageNamed:@"logo_for_agent"],
                                               //
                                               },
                               
                               @"VisitorMessage":@{
                                       
                                       
                                       @"backgroundColor": [UIColor colorWithHue:240.0 / 360.0 saturation:0.02 brightness:0.92 alpha:1.0],
                                       
                                       @"textColor": [UIColor darkTextColor],
                                       @"linkTextColor": [UIColor blueColor],
                                                 
                                                 //                "avatar" : UIImage.init(imageLiteralResourceName: "eaglehills_logo_for_chat")
                                                 
                                                 }
                               
                               };
    
  
    
    [WGVisitorViewController setThemeConfigurations:themeConfigurations];
    
    [WGVisitorViewController shouldShowChatHead:YES];
    [WGVisitorViewController shouldShowTimeStamp:YES];
    
    
    [WGVisitorViewController setVisitorName:@"Michael" phoneNumber:@"12345678" email:@"michael@test.com"];
    
    
    
    
    //[[ChatHeadManager sharedInstance] setupWithWindow:self.window chDraggingCoordinatorDelegate:self];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
