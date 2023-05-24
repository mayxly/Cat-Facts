#import <UIKit/UIKit.h>



@interface CounterViewController : UIViewController

@property NSInteger *catCount;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;

@end

