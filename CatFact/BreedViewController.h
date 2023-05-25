

#import <UIKit/UIKit.h>


@interface BreedViewController : UIViewController


@property NSArray *catArray;


@property (weak, nonatomic) IBOutlet UILabel *breed;
@property (weak, nonatomic) IBOutlet UITextView *info;
@property (weak, nonatomic) IBOutlet UIButton *generate;

- (IBAction)generate:(id)sender;


@end

