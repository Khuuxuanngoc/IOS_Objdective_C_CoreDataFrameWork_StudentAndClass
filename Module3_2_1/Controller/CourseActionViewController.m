//
//  CourseActionViewController.m
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import "CourseActionViewController.h"

@interface CourseActionViewController ()

@end

@implementation CourseActionViewController

@synthesize txtCourseName;

@synthesize inputCourse;
@synthesize isEdit;

@synthesize delegate;

#pragma mark - Life circle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(isEdit)
    {
        [txtCourseName setText:[inputCourse courseName]];
    }
}

#pragma mark - Action

-(IBAction)saveCourse:(id)sender
{
    if([[txtCourseName text]length] >= 2)
    {
        if(isEdit)
        {
            BOOL success = [CONTENT_MANAGER kxnUpdateCourse:inputCourse andNewName:[txtCourseName text]];

                if(delegate!=nil && [delegate respondsToSelector:@selector(courseActionViewControllerFinishActionWithFlag:)])
                {
                    [delegate courseActionViewControllerFinishActionWithFlag:success];
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
            BOOL success = [CONTENT_MANAGER addCourseWithName:[txtCourseName text]];
            
            if(delegate!=nil && [delegate respondsToSelector:@selector(courseActionViewControllerFinishActionWithFlag:)])
            {
                [delegate courseActionViewControllerFinishActionWithFlag:success];
            }

            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}


@end
