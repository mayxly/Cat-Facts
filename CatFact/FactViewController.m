//
//  FactViewController.m
//  CatFact
//
//  Created by TribalScale on 2023-05-23.
//

#import "FactViewController.h"


@interface FactViewController ()

@end

@implementation FactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = self.fact;
    self.factLabel.text = [NSString stringWithFormat:@"FACT #%@", self.factNum];
}
@end
