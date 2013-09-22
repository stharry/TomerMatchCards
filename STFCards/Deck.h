//
//  Deck.h
//  STFCards
//
//  Created by Tomer Harry on 9/2/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STFCard.h"


@interface Deck : NSObject

- (void)addCard :(STFCard *)card atTop:(BOOL)atTop;
- (STFCard *) drawRandomCard;

@end
