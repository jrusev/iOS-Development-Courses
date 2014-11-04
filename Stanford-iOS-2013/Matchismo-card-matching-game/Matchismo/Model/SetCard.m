//
//  SetCard.m
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/20/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (NSAttributedString *)contents
{
    NSAttributedString *foobar = [[NSAttributedString alloc] initWithString:@"xxx"];
    return foobar;
}

- (int)match:(NSArray *)otherCards
{
    int score;
  
    NSMutableArray *colors = [[NSMutableArray alloc] initWithObjects:@(self.color), nil];
    NSMutableArray *shadings = [[NSMutableArray alloc] initWithObjects:@(self.shading), nil];
    NSMutableArray *numbers = [[NSMutableArray alloc] initWithObjects:@(self.number), nil];
    NSMutableArray *symbols = [[NSMutableArray alloc] initWithObjects:@(self.symbol), nil];
    
    for (SetCard *setCard in otherCards) {
        [colors addObject:@(setCard.color)];
        [shadings addObject:@(setCard.shading)];
        [numbers addObject:@(setCard.number)];
        [symbols addObject:@(setCard.symbol)];
    }
    
    NSSet *colorSet = [[NSSet alloc] initWithArray:colors];
    NSSet *shadingSet = [[NSSet alloc] initWithArray:shadings];
    NSSet *numberSet = [[NSSet alloc] initWithArray:numbers];
    NSSet *symbolSet = [[NSSet alloc] initWithArray:symbols];
    

    // Set count must be either:
    //      1 (all match - single content element), or
    //      3 (no match - all different content elements)
    if (([colorSet count]==2) ||
        ([shadingSet count]==2) ||
        ([numberSet count]==2) ||
        ([symbolSet count]==2)) {
        score = 0;
    } else {
        score = 10;
    }
    
    return score;
}



@end
