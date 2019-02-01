//
//  SelectedRowSegue.m
//  WGOperator
//
//  Created by Pro on 5/27/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "SelectedRowSegue.h"
#import "DetailViewController.h"
#import "MasterViewController.h"

@implementation SelectedRowSegue

- (void)perform
{

    
    if([self.destinationViewController isKindOfClass:[DetailViewController class]])
    {
     
        
        MasterViewController * master  =self.sourceViewController;
        DetailViewController  * detail = self.destinationViewController;
        
        [detail didSelectRow:master.selectedRow];
        
    
    }
    
}
@end
