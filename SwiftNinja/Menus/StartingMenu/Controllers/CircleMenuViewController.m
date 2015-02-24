
#import "CircleMenuViewController.h"
#import "PlayModeViewController.h"
#import "LeaderBoardTableViewController.h"

@implementation CircleMenuViewController


- (id)init
{
  if (self = [super init]) {
    [self setTitle:@"KYCircleMenu"];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];

  
  // Modify buttons' style in circle menu
  for (UIButton * button in [self.menu subviews]) {
    [button setAlpha:.95f];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - KYCircleMenu Button Action

// Run button action depend on their tags:
//
// TAG:        1       1   2      1   2     1   2     1 2 3     1 2 3
//            \|/       \|/        \|/       \|/       \|/       \|/
// COUNT: 1) --|--  2) --|--   3) --|--  4) --|--  5) --|--  6) --|--
//            /|\       /|\        /|\       /|\       /|\       /|\
// TAG:                             3       3   4     4   5     4 5 6
//
- (void)runButtonActions:(UIButton*)sender
{
  [super runButtonActions:sender];
    if([sender tag]==1){
        PlayModeViewController* vc= [[PlayModeViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    //If its the second button move on to the training menu
    if([sender tag]==2 ){
//        AwesomeMenuViewController* vc = [[AwesomeMenuViewController alloc] init];
//        [self pushViewController:vc];
    }
    if([sender tag]==3){
        LeaderBoardTableViewController* vc=[[LeaderBoardTableViewController alloc] init];
        [self pushViewController:vc];
    }
  
//  // Configure new view & push it with custom |pushViewController:| method
//  UIViewController * viewController = [[UIViewController alloc] init];
//  [viewController.view setBackgroundColor:[UIColor blackColor]];
//  [viewController setTitle:[NSString stringWithFormat:@"View %d", [sender tag]]];
//  // Use KYCircleMenu's |-pushViewController:| to push vc
//  [self pushViewController:viewController];
    
    
}

@end
