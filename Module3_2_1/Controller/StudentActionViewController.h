//
//  StudentActionViewController.h
//  Module3_2_1
//
//  Created by MakerLab VN on 5/29/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@protocol StudentActionViewControllerDelegate <NSObject>

@optional
-(void)studentActionViewControllerFinishActionWithFlag:(BOOL)flag;

@end

@interface StudentActionViewController : UIViewController

@property (nonatomic,weak) IBOutlet UITextField *txtStudentName;

@property (nonatomic,assign) BOOL isEdit;
@property (nonatomic,strong) Student *inputStudent;
@property (nonatomic, strong) Course *inputCourse;

@property (nonatomic,weak) id<StudentActionViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
