//
//  playingCardDeck.m
//  STFCards
//
//  Created by Tomer Harry on 9/3/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import "playingCardDeck.h"
#import "PlayingCard.h"


@implementation playingCardDeck

-(id)init
{
    self = [super init];
    if(self)
    {
        for (NSString* suite in [PlayingCard validSuite]) {
            for (NSUInteger rank=1; rank<[PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suite = suite;
                card.rank = rank;
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}
@end
