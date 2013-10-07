//
//  Post.h
//  DMUC
//
//  Created by Claire Milliet on 06/10/13.
//  Copyright (c) 2013 Claire Milliet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Post : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSNumber * postId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * urlPost;
@property (nonatomic, retain) NSManagedObject *attachment;
@property (nonatomic, retain) NSManagedObject *category;

@end
