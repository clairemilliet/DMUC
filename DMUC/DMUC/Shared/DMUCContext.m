//
//  DMUCContext.m
//  DMUC
//
//  Created by Claire Milliet on 06/10/13.
//  Copyright (c) 2013 Claire Milliet. All rights reserved.
//

#import "DMUCContext.h"

@implementation DMUCContext

@synthesize appDelegateShared=_appDelegateShared;
@synthesize managedObjectContext=_managedObjectContext;

static DMUCContext *	sharedDMUCContext = nil;

#pragma mark -
#pragma mark Init

+ (DMUCContext *)sharedDMUCContext {
	if (sharedDMUCContext == nil) {
		sharedDMUCContext = [[DMUCContext alloc] init];
	}
	return sharedDMUCContext;
}

- init {
    MyLog(@"");
    
	if (self = [super init]) {
    }
	return self;
}


#pragma mark -
#pragma mark Download categories

- (void)beginInitialDownloadCategories {
	MyLog(@"");
    MyLog(@"%@", _managedObjectContext);
    
    
    NSFetchRequest *requestPost = [[NSFetchRequest alloc] init];
	NSEntityDescription *entityPostCategory = [NSEntityDescription entityForName:@"PostCategory" inManagedObjectContext:_managedObjectContext];
	[requestPost setEntity:entityPostCategory];
    
    NSError *error = nil;
    int nbCategories = [_managedObjectContext countForFetchRequest:requestPost error:&error] ;
    
    nbCategoriesLocal = nbCategories ? [NSNumber numberWithInt:nbCategories] : nil;
    
    MyLog(@"nbCategoriesLocal %@", nbCategoriesLocal);
    
    [self generateCategories];
    
    
}

-(void) generateCategories  {
	
	MyLog(@"");
	
	// Synchronous HTTP request
	NSURL * url;
    
	url=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/?json=get_category_index&dev=1", kUrl]];
	
	MyLog(@"URL : %@", [url absoluteString]);
	
	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
	
	NSURLResponse *theResponse;
	NSData *  receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:nil];
	
	if (receivedData != nil) {
        
        [self parseJsonResponseCategories:receivedData];
	}
}

-(void)parseJsonResponseCategories:(NSData *) data {
	
	MyLog(@"");
    
    NSError *error;
    NSDictionary *jsonRootObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
	if (jsonRootObject == nil || [jsonRootObject isKindOfClass:[NSDictionary class]] == NO) {
		return;
	}
    
        NSMutableArray * allCategoriesArray = [jsonRootObject valueForKey:@"categories"];
    
        if (allCategoriesArray != nil && [allCategoriesArray isKindOfClass:[NSArray class]]) {
            
            for(NSMutableDictionary * lCategory in allCategoriesArray) {
                
                PostCategory * postCategory = (PostCategory *)[NSEntityDescription insertNewObjectForEntityForName:@"PostCategory" inManagedObjectContext:_managedObjectContext];
                [postCategory setCategoryId:[lCategory valueForKey:@"id"]];
                [postCategory setTitle:[lCategory valueForKey:@"title"]];
                
                // Commit the change.
                [self saveContext];
            }
    
        }
}

#pragma mark -
#pragma mark Utilities
- (void)saveContext {
    
    MyLog(@"");
    
    NSError *error = nil;
    if (_managedObjectContext != nil) {
        if ([_managedObjectContext hasChanges] && ![_managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


- (void)logDataBase {
	
    NSFetchRequest *requestCategory = [[NSFetchRequest alloc] init];
	NSEntityDescription *entityCategory = [NSEntityDescription entityForName:@"PostCategory" inManagedObjectContext:_managedObjectContext];
	[requestCategory setEntity:entityCategory];
    
	// Execute the fetch -- create a mutable copy of the result.
	NSError* error = nil;
	NSMutableArray *mutableFetchResultsCategory = [[_managedObjectContext executeFetchRequest:requestCategory error:&error] mutableCopy];
	if (mutableFetchResultsCategory == nil) {
		// Handle the error.
	}
	
	MyLog(@"--------------------------");
    
	MyLog(@"Category ID, TITLE ");
	
	for(PostCategory * lcat in mutableFetchResultsCategory) {
		
		MyLog(@"  (%@)   , %@  ", lcat.categoryId, lcat.title);
		
	}
}

@end
