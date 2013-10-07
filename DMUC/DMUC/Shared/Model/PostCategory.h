//
//  PostCategory.h
//  DMUC
//
//  Created by Olivier Bonal on 10/7/13.
//  Copyright (c) 2013 Claire Milliet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface PostCategory : NSManagedObject

@property (nonatomic, retain) NSNumber * categoryId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *posts;
@end

@interface PostCategory (CoreDataGeneratedAccessors)

- (void)addPostsObject:(Post *)value;
- (void)removePostsObject:(Post *)value;
- (void)addPosts:(NSSet *)values;
- (void)removePosts:(NSSet *)values;

@end
