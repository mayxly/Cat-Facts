#import "ViewController.h"
#import "NetworkManager.h"

@interface ViewController ()
@property NSArray *catFacts;

@property NSString *fact;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.catTable.dataSource = self;
    self.catTable.delegate = self;
//    self.catFacts =
//            @[@"People who are allergic to cats are actually allergic to cat saliva or to cat dander. If the resident cat is bathed regularly the allergic people tolerate it better.",
//              @"A steady diet of dog food may cause blindness in your cat - it lacks taurine.",
//              @"A cat will tremble or shiver when it is in extreme pain.",
//              @"The first cat show was in 1871 at the Crystal Palace in London.",
//              @"Cats and kittens should be acquired in pairs whenever possible as cat families interact best in pairs.",
//              @"Cats have 300 million neurons; dogs have about 160 million",
//              @"Cats should not be fed tuna exclusively, as it lacks taurine, an essential nutrient required for good feline health.  Make sure you have the proper Pet supplies to keep your cat happy and healthy."];
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
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.catTable reloadData];
            });
        }
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.catFacts count];
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //Assigning self.fact does not reload the table to update the text
    if (cell == nil) {
           cell = [[UITableViewCell alloc]
                   initWithStyle:UITableViewCellStyleDefault
                   reuseIdentifier: @"cell"];
       }
       
   
    cell.textLabel.text = self.fact;

    cell.textLabel.numberOfLines = 0; // Set the number of lines to 0 for unlimited lines
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; // Enable word wrapping
    
    
//    cell.textLabel.text = self.catFacts[indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"cat.png"];
//    cell.imageView.frame = CGRectMake(1, 1, 3, 3);
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    cell.layoutIfNeeded();

//    [cell.contentView addSubview:imv];
//    [imv release];
    return cell;
//    UIImageView *imageView = cell.imageView;
//        CGRect frame = imageView.frame;
//        frame.size = CGSizeMake(1, 1); // Set the desired width and height
//        imageView.frame = frame;
//        // Set the image
//        UIImage *image = [UIImage imageNamed:@"cat.jpeg"];
//        imageView.image = image;
//        return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
