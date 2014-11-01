//
//  MBFDog.h
//  MansBestFriend
//
//  Created by JR on 11/1/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MBFDog : NSObject

+ (instancetype)dogWithName:(NSString *)name
                       breed:(NSString *)breed
                       image:(UIImage *)image;

- (instancetype)initWithName:(NSString *)name
                         breed:(NSString *)breed
                      andImage:(UIImage *)image;


@property (nonatomic) int age;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *breed;
@property (nonatomic, strong) UIImage *image;

@end
