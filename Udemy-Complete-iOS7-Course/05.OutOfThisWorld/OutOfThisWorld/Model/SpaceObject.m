//
//  SpaceObject.m
//  OutOfThisWorld
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "SpaceObject.h"
#import "AstronomicalData.h"

@implementation SpaceObject

// Must always override super's designated initializer.
-(instancetype)init
{
    return [self initWithData:nil andImage:nil];
}

-(instancetype)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _data = data;
        _name = [data[PLANET_NAME] copy];
        _nickName = [data[PLANET_NICKNAME] copy];
        _image = image;
    }
    return self;
}

@end
