//
//  PostCategory.h
//  DMUC
//
//  Created by Claire Milliet on 06/10/13.
//  Copyright (c) 2013 Claire Milliet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PostCategory : NSManagedObject

@property (nonatomic, retain) NSNumber * categoryId;
@property (nonatomic, retain) NSString * title;

@end
