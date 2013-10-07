//
//  Attachment.h
//  DMUC
//
//  Created by Olivier Bonal on 10/7/13.
//  Copyright (c) 2013 Claire Milliet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface Attachment : NSManagedObject

@property (nonatomic, retain) NSNumber * attachmentId;
@property (nonatomic, retain) NSNumber * heightFull;
@property (nonatomic, retain) NSString * urlFull;
@property (nonatomic, retain) NSString * urlMedium;
@property (nonatomic, retain) NSString * urlThumbnail;
@property (nonatomic, retain) NSNumber * widthFull;
@property (nonatomic, retain) Post *post;

@end
