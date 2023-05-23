
#import <UIKit/UIKit.h>


@interface FactViewController : UIViewController

@property (strong, nonatomic) NSString *fact;
@property (strong, nonatomic) NSString *factNum;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *factLabel;



@end
