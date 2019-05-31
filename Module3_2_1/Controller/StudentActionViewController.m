//
//  StudentActionViewController.m
//  Module3_2_1
//
//  Created by MakerLab VN on 5/29/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import "StudentActionViewController.h"

@interface StudentActionViewController ()

@end

@implementation StudentActionViewController

@synthesize txtStudentName;

@synthesize inputCourse;
@synthesize inputStudent;
@synthesize isEdit;

@synthesize delegate;

#pragma mark - Life circle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(isEdit)
    {
        [txtStudentName setText:[inputStudent studentName]];
    }
}

#pragma mark - Action

-(IBAction)saveStudent:(id)sender
{
    if([[txtStudentName text]length] >= 2)
    {
        if(isEdit)
        {
            BOOL success = [CONTENT_MANAGER kxnUpdateStudent:inputStudent andNewName:[txtStudentName text]];
            
            if(delegate!=nil && [delegate respondsToSelector:@selector(studentActionViewControllerFinishActionWithFlag:)])
            {
                [delegate studentActionViewControllerFinishActionWithFlag:success];
            }
            
            [self.navigationController popViewControllerAnimated:YES];
            
            //            [CONTENT_MANAGER updateCourseWithId:[inputCourse courseId] andNewName:[txtCourseName text] completion:^(BOOL success, NSString * _Nonnull message) {
            //
            //                if(delegate!=nil && [delegate respondsToSelector:@selector(courseActionViewControllerFinishActionWithFlag:)])
            //                {
            //                    [delegate courseActionViewControllerFinishActionWithFlag:success];
            //                }
            //
            //                [self.navigationController popViewControllerAnimated:YES];
            //            }];
        }
        else
        {
            BOOL success = [CONTENT_MANAGER addStudentWithName:[txtStudentName text] andCourse:inputCourse];
            
            if(delegate!=nil && [delegate respondsToSelector:@selector(studentActionViewControllerFinishActionWithFlag:)])
            {
                [delegate studentActionViewControllerFinishActionWithFlag:success];
            }
            
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}


@end
