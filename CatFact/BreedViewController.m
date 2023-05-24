//
//  BreedViewController.m
//  CatFact
//
//  Created by TribalScale on 2023-05-24.
//

#import "BreedViewController.h"
#import "NetworkManager.h"
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
               
              NSLog(@"Response: %@", responseArray);
               for (int i = 0; i < [responseArray  count]; i++) {
                   NSLog(@"%@", [responseArray[i] objectForKey:@"name"]);
               }
           }
       }];
}


@end
