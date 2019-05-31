//
//  StudentListViewController.h
//  Module3_2_1
//
//  Created by MakerLab VN on 5/28/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student+CoreDataClass.h"
#import "StudentActionViewController.h"
#import "Student_ContentTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, StudentActionViewControllerDelegate, StudentContentTableViewCellDelegate>
{
    NSMutableArray *studentList;
}

@property (nonatomic,weak) IBOutlet UITableView *tblStudent;
@property (nonatomic,strong) Course *inputCourse;

@end

NS_ASSUME_NONNULL_END
