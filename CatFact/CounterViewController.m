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
    [super viewDidLoad];
    //NSLog(@"%@", self.stepper.value);
    self.stepper.wraps = YES;

}


- (IBAction)valueDidChanged:(UIStepper *)sender {
//Whenever the stepper value increase and decrease the sender.value fetch the curent value of stepper
        NSUInteger value= sender.value;
        self.label.text= [NSString stringWithFormat:@"%02lu",value];
}





@end
