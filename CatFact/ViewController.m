#import "ViewController.h"
#import "NetworkManager.h"

@interface ViewController ()
@property NSArray *catFacts;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.catTable.dataSource = self;
    self.catTable.delegate = self;
    self.catFacts =
            @[@"People who are allergic to cats are actually allergic to cat saliva or to cat dander. If the resident cat is bathed regularly the allergic people tolerate it better.",
              @"A steady diet of dog food may cause blindness in your cat - it lacks taurine.",
              @"A cat will tremble or shiver when it is in extreme pain.",
              @"The first cat show was in 1871 at the Crystal Palace in London.",
              @"Cats and kittens should be acquired in pairs whenever possible as cat families interact best in pairs.",
              @"Cats have 300 million neurons; dogs have about 160 million",
              @"Cats should not be fed tuna exclusively, as it lacks taurine, an essential nutrient required for good feline health.  Make sure you have the proper Pet supplies to keep your cat happy and healthy."];
//   NSURL *url = [NSURL URLWithString:@"https://catfact.ninja/fact"];
//
//    [NetworkManager performGETRequestWithURL:url completionHandler:^(NSDictionary *responseDict, NSError *error) {
//        if (error) {
//            // Handle error
//            NSLog(@"Error: %@", error.localizedDescription);
//        } else {
//            // Process the response data
//            //THIS IS WORKING!
//            NSLog(@"Response: %@", responseDict);
//            self.fact = [responseDict objectForKey:@"fact"];
//            NSLog(@"Fact: %@", self.fact);
//        }
//    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catFacts count];

   // return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
           cell = [[UITableViewCell alloc]
                   initWithStyle:UITableViewCellStyleDefault
                   reuseIdentifier: @"cell"];
       }
       
   
    //cell.textLabel.text = self.fact;
    NSArray *cellColors = @[@"F28044", @"F0A761", @"FEC362", @"F0BB4C", @"E3CB92", @"FEA375"];
  //  GroupTableViewCell *customCell = (GroupTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger randomColorIndex = arc4random_uniform((uint32_t)cellColors.count);
    NSString *randomColorString = cellColors[randomColorIndex];
    //UIColor *randomColor = [UIColor colorWithHexString:randomColorString];
    
   // cell.contentView.backgroundColor = randomColor;
    UIColor *color1 = [UIColor colorWithRed:193.0/255.0 green:217.0/255.0 blue:202.0/255.0 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:230.0/255.0 green:245.0/255.0 blue:235.0/255.0 alpha:1.0];

       if (indexPath.row % 2 == 0) {
           cell.backgroundColor = color1;
          
       } else {
           cell.backgroundColor = color2;
           
       }
    
    cell.textLabel.numberOfLines = 0; // Set the number of lines to 0 for unlimited lines
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; // Enable word wrapping
    cell.textLabel.text = self.catFacts[indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}




@end
