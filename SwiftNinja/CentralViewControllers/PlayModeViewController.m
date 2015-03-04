

#import "PlayModeViewController.h"
#import "AbstractLevelFactory.h"
#import "SubmitScoreViewController.h"

@interface PlayModeViewController ()

@property LevelLists* levelDelegate;
@property SKView* skView;
@property AbstractLevel* scene;


@end

@implementation PlayModeViewController

NSMutableArray* levelList;

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    if (!self.levelDelegate) {
        self.levelDelegate = [[LevelLists alloc] init];
        levelList = [NSMutableArray arrayWithArray:self.levelDelegate.levelList];
    }
    
    if (!self.scene) {
        NSInteger randomObjectIndex = arc4random_uniform([levelList count]);
        
        NSString* levelName = [levelList objectAtIndex:randomObjectIndex];
        [levelList removeObjectAtIndex:randomObjectIndex];
        
        self.scene = [AbstractLevelFactory sceneFactory:levelName];
        self.scene.scaleMode = SKSceneScaleModeFill;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(presentNewScene:)
                                                     name:@"DemandNewScene"
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(presentNewScene:)
                                                     name:@"EndGame"
                                                   object:nil];
        
    }

    if (!self.skView) {
        self.skView = [[SKView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.skView];
        self.skView.showsFPS=YES;
        [self.skView presentScene:self.scene];
    }
 
}

- (void) presentNewScene: (NSNotification*) notification {

    if ([[notification name] isEqualToString:@"DemandNewScene"]) {
        NSLog (@"Receive demand for new scene, levellist count: %d", [levelList count]);
        if ([levelList count]>0) {
            
            NSInteger randomObjectIndex = arc4random_uniform([levelList count]);
            NSString* levelName = [levelList objectAtIndex:randomObjectIndex];
            [levelList removeObjectAtIndex:randomObjectIndex];
            
            
            AbstractLevel* newScene = [AbstractLevelFactory sceneFactory:levelName];
            
           
            self.scene = nil;
            self.scene = newScene;
            
            self.skView.bounds = self.view.bounds;
            self.scene.size = self.skView.bounds.size;
            self.scene.currentScore=self.currentScore;
            [self.skView presentScene:self.scene transition:[SKTransition flipVerticalWithDuration:0.5]];
        }
        else {
            UIAlertView* highScore = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Well done! High Score : %.0f",self.currentScore] message:@"Do you want to submit the score?" delegate:self cancelButtonTitle:@"No ,thanks!" otherButtonTitles:@"Yes Submit!", nil];
            highScore.delegate = self;
            [highScore show];
            
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    }
    if ([[notification name] isEqualToString:@"EndGame"]) {
        NSLog(@"Receive end game demand");

        
        UIAlertView* highScore = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"High Score : %.0f",self.currentScore] message:@"Do you want to submit the high score?" delegate:self cancelButtonTitle:@"No ,thanks!" otherButtonTitles:@"Yes Submit!", nil];
        highScore.delegate = self;
        [highScore show];
        
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];

           }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        NSLog(@"CANCEL!");
        [self dismissViewControllerAnimated:YES completion:nil];

    }
    if(buttonIndex==1){
        NSLog(@"Submit!");
        SubmitScoreViewController* submit = [[SubmitScoreViewController alloc ] initWithNibName:nil bundle:nil];
        [self presentViewController:submit animated:YES completion:^{
            NSLog(@"Presenting the SubmitViewController");
            submit.currentHighScore = self.currentScore;
            
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
