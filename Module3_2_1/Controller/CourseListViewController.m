//
//  CourseListViewController.m
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import "CourseListViewController.h"
#import "StudentListViewController.h"


@interface CourseListViewController ()

@end

@implementation CourseListViewController

@synthesize tblCourse;

#pragma mark - Life circle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpView];
}

#pragma mark - Methods

-(void)setUpView
{
    [self setTitle:@"Course List"];
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setFrame:CGRectMake(0, 0, 35, 35)];
    [btnRight setTitle:@"+" forState:UIControlStateNormal];
    btnRight.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    [btnRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(addCourseAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnRight = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    [self.navigationItem setRightBarButtonItem:barBtnRight];
    
    [tblCourse setFrame:CGRectMake(0, STATUS_HEIGHT + NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_HEIGHT - NAVIGATION_HEIGHT)];
    
    [tblCourse registerNib:[UINib nibWithNibName:NSStringFromClass([ContentTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"Cell"];
    tblCourse.dataSource = self;
    tblCourse.delegate = self;
    
    [self getData];
   
}

-(void)getData
{
    courseList = [[NSMutableArray alloc]init];
    
    [courseList addObjectsFromArray:[CONTENT_MANAGER getAllCourse]];
    
    [tblCourse reloadData];
}

#pragma mark - TableView' delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentListViewController * studentsView = [[StudentListViewController alloc]init];
    
    studentsView.inputCourse = [courseList objectAtIndex:[indexPath row]];
    
    [self.navigationController pushViewController:studentsView animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [courseList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentTableViewCell *cell = [tblCourse dequeueReusableCellWithIdentifier:@"Cell"];
    
    [cell setCellWithCourse:[courseList objectAtIndex:[indexPath row]] atIndex:indexPath];
    
    cell.delegate = self;
    
    return cell;
}

#pragma mark - ContentTableViewCell's delegate

-(void)contentTableViewCellDeleteAtIndex:(NSIndexPath *)index
{
        Course *course = [courseList objectAtIndex:[index row]];
    
        [CONTENT_MANAGER kxnDeleteCourse:course];
            
        [courseList removeObjectAtIndex:[index row]];

        [tblCourse beginUpdates];

        [tblCourse deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];

        [tblCourse endUpdates];

        [tblCourse reloadData];
    
            
        

    
//    CourseModel *course = [courseList objectAtIndex:[index row]];
//
//    [CONTENT_MANAGER deleteCourseWithId:[course courseId] completion:^(BOOL success, NSString *message) {
//
//        if(success)
//        {
//            [courseList removeObjectAtIndex:[index row]];
//
//            [tblCourse beginUpdates];
//
//            [tblCourse deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
//
//            [tblCourse endUpdates];
//
//            [tblCourse reloadData];
//        }
//        else
//        {
//            NSLog(@"Error");
//        }
//    }];
}

-(void)contentTableViewCellEditAtIndex:(NSIndexPath *)index
{
    CourseActionViewController *actionView = [[CourseActionViewController alloc]init];

    actionView.isEdit = YES;
    actionView.inputCourse = [courseList objectAtIndex:[index row]];
    actionView.delegate = self;

    [self.navigationController pushViewController:actionView animated:YES];
}

#pragma mark - CourseActionViewController's delegate

-(void)courseActionViewControllerFinishActionWithFlag:(BOOL)flag
{
    if(flag)
    {
        [self getData];
    }
}

#pragma mark - Action

-(IBAction)addCourseAction:(id)sender
{
    CourseActionViewController *actionView = [[CourseActionViewController alloc]init];
    
    actionView.delegate = self;
    
    [self.navigationController pushViewController:actionView animated:YES];
}



@end
