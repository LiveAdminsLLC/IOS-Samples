//
//  MasterViewController.h
//  WGOperator
//
//  Created by Pro on 5/27/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterViewProtocol <NSObject> 

- (void)didSelectRow:(NSInteger)row;

@end

@interface MasterViewController : UITableViewController


{
    

}

@property (nonatomic, assign)id<MasterViewProtocol>delegate;
@property (nonatomic,assign)NSInteger selectedRow;
@property (nonatomic, retain) NSArray * dataArray;

@end
