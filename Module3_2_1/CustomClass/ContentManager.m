//
//  ContentManager.m
//  Module3_1_3
//
//  Created by Hoc Vien on 5/18/19.
//  Copyright © 2019 Hoc Vien. All rights reserved.
//

#import "ContentManager.h"
#import "AppDelegate.h"

@implementation ContentManager

+(ContentManager *)shareManager
{
    static ContentManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[ContentManager alloc]init];
    });
    
    return manager;
}

-(NSManagedObjectContext *)getCurrentContext
{
    AppDelegate *application = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    return application.persistentContainer.viewContext;
}

-(BOOL)addCourseWithName:(NSString *)name
{
    /// Get current context of app
    NSManagedObjectContext *context = [self getCurrentContext];
    
    /// Make insert request
    Course *course = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:context];
    
    course.courseName = name;
    
    NSError *error = nil;
    
//    return [context save:&error];
    
    if([context save:&error])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(NSArray *)getAllCourse
{
    /// Get current context of app
    NSManagedObjectContext *context = [self getCurrentContext];
    
    /// Create fetch request
    NSFetchRequest *request = [Course fetchRequest];
    
    /// Set sort column. If you want multi sort, crate multi descriptor
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"courseName" ascending:YES];
    
    request.sortDescriptors = @[sort];
    
    NSError *error = nil;
    
    return [context executeFetchRequest:request error:&error];
}

-(BOOL)kxnDeleteCourse:(Course*)course
{
    /// Get current context of app
    NSManagedObjectContext *context = [self getCurrentContext];
    
    [context deleteObject:course];
    
    NSError *error = nil;
    
    return [context save:&error];
}

-(BOOL)kxnUpdateCourse:(Course*)course andNewName:(NSString*)newName
{
    /// Get current context of app
    NSManagedObjectContext *context = [self getCurrentContext];
    
    [course setCourseName:newName];
    
//    [context deleteObject:course];
    
    NSError *error = nil;
    
    return [context save:&error];
}

#pragma mark - student method

-(BOOL)addStudentWithName:(NSString *)name andCourse:(Course*)course
{
    /// Get current context of app
    NSManagedObjectContext *context = [self getCurrentContext];
    
    /// Make insert request
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    
    student.studentName = name;
    
//    [courstuse addHasStudentObject:student];
    [student setInClass:course];
    
    NSError *error = nil;
    
    //    return [context save:&error];
    
    if([context save:&error])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL)kxnUpdateStudent:(Student*)student andNewName:(NSString*)newName
{
    /// Get current context of app
    NSManagedObjectContext *context = [self getCurrentContext];
    
    [student setStudentName:newName];
    
    //    [context deleteObject:course];
    
    NSError *error = nil;
    
    return [context save:&error];
}

-(BOOL)kxnDeleteStudent:(Student*)student
{
    /// Get current context of app
    NSManagedObjectContext *context = [self getCurrentContext];
    
    [context deleteObject:student];
    
    NSError *error = nil;
    
    return [context save:&error];
}
@end
