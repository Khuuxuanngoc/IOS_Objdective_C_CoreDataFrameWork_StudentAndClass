//
//  ContentTableViewCell.m
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import "ContentTableViewCell.h"

@implementation ContentTableViewCell

@synthesize lblName;

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - Cell for Course

-(void)setCellWithCourse:(Course *)course atIndex:(NSIndexPath *)index
{
    currentIndex = index;

    [lblName setText:[course courseName]];
}

-(IBAction)deleteAction:(id)sender
{
    if(delegate!= nil && [delegate respondsToSelector:@selector(contentTableViewCellDeleteAtIndex:)])
    {
        [delegate contentTableViewCellDeleteAtIndex:currentIndex];
    }
}

-(IBAction)editAction:(id)sender
{
    if(delegate !=nil && [delegate respondsToSelector:@selector(contentTableViewCellEditAtIndex:)])
    {
        [delegate contentTableViewCellEditAtIndex:currentIndex];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Cell for Student

-(void)setCellWithStudent:(Student *)student atIndex:(NSIndexPath *)index
{
    currentIndex = index;
    
    [lblName setText:[student studentName]];
}
@end
