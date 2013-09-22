//
//  STFCard.m
//  STFCards
//
//  Created by Tomer Harry on 9/2/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import "STFCard.h"

@interface STFCard()
@end

@implementation STFCard

-(int)match:(NSArray *) otherCards
{
    int score = 0;
    for (STFCard *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score=1;
        }
    }
             return score;
    
}

@end
