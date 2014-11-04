//
//  SetCard.h
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/20/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

typedef NS_ENUM(NSUInteger, MatchismoSetColor) {
    MatchismoSetColorRed,
    MatchismoSetColorGreen,
    MatchismoSetColorPurple
};

typedef NS_ENUM(NSUInteger, MatchismoSetSymbol) {
    MatchismoSetSymbolCircle,
    MatchismoSetSymbolTriangle,
    MatchismoSetSymbolSquare
};

typedef NS_ENUM(NSUInteger, MatchismoSetShading) {
    MatchismoSetShadingSolid,
    MatchismoSetShadingOpen,
    MatchismoSetShadingShaded
};

@property (nonatomic) MatchismoSetColor color;
@property (nonatomic) MatchismoSetSymbol symbol;
@property (nonatomic) NSUInteger number;
@property (nonatomic) MatchismoSetShading shading;

@end
