//
//  PlayingCard.m
//  STFCards
//
//  Created by Tomer Harry on 9/3/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suite = _suite;


+(NSArray *)ranks
{
    NSArray * rankArray = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return rankArray;
}

+(NSArray *)validSuite
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+(NSUInteger)maxRank
{
    return[self ranks].count-1;
}

-(NSString *)contents
{
    return [[PlayingCard ranks][self.rank] stringByAppendingString:self.suite];
}

-(NSString *)suite
{
    return _suite ? _suite:@"?";
}


-(void)setSuite:(NSString *) mysuite
{
    if ([[PlayingCard validSuite] containsObject:mysuite]) {
        _suite = mysuite;
    }
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard  maxRank]) {
        _rank=rank;
    }
}

-(int)match:(NSArray *)otherCards
{
    int score =0;
    if(otherCards.count==1)
    {
        PlayingCard * card = [otherCards lastObject];
        if(card.rank == self.rank)
            score=4;
        else if ([card.suite isEqualToString:self.suite])
            score=1;
    }
    return score;
}
@end
