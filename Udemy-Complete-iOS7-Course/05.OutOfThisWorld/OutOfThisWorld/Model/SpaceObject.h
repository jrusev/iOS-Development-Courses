//
//  SpaceObject.h
//  OutOfThisWorld
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpaceObject : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) UIImage *image;

// Designated initializer.
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
