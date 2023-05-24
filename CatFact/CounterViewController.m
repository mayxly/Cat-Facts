//
//  CounterViewController.m
//  CatFact
//
//  Created by TribalScale on 2023-05-24.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@end

@implementation CounterViewController

- (void)viewDidLoad {
    self.label.text = @"0";
    [super viewDidLoad];
}

- (IBAction)clicked:(id)sender {
    int count = (int) self.stepper.value;
    self.label.text = [NSString stringWithFormat:@"%i ", count];
}

- (IBAction)resetValue:(id)sender {
    self.stepper.value = 0;
    self.label.text = @"0";
}
@end
