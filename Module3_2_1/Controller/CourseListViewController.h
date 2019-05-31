//
//  CourseListViewController.h
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseActionViewController.h"
#import "ContentTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CourseListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, CourseActionViewControllerDelegate, ContentTableViewCellDelegate>
{
    NSMutableArray *courseList;
}

@property (nonatomic,weak) IBOutlet UITableView *tblCourse;

@end

NS_ASSUME_NONNULL_END
