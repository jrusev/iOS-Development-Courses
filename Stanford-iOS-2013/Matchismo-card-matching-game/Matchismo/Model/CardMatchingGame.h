//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/4/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger matchScore;
@property (strong, nonatomic) NSMutableArray *currentChosenCards;
@property (strong, nonatomic) Deck *deck;

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
          numberOfCardsToPlayWith:(NSInteger)numberOfCardsToPlayWith;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
