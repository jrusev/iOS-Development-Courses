//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/3/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "StatusHistoryViewController.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchModeControl;
@property (weak, nonatomic) IBOutlet UILabel *matchModeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic) NSInteger numberOfCardsToPlayWith;
@property (strong, nonatomic) Card *touchedCard;
@property (strong, nonatomic) NSMutableArray *statusHistory;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]
                                             numberOfCardsToPlayWith:self.numberOfCardsToPlayWith];
    return _game;
}

- (Deck *)createDeck  // abstract
{
    return nil;
}

- (NSMutableArray *)statusHistory
{
    if (!_statusHistory) _statusHistory = [[NSMutableArray alloc] init];
    return _statusHistory;
}

- (IBAction)chooseMatchMode:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 1) {
        // 3-card match mode
        self.numberOfCardsToPlayWith = 3;
        self.matchModeLabel.text = @"Match Mode: 3-Cards";
    } else {
        // 2-card match mode
        self.numberOfCardsToPlayWith = 2;
        self.matchModeLabel.text = @"Match Mode: 2-Cards";
    }
}

#pragma mark - redeal cards

- (IBAction)redealCardsAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Re-deal Cards?"
                                                    message:@"This will reset your current score."
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self redealCards];
    }
}

- (void)redealCards
{
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]
                                    numberOfCardsToPlayWith:self.numberOfCardsToPlayWith];
//    if (!self.matchModeControl.enabled) self.matchModeControl.enabled = YES;
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
//    if (self.matchModeControl.enabled) self.matchModeControl.enabled = NO;
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    self.touchedCard = [self.game cardAtIndex:chosenButtonIndex];
    [self updateUI];
}

# pragma mark - update UI

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [cardButton setAttributedTitle:[self titleForCard:card]
                              forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
//    self.statusLabel.text = self.game.status;
//    [self.statusLabel setAttributedText:self.game.status];

    self.statusLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.statusLabel.numberOfLines = 0;
    [self.statusLabel setAttributedText:[self statusForGame:self.touchedCard
                                         currentChosenCards:self.game.currentChosenCards
                                          currentMatchScore:self.game.matchScore]];
}

- (NSMutableAttributedString *)statusForGame:(Card *)touchedCard
                          currentChosenCards:(NSArray *)currentChosenCards
                           currentMatchScore:(NSInteger)currentMatchScore
{
    NSMutableAttributedString *statusForGame = [[NSMutableAttributedString alloc] init];
    if (touchedCard.chosen) {
        [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@"Picked "]];
        [statusForGame appendAttributedString:[self statusForCard:touchedCard]];
        if ([currentChosenCards count]) {
            [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@" to match with "]];
            
            int i = 0;
            for (Card *card in currentChosenCards) {
                i++;
                [statusForGame appendAttributedString:[self statusForCard:card]];
                if (i != [currentChosenCards count]) {
                    [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@" and "]];
                }
            }
            
            if (currentMatchScore < 0) {
                [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\nMismatch penalty: %d points", currentMatchScore]]];
            } else if (currentMatchScore > 0) {
                [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\nMatched! Scored: %d points", currentMatchScore]]];
            }
        }
    } else {
        [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@"Ready!"]];
    }
    [self.statusHistory addObject:statusForGame];
    return statusForGame;
}

- (NSAttributedString *)statusForCard:(Card *)card  // abstract
{
    return nil;
}

- (NSAttributedString *)titleForCard:card    // abstract
{
    return nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.chosen ? @"cardfront" : @"cardback"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PlayingCardHistory"] ||
        [segue.identifier isEqualToString:@"SetCardHistory"]
        ) {
        if ([segue.destinationViewController isKindOfClass:[StatusHistoryViewController class]]) {
            StatusHistoryViewController *playingCardHistoryVC = (StatusHistoryViewController *)segue.destinationViewController;
            playingCardHistoryVC.statusHistory = self.statusHistory;
        }
    }
}

@end
