
#import <UIKit/UIKit.h>


@interface FactViewController : UIViewController<UITextViewDelegate>

@property (strong, nonatomic) NSString *fact;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
