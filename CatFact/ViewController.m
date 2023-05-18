#import "ViewController.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catTable.dataSource = self;
    self.catTable.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"https://catfact.ninja/fact"];

    [NetworkManager performGETRequestWithURL:url completionHandler:^(NSDictionary *responseDict, NSError *error) {
        if (error) {
            // Handle error
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            // Process the response data
            //THIS IS WORKING!
            NSLog(@"Response: %@", responseDict);
            self.fact = [responseDict objectForKey:@"fact"];
            NSLog(@"Fact: %@", self.fact);
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //Assigning self.fact does not reload the table to update the text
    cell.textLabel.text = self.fact;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
