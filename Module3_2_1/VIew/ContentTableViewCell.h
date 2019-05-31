//
//  ContentTableViewCell.h
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course+CoreDataClass.h"
#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@protocol ContentTableViewCellDelegate <NSObject>

@optional
-(void)contentTableViewCellDeleteAtIndex:(NSIndexPath *)index;
-(void)contentTableViewCellEditAtIndex:(NSIndexPath *)index;

@end

@interface ContentTableViewCell : UITableViewCell
{
    NSIndexPath *currentIndex;
}

@property (nonatomic,weak) IBOutlet UILabel *lblName;

@property (nonatomic,weak) id<ContentTableViewCellDelegate>delegate;

-(void)setCellWithCourse:(Course *)course atIndex:(NSIndexPath *)index;

-(void)setCellWithStudent:(Student *)student atIndex:(NSIndexPath *)index;

@end

NS_ASSUME_NONNULL_END
