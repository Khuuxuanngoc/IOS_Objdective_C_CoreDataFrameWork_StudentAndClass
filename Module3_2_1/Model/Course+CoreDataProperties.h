//
//  Course+CoreDataProperties.h
//  Module3_2_1
//
//  Created by Hoc Vien on 5/21/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//
//

#import "Course+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *courseName;
@property (nullable, nonatomic, retain) NSSet<Student *> *hasStudent;

@end

@interface Course (CoreDataGeneratedAccessors)

- (void)addHasStudentObject:(Student *)value;
- (void)removeHasStudentObject:(Student *)value;
- (void)addHasStudent:(NSSet<Student *> *)values;
- (void)removeHasStudent:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
