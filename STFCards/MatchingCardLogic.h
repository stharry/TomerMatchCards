//
//  MatchingCardLogic.h
//  STFCards
//
//  Created by Tomer Harry on 9/12/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import "Deck.h"

@interface MatchingCardLogic : NSObject

@property (nonatomic,readonly) int score;
- (id)initWithCardCount:(NSUInteger) cardCount usingDeck:(Deck *)deck;
- (void)flipCardAtIndex:(NSUInteger) index;
- (STFCard *) cardAtIndex:(NSUInteger) index;
@end
