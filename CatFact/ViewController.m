#import "ViewController.h"
#import "NetworkManager.h"

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
               NSLog(@"Response: %@", responseDict);
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
