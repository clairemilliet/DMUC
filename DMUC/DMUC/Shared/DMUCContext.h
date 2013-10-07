//
//  DMUCContext.h
//  DMUC
//
//  Created by Claire Milliet on 06/10/13.
//  Copyright (c) 2013 Claire Milliet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PostCategory.h"
@class AppDelegate;


@interface DMUCContext : NSObject <NSFetchedResultsControllerDelegate> {
    
    AppDelegate *                   appDelegateShared;
    NSManagedObjectContext *        managedObjectContext;
    
    NSNumber *                      nbCategoriesLocal; 
}

@property (nonatomic, strong) AppDelegate * appDelegateShared;
@property (nonatomic, strong) NSManagedObjectContext * managedObjectContext;


+ (DMUCContext *) sharedDMUCContext;
- (void)saveContext;
- (void)beginInitialDownloadCategories;
- (void)logDataBase;

@end
