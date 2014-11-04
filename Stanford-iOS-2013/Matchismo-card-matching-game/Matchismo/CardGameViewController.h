//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/3/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//
//  Abstract class. Must implement mentods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController <UIAlertViewDelegate>

// protected
// for subclasses
- (Deck *)createDeck;  // abstract
- (NSAttributedString *)statusForCard:(Card *)card;  // abstract
- (NSAttributedString *)titleForCard:card;    // abstract

@end
