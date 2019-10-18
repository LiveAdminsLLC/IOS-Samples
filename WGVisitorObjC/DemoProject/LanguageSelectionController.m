//
//  LanguageSelectionController.m
//  DemoProject
//
//  Created by Tallha Sarwar on 09/01/2017.
//  Copyright © 2017 Pro. All rights reserved.
//

#import "LanguageSelectionController.h"

@import MCLocalization;
@import WGVisitor;

@interface LanguageSelectionController ()
{
    NSInteger selecteRow;
}

@end

@implementation LanguageSelectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.dataArray = [NSArray arrayWithObjects:@"English",@"العربية", nil];
    
//    [self getLanguageData];
}

-(void)getLanguageData
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [[WGVisitorWebService sharedInstance] getLanguagesList:dict WithBlock:^(BOOL result, WGVisitorStatus status) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)quitApplication
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[MCLocalization stringForKey:@"Warning"]
                                                    message:[MCLocalization stringForKey:@"Application need to restart please start it again"]
                                                   delegate:self
                                          cancelButtonTitle:[MCLocalization stringForKey:@"Ok"]
                                          otherButtonTitles:[MCLocalization stringForKey:@"Cancel"], nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        if (selecteRow == 0) {
            
            [WGVisitorViewController setPreferredLanguage:@"ar"];
        }
        else if (selecteRow==1) {
            
            [WGVisitorViewController setPreferredLanguage:@"en"];
        }
        exit(0);
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

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
    
    selecteRow=indexPath.row;
    
    NSString * language = [WGVisitorSharedData getSharedInstance].selectedLanguage;
    
    if ([language isEqualToString:@"ar"]&&selecteRow==0) {
        
        
        [WGVisitorViewController setPreferredLanguage:@"en"];
        
    }
    else if ((![language isEqualToString:@"ar"] )&& selecteRow==1)
    {
        [WGVisitorViewController setPreferredLanguage:@"ar"];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
