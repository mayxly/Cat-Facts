#import "ViewController.h"
#import "NetworkManager.h"
#import "FactViewController.h"
#import "CounterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.catTable.dataSource = self;
    self.catTable.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"https://catfact.ninja/facts"];

       [NetworkManager performGETRequestWithURL:url completionHandler:^(NSDictionary *responseDict, NSError *error) {
           if (error) {
               // Handle error
               NSLog(@"Error: %@", error.localizedDescription);
           } else {
               // Process the response data
//               NSLog(@"Response: %@", responseDict);
               NSArray *catArray = [responseDict valueForKey:@"data"];
               if (!self.catFacts) self.catFacts = [[NSMutableArray alloc] init];
               for (int i = 0; i < [catArray count]; i++) {
                   NSString *fact = [[catArray objectAtIndex: i] valueForKey:@"fact"];
//                   NSLog(@"FACT %i: %@", i, fact);
                   self.catFacts[i] = fact;
               }
               dispatch_async(dispatch_get_main_queue(), ^{
                   [self.catTable reloadData];
               });
           }
       }];

}

//API FACT TABLE

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catFacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
           cell = [[UITableViewCell alloc]
                   initWithStyle:UITableViewCellStyleDefault
                   reuseIdentifier: @"cell"];
       }
    UIColor *color1 = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:251.0/255.0 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:215.0/255.0 green:241.0/255.0 blue:234.0/255.0 alpha:1.0];
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = color1;
          
    } else {
        cell.backgroundColor = color2;
    }
    cell.textLabel.numberOfLines = 0; // Set the number of lines to 0 for unlimited lines
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; // Enable word wrapping
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li. %@", indexPath.row +1,self.catFacts[indexPath.row]];;
    return cell;
}


//SEGUES

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"TableToFact" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Make sure your segue name in storyboard is the same as this line
      if ([[segue identifier] isEqualToString:@"TableToFact"])
      {
          // Get reference to the destination view controller
          FactViewController *vc = [segue destinationViewController];
          [vc setFact:self.selectedFact];
          [vc setFactNum:self.factNum];
      }
      
//      else if ([[segue identifier] isEqualToString:@"HomeToCounter"]) {
//        // Get reference to the destination view controller
//        CounterViewController *vc = [segue destinationViewController];
//    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedFact = [self.catFacts objectAtIndex:indexPath.row];
    self.factNum = [NSString stringWithFormat:@"%li", indexPath.row+1];
    return indexPath;
}


@end
