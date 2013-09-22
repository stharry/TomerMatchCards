//
//  MatchingCardLogic.m
//  STFCards
//
//  Created by Tomer Harry on 9/12/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import "MatchingCardLogic.h"

#define Match_Bon 4
#define Miss_Penalty 2
#define Flip_Cost 1

@interface MatchingCardLogic()
@property (strong,nonatomic)NSMutableArray * stfCards;
@property  (nonatomic,readwrite) int score;
@end

@implementation MatchingCardLogic


-(NSMutableArray *) stfCards
{
    if(!_stfCards) _stfCards = [[NSMutableArray alloc] init];
    return _stfCards;
}

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    if(self)
    {
        for (int i=0; i < cardCount; i++) {
            STFCard * card = [deck drawRandomCard];
            if(!card)self=nil;
            else self.stfCards[i]=card;
        }
    }
    return self;
}

-(STFCard *) cardAtIndex:(NSUInteger)index
{
    if(index<self.stfCards.count)return self.stfCards[index];
    else return nil;
    
}
- (void)flipCardAtIndex:(NSUInteger)index
{
    STFCard * card = [self cardAtIndex:index];
    if(!card.IsUnPlayable)
    {
        if(!card.IsFaceUp)
        {
            for (STFCard * otherCard in self.stfCards)
            {
                if (otherCard.IsFaceUp && (!otherCard.IsUnPlayable)) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore)
                    {
                        otherCard.IsUnPlayable = YES;
                        card.IsUnPlayable = YES;
                        self.score += matchScore * Match_Bon;
                    }
                    else
                    {
                        otherCard.IsFaceUp = NO;
                        self.score -= Miss_Penalty;
                    }
                }
            }
            self.score -= Flip_Cost;
        }
        card.IsFaceUp = !card.IsFaceUp;
    }
    
}

@end
