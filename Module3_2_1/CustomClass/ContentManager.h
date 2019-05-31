//
//  ContentManager.h
//  Module3_1_3
//
//  Created by Hoc Vien on 5/18/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course+CoreDataClass.h"
#import "Student+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContentManager : NSObject

+(ContentManager *)shareManager;

-(BOOL)addCourseWithName:(NSString *)name;

-(NSArray *)getAllCourse;

-(BOOL)kxnDeleteCourse:(Course*)course;

-(BOOL)kxnUpdateCourse:(Course*)course andNewName:(NSString*)newName;

-(BOOL)addStudentWithName:(NSString *)name andCourse:(Course*)course;

-(BOOL)kxnUpdateStudent:(Student*)student andNewName:(NSString*)newName;

-(BOOL)kxnDeleteStudent:(Student*)student;

@end

NS_ASSUME_NONNULL_END
