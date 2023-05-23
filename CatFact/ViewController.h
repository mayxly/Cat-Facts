//
//  ViewController.h
//  CatFact
//
//  Created by TribalScale on 2023-05-17.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *catTable;
@property (strong, nonatomic) NSMutableArray *catFacts;
@property (strong, nonatomic) NSString *selectedFact;
@property (strong, nonatomic) NSString *factNum;

@end

