//
//  STFCard.h
//  STFCards
//
//  Created by Tomer Harry on 9/2/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STFCard : NSObject

@property (nonatomic,strong) NSString * contents;
@property (nonatomic,getter= IsFaceUp) BOOL IsFaceUp;
@property (nonatomic,getter= IsUnPlayable) BOOL IsUnPlayable;

-(int)match:(NSArray *) otherCards;

@end
