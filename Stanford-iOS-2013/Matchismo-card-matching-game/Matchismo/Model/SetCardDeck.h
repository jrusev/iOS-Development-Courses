//
//  SetCardDeck.h
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/20/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "Deck.h"

@interface SetCardDeck : Deck

- (instancetype)initWithColors:(NSArray *)colors
                       symbols:(NSArray *)symbols
                      shadings:(NSArray *)shadings;

@end
