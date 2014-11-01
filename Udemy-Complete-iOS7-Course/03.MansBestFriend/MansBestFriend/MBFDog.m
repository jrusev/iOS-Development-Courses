//
//  MBFDog.m
//  MansBestFriend
//
//  Created by JR on 11/1/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MBFDog.h"

@implementation MBFDog

+ (instancetype)dogWithName:(NSString *)name
                       breed:(NSString *)breed
                       image:(UIImage *)image {
    return [[self alloc] initWithName:name breed:breed andImage:image];
}

- (instancetype)initWithName:(NSString *)name
                       breed:(NSString *)breed
                    andImage:(UIImage *)image {
    self = [super init];
    if (self) {
        _name = [name copy];
        _breed = [breed copy];
        _image = image;
    }
    return self;
}

@end
