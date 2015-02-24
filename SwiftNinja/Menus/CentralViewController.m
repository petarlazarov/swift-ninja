
#import "CentralViewController.h"
#import "CircleMenuViewController.h"

@interface CentralViewController ()
@property(readwrite) UIViewController* mainGameMenuViewController;

@end

@implementation CentralViewController

const NSInteger kKYCCircleMenuButtonsCount =3;
const CGFloat kKYCircleMenuSize=400;
const CGFloat kKYCircleMenuButtonSize=85;
const NSString* kKYICircleMenuButtonImageNameFormat=@"ButtonIcon%.2d.png";
const CGFloat kKYCircleMenuCenterButtonSize=85;
const NSString* kKYICircleMenuCenterButton=@"KYICircleMenuCenterButton.png";
const NSString* kKYICircleMenuCenterButtonBackground=@"KYICircleMenuCenterButtonBackground.png";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    self.mainGameMenuViewController = [[CircleMenuViewController alloc] initWithButtonCount:kKYCCircleMenuButtonsCount
                                                                                   menuSize:kKYCircleMenuSize
                                                                                 buttonSize:kKYCircleMenuButtonSize
                                                                      buttonImageNameFormat:kKYICircleMenuButtonImageNameFormat
                                                                           centerButtonSize:kKYCircleMenuCenterButtonSize
                                                                      centerButtonImageName:kKYICircleMenuCenterButton
                                                            centerButtonBackgroundImageName:kKYICircleMenuCenterButtonBackground];
    
    UIScreen* mainscreen = [UIScreen mainScreen];
    self.mainGameMenuViewController.view.bounds = mainscreen.bounds;
    
    [self.navigationController pushViewController:self.mainGameMenuViewController animated:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
