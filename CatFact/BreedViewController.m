//
//  BreedViewController.m
//  CatFact
//
//  Created by TribalScale on 2023-05-24.
//

#import "BreedViewController.h"
#import "NetworkManager.h"
#include <stdlib.h>

@interface BreedViewController ()

@end

@implementation BreedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://api.thecatapi.com/v1/breeds"];

       [NetworkManager performGETRequestArray:url completionHandler:^(NSArray *responseArray, NSError *error) {
           if (error) {
               // Handle error
               NSLog(@"Error: %@", error.localizedDescription);
           } else {
               // Process the response data
               self.catArray = responseArray;
               NSLog(@"Response: %@", self.catArray);
           }
       }];
}

- (IBAction)generate:(id)sender {
    int r = arc4random_uniform(66);
    [self.generate setTitle:@"NOT THIS CAT!" forState:UIControlStateNormal];
    self.breed.text = [self.catArray[r] objectForKey:@"name"];
    self.info.text = [self.catArray[r] objectForKey:@"description"];
}

@end
