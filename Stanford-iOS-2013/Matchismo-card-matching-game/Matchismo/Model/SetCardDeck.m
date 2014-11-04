//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/20/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)initWithColors:(NSArray *)colors
                       symbols:(NSArray *)symbols
                       shadings:(NSArray *)shadings
{
    self = [super init];
    if (self) {
        
        int cardNr = 1;
        
        for (NSNumber *color in colors) {
            for (NSNumber *symbol in symbols) {
                for (NSNumber *shading in shadings) {
                    for (int i = 0; i <= 2; i++) {
                        SetCard *setCard = [[SetCard alloc] init];
                        setCard.color = [color integerValue];
                        setCard.symbol = [symbol integerValue];
                        setCard.shading = [shading integerValue];
                        setCard.number = i;
                        
                        NSLog(@"%d. %d%d%d%d", cardNr, setCard.color, setCard.symbol, setCard.shading, i);
                        cardNr++;
                        
                        [self addCard:setCard];
                    }
                }
            }
        }
    }
    return self;
}

@end
