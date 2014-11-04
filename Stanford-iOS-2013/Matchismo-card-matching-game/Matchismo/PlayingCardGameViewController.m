//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/11/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()
@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (NSInteger)numberOfCardsToPlayWith
{
    if (!_numberOfCardsToPlayWith) _numberOfCardsToPlayWith = 2;
    return _numberOfCardsToPlayWith;
}

- (NSAttributedString *)statusForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:card.contents];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    NSMutableAttributedString *cardContents = [[NSMutableAttributedString alloc] initWithString:card.contents];
    NSMutableAttributedString *blank = [[NSMutableAttributedString alloc] initWithString:@""];
    return card.isChosen ? cardContents : blank;
}

@end
