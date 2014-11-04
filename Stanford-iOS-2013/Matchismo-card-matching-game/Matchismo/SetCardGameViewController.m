//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/20/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardGameViewController ()
@end

@implementation SetCardGameViewController

- (NSInteger)numberOfCardsToPlayWith
{
    if (!_numberOfCardsToPlayWith) _numberOfCardsToPlayWith = 3;
    return _numberOfCardsToPlayWith;
}

- (Deck *)createDeck
{    
    return [[SetCardDeck alloc] initWithColors:@[@(MatchismoSetColorRed), @(MatchismoSetColorGreen), @(MatchismoSetColorPurple)]
                                       symbols:@[@(MatchismoSetSymbolCircle), @(MatchismoSetSymbolSquare), @(MatchismoSetSymbolTriangle)]
                                      shadings:@[@(MatchismoSetShadingOpen), @(MatchismoSetShadingShaded), @(MatchismoSetShadingSolid)]];
}

- (NSAttributedString *)statusForCard:(Card *)card
{
    NSAttributedString *contents = [[NSAttributedString alloc] initWithString:[self symbolForSetCardContent:card symbolSeparator:@""]
                                                                   attributes:@{NSStrokeColorAttributeName: [self colorForSetCardContent:card],
                                                                                NSStrokeWidthAttributeName: [self shadingSrokeWidthForSetCardContent:card],
                                                                                NSForegroundColorAttributeName: [self shadingForegroundColorForSetCardContent:card]}];
    return contents;
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    NSAttributedString *contents = [[NSAttributedString alloc] initWithString:[self symbolForSetCardContent:card symbolSeparator:@"\n"]
                                                                                 attributes:@{NSStrokeColorAttributeName: [self colorForSetCardContent:card],
                                                                                              NSStrokeWidthAttributeName: [self shadingSrokeWidthForSetCardContent:card],
                                                                                              NSForegroundColorAttributeName: [self shadingForegroundColorForSetCardContent:card]}];
    return contents;
}

- (NSString *)symbolForSetCardContent:(Card *)card symbolSeparator:(NSString *)symbolSeparator
{
    SetCard *setCard = (SetCard *)card;
    
    NSString *symbol;
    switch (setCard.symbol) {
        case MatchismoSetSymbolCircle:
            symbol = @"●";
            break;
        case MatchismoSetSymbolSquare:
            symbol = @"■";
            break;
        case MatchismoSetSymbolTriangle:
            symbol = @"▲";
            break;
    }
    
    NSMutableArray *symbols = [[NSMutableArray alloc] init];
    for (int i = 0; i<=setCard.number; i++) {
        [symbols addObject:symbol];
    }
    NSString *symbolForSetCard = [symbols componentsJoinedByString:symbolSeparator];
    return symbolForSetCard;
}
- (NSNumber *)shadingSrokeWidthForSetCardContent:(Card *)card
{
    NSNumber *setCardShading;
    SetCard *setCard = (SetCard *)card;
    
    switch (setCard.shading) {
        case MatchismoSetShadingOpen:
            setCardShading = @10;
            break;
        case MatchismoSetShadingSolid:
            setCardShading = @-10;
            break;
        case MatchismoSetShadingShaded:
            setCardShading = @-10;
            break;
    }
    return setCardShading;
}
- (UIColor *)shadingForegroundColorForSetCardContent:(Card *)card
{
    UIColor *setCardShadingForegroundColor;
    SetCard *setCard = (SetCard *)card;
    
    if (setCard.shading == MatchismoSetShadingShaded) {
        switch (setCard.color) {
            case MatchismoSetColorRed:
                setCardShadingForegroundColor = [[UIColor alloc] initWithRed:255 green:0 blue:0 alpha:0.33];
                break;
            case MatchismoSetColorGreen:
                setCardShadingForegroundColor = [[UIColor alloc] initWithRed:0 green:255 blue:0 alpha:0.33];
                break;
            case MatchismoSetColorPurple:
                setCardShadingForegroundColor = [[UIColor alloc] initWithRed:0.4 green:0 blue:0.4 alpha:0.33];
                break;
        }
    } else {
        setCardShadingForegroundColor = [self colorForSetCardContent:card];
    }
    return setCardShadingForegroundColor;
}
- (UIColor *)colorForSetCardContent:(Card *)card
{
    UIColor *setCardContentColor;
    SetCard *setCard = (SetCard *)card;
    
    switch (setCard.color) {
        case MatchismoSetColorRed:
            setCardContentColor = [UIColor redColor];
            break;
        case MatchismoSetColorGreen:
            setCardContentColor = [UIColor greenColor];
            break;
        case MatchismoSetColorPurple:
            setCardContentColor = [UIColor purpleColor];
            break;
    }
    return setCardContentColor;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.chosen ? @"setcardselected" : @"cardfront"];
}

@end
