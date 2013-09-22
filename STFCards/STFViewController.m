//
//  STFViewController.m
//  STFCards
//
//  Created by Tomer Harry on 9/2/13.
//  Copyright (c) 2013 Tomer Harry. All rights reserved.
//

#import "STFViewController.h"
#import "playingCardDeck.h"
#import "MatchingCardLogic.h"


@interface STFViewController ()
@property (weak, nonatomic) IBOutlet UILabel *FlipsLabel;
@property (nonatomic) NSUInteger flipsCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonsOutletArray;
@property (strong,nonatomic) MatchingCardLogic *logic;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation STFViewController



-(MatchingCardLogic *) logic
{
    if(_logic== nil) _logic = [[MatchingCardLogic alloc] initWithCardCount:self.buttonsOutletArray.count
                                                                         usingDeck:[[playingCardDeck alloc]init]];
    return _logic;

}


-(void) setButtonsOutletArray:(NSArray *)buttonsOutletArray
{
    _buttonsOutletArray = buttonsOutletArray;
    [self UpdateUI];
}

-(void)UpdateUI
{
    for (UIButton *button in self.buttonsOutletArray)
    {
        STFCard * card = [self.logic cardAtIndex:[self.buttonsOutletArray indexOfObject:button]];
        [button setTitle:card.contents forState:UIControlStateSelected];
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        button.selected = card.IsFaceUp;
        button.enabled = !card.IsUnPlayable;
        button.alpha =card.IsUnPlayable ? 0.3 :1;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d", self.logic.score];	
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)setFlipsCount:(NSUInteger)flipsCount
{
    _flipsCount = flipsCount;
    self.FlipsLabel.text = [NSString stringWithFormat:@"Flips: %d",flipsCount];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)flipCard:(UIButton *)sender
{
    [self.logic flipCardAtIndex:[self.buttonsOutletArray indexOfObject:sender]];
    self.flipsCount++;
     [self UpdateUI];}
@end
