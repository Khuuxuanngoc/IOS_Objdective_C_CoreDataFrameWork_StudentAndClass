//
//  Student_ContentTableViewCell.m
//  Module3_2_1
//
//  Created by MakerLab VN on 5/31/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import "Student_ContentTableViewCell.h"

@implementation Student_ContentTableViewCell

@synthesize lblName;

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - Cell for Student

-(void)setCellWithStudent:(Student *)student atIndex:(NSIndexPath *)index
{
    currentIndex = index;
    
    [lblName setText:[student studentName]];
}

-(IBAction)deleteAction:(id)sender
{
    if(delegate!= nil && [delegate respondsToSelector:@selector(studentContentTableViewCellDeleteAtIndex:)])
    {
        [delegate studentContentTableViewCellDeleteAtIndex:currentIndex];
    }
}

-(IBAction)editAction:(id)sender
{
    if(delegate !=nil && [delegate respondsToSelector:@selector(studentContentTableViewCellEditAtIndex:)])
    {
        [delegate studentContentTableViewCellEditAtIndex:currentIndex];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
