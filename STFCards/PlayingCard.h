//
//  PlayingCard.h
//  STFCards
//
//  Created by Tomer Harry on 9/3/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import "STFCard.h"

@interface PlayingCard : STFCard
@property  (nonatomic,strong) NSString *suite;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuite;
+(NSUInteger)maxRank;

@end
