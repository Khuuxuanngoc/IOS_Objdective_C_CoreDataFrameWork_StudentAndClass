//
//  CourseActionViewController.h
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CourseActionViewControllerDelegate <NSObject>

@optional
-(void)courseActionViewControllerFinishActionWithFlag:(BOOL)flag;

@end

@interface CourseActionViewController : UIViewController

@property (nonatomic,weak) IBOutlet UITextField *txtCourseName;

@property (nonatomic,assign) BOOL isEdit;
@property (nonatomic,strong) Course *inputCourse;

@property (nonatomic,weak) id<CourseActionViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
