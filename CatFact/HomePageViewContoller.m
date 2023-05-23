
#import "HomePageViewContoller.h"

@interface HomePageViewContoller ()

<UIPageViewControllerDataSource>

@end

@implementation HomePageViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
      
      // Set the data source
      self.dataSource = self;
      
      // Create and set the initial view controller
      UIViewController *initialViewController = [self viewControllerAtIndex:0];
      [self setViewControllers:@[initialViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    return self;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
        UIViewController *viewController = [[UIViewController alloc] init];
        return viewController;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    return viewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 1;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 1;
}

@end
