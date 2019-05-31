//
//  StudentListViewController.m
//  Module3_2_1
//
//  Created by MakerLab VN on 5/28/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import "StudentListViewController.h"
#import "Student_ContentTableViewCell.h"
#import "StudentActionViewController.h"

@interface StudentListViewController ()

@end

@implementation StudentListViewController
@synthesize tblStudent;
@synthesize inputCourse;

#pragma mark - Life circle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpView];
}

#pragma mark - Methods

-(void)setUpView
{
    [self setTitle:@"Student List"];
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setFrame:CGRectMake(0, 0, 35, 35)];
    [btnRight setTitle:@"+" forState:UIControlStateNormal];
    btnRight.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    [btnRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(addStudentAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnRight = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    [self.navigationItem setRightBarButtonItem:barBtnRight];
    
        [tblStudent setFrame:CGRectMake(0, STATUS_HEIGHT + NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_HEIGHT - NAVIGATION_HEIGHT)];
    
        [tblStudent registerNib:[UINib nibWithNibName:NSStringFromClass([Student_ContentTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"Cell2"];
    tblStudent.dataSource = self;
    tblStudent.delegate = self;
    
        [self getData];
    
    
    
    //    [tblCourse setFrame:CGRectMake(0, STATUS_HEIGHT + NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_HEIGHT - NAVIGATION_HEIGHT)];
//
//    [tblCourse registerNib:[UINib nibWithNibName:NSStringFromClass([ContentTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"Cell"];
//    tblCourse.dataSource = self;
//    tblCourse.delegate = self;
//
//    [self getData];
    
}

-(void)getData
{
    studentList = [[NSMutableArray alloc]init];
//
    [studentList addObjectsFromArray:[[inputCourse hasStudent]allObjects]];
    
    [tblStudent reloadData];
}

#pragma mark - TableView' delegate

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    StudentListViewController * studentsView = [[StudentListViewController alloc]init];
//
//    [self.navigationController pushViewController:studentsView animated:YES];
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [studentList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Student_ContentTableViewCell *cell = [tblStudent dequeueReusableCellWithIdentifier:@"Cell2"];
    
    [cell setCellWithStudent:[studentList objectAtIndex:[indexPath row]] atIndex:indexPath];
    
    cell.delegate = self;
    
    return cell;
}

#pragma mark - Action

-(IBAction)addStudentAction:(id)sender
{
    StudentActionViewController *actionView = [[StudentActionViewController alloc]init];
    
    actionView.delegate = self;
    actionView.inputCourse = [self inputCourse];
    
    [self.navigationController pushViewController:actionView animated:YES];
}

#pragma mark - StudentActionViewController's delegate

-(void)studentActionViewControllerFinishActionWithFlag:(BOOL)flag
{
    if(flag)
    {
        [self getData];
    }
}

#pragma mark - Student_ContentTableViewCell 's delegate
-(void)studentContentTableViewCellDeleteAtIndex:(NSIndexPath *)index
{
    Student * student = [studentList objectAtIndex:[index row]];
    
    [CONTENT_MANAGER kxnDeleteStudent:student];
    
    [studentList removeObjectAtIndex:[index row]];
    
    [tblStudent beginUpdates];
    
    [tblStudent deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [tblStudent endUpdates];
    
    [tblStudent reloadData];
}

-(void)studentContentTableViewCellEditAtIndex:(NSIndexPath *)index
{
    StudentActionViewController *actionView = [[StudentActionViewController alloc]init];
    
    actionView.isEdit = YES;
    actionView.inputStudent = [studentList objectAtIndex:[index row]];
    actionView.delegate = self;
    
    [self.navigationController pushViewController:actionView animated:YES];
}
@end
