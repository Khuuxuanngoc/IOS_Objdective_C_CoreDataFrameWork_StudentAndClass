//
//  Student+CoreDataProperties.m
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Student"];
}

@dynamic studentName;
@dynamic inClass;

@end
