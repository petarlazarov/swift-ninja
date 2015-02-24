
#import "SubmitScoreViewController.h"
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>
#import <AppWarp_iOS_SDK/AppWarp_iOS_SDK.h>
#import <Social/Social.h>

@interface SubmitScoreViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

#define APP42_APP_KEY     @"b60ae668d7fae3c784afa614ff60e222896786271ce372d7327badfceb8ba552"
#define APP42_SECRET_KEY  @"fa08e9d20b6c0ae509945f15964ddb3912ad292645002b8148dd008a79f6423a"


@end

@implementation SubmitScoreViewController

static const NSString* kNinjaBackground = @"submitPicNinja.jpg";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.backgroundImage.image = [UIImage imageNamed:kNinjaBackground];
    
    
}
- (IBAction)shareToFacebook:(id)sender {
    SLComposeViewController* fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Post successful");
                }
                    break;
            }};
        
        
        [fbController setInitialText:@"Check out this awesome game! I just got a new high score!"];
        
        
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sign in!" message:@"Please first Sign In!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submittingScoreButton:(id)sender {
    ServiceAPI *serviceAPIObject = [[ServiceAPI alloc]init];
    
    serviceAPIObject.apiKey = APP42_APP_KEY;
    serviceAPIObject.secretKey = APP42_SECRET_KEY;
    
    if (![self.nameTextField.text isEqualToString:@""]) {
        ScoreBoardService *scoreboardService = [serviceAPIObject buildScoreBoardService];
        
        [scoreboardService saveUserScore:@"Swift Ninja" gameUserName:self.nameTextField.text gameScore:self.currentHighScore];
        UIAlertView* submit = [[UIAlertView alloc] initWithTitle:@"Submit" message:@"You succesfuly submited the score" delegate:self cancelButtonTitle:@"Go back to menu" otherButtonTitles:nil, nil];
        [submit show];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.nameTextField resignFirstResponder];
}
//called when you click on the cancel button
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == [alertView cancelButtonIndex]) {
        [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
}


@end
