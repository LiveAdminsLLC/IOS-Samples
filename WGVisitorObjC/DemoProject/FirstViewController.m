//
//  FirstViewController.m
//  DemoObjc
//
//  Created by Pro on 04/02/2019.
//  Copyright © 2019 Pro. All rights reserved.
//

#import "FirstViewController.h"
@import WGVisitor;
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showChatAsNavigation:(UIButton *)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)showChatHeadAction:(UISwitch *)sender {
    
    [WGVisitorViewController shouldShowChatHead:sender.isOn];
    
}

- (IBAction)showLanguageSelectionVC:(UIButton *)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"LanguageSelectionController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}






@end
