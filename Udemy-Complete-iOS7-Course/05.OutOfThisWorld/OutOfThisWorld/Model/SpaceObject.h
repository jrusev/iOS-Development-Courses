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
@property (copy, nonatomic) NSString *nickname;
@property (strong, nonatomic) UIImage *image;

@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *interestFact;

// Designated initializer.
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
