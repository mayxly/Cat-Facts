#import <UIKit/UIKit.h>



@interface CounterViewController : UIViewController



@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reset;
- (IBAction)resetValue:(id)sender;




@end 

