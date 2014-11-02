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

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _name = [data[PLANET_NAME] copy];
        _nickname = [data[PLANET_NICKNAME] copy];
        _gravitationalForce = [data[PLANET_GRAVITY] floatValue];
        _diameter = [data[PLANET_DIAMETER] floatValue];
        _yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
        _dayLength = [data[PLANET_DAY_LENGTH] floatValue];
        _temperature = [data[PLANET_TEMPERATURE] floatValue];
        _numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];

        _interestFact = data[PLANET_INTERESTING_FACT];
        _image = image;
    }
    return self;
}

@end
