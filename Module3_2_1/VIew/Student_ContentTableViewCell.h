//
//  Student_ContentTableViewCell.h
//  Module3_2_1
//
//  Created by MakerLab VN on 5/31/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StudentContentTableViewCellDelegate <NSObject>

@optional
-(void)studentContentTableViewCellDeleteAtIndex:(NSIndexPath *)index;
-(void)studentContentTableViewCellEditAtIndex:(NSIndexPath *)index;

@end

@interface Student_ContentTableViewCell : UITableViewCell

{
NSIndexPath *currentIndex;
}

@property (nonatomic,weak) IBOutlet UILabel *lblName;

@property (nonatomic,weak) id<StudentContentTableViewCellDelegate>delegate;

-(void)setCellWithStudent:(Student *)student atIndex:(NSIndexPath *)index;
@end

NS_ASSUME_NONNULL_END
