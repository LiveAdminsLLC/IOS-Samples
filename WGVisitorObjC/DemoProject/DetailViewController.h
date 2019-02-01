//
//  DetailViewController.h
//  WGOperator
//
//  Created by Pro on 5/27/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
@interface DetailViewController : UIViewController <MasterViewProtocol,UISplitViewControllerDelegate>
{


}

- (void)didSelectRow:(NSInteger)row;

@end
