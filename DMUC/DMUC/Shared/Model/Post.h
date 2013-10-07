//
//  Post.h
//  DMUC
//
//  Created by Olivier Bonal on 10/7/13.
//  Copyright (c) 2013 Claire Milliet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Attachment, PostCategory;

@interface Post : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSNumber * postId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * urlPost;
@property (nonatomic, retain) Attachment *attachment;
@property (nonatomic, retain) PostCategory *category;

@end
