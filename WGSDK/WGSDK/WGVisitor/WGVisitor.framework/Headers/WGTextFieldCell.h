//
//  WGTextFieldCell.h
//  WGOperator
//
//  Created by  on 12/05/2014.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGTextFieldCell : UITableViewCell<UITextFieldDelegate>



@property(nonatomic,strong) UITextField * textField;;

-(void) reloadData:(id) anything;

typedef NS_ENUM(NSInteger, fieldType){

    NAME,
    PHONE,
    EMAIL,
    COMMENTS,
};

@property (nonatomic, assign)fieldType type;
-(void)CellSet;
@end
