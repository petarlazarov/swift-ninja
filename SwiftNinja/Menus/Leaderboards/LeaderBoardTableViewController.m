#import "LeaderBoardTableViewController.h"
#import "DejalActivityView.h"

#define APP42_APP_KEY     @"b60ae668d7fae3c784afa614ff60e222896786271ce372d7327badfceb8ba552"
#define APP42_SECRET_KEY  @"fa08e9d20b6c0ae509945f15964ddb3912ad292645002b8148dd008a79f6423a"

@interface LeaderBoardTableViewController ()



@end

@implementation LeaderBoardTableViewController

const int kHeightForLeaderboardRow = 90;

ServiceAPI *serviceAPIObject;
ScoreBoardService *scoreboardService;
NSMutableArray *scoreList;
NSMutableString* jsonScoreList;

//DejalBezelActivityView* activityIndicatorView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    jsonScoreList = [[NSMutableString alloc] init];
    scoreList = [[NSMutableArray alloc] init];
    
    //removing separator lines
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //setting background image
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundapp.jpg"]];
    [tempImageView setFrame:self.tableView.frame];
    self.tableView.backgroundView = tempImageView;
    
    //making navigation bar transparent
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    scoreList = [[NSMutableArray alloc] init];
    [self showAcitvityIndicator];
    
    //server api initializing
    serviceAPIObject = [[ServiceAPI alloc]init];
    serviceAPIObject.apiKey = APP42_APP_KEY;
    serviceAPIObject.secretKey = APP42_SECRET_KEY;
    scoreboardService = [serviceAPIObject buildScoreBoardService];
    
    
    [self getScore];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [scoreList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:35];
     
        
    }
    NSLog(@"scoreList again=%@",scoreList);
    NSLog(@"%@", scoreList[indexPath.row]);
    NSError* mistake = nil;
    NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:[jsonScoreList dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&mistake];
    NSLog(@"json dict: %@", jsonDict);
    NSString* gameName = [jsonDict objectForKey:@"name"];
    NSLog(@"game name: %@", gameName);
    NSArray* list = [NSArray arrayWithArray:[self searchScoresInJSON:jsonDict]];
    NSLog(@"%@", list);
    NSDictionary* currentNameAndScore = list[indexPath.row];
    NSString* name = [currentNameAndScore objectForKey:@"userName"];
    CGFloat score = [[currentNameAndScore objectForKey:@"value"] floatValue];
    NSString* textForScore = [NSString stringWithFormat:@"%d. %@ - score - %0.0f", indexPath.row+1, name, score];
    cell.textLabel.text = textForScore;
    
    return cell;
}

- (NSArray*) searchScoresInJSON: (NSDictionary*) jsonDict {
    return [[[[[[jsonDict objectForKey:@"app42"] objectForKey:@"response"] objectForKey:@"games"] objectForKey:@"game"] objectForKey:@"scores"] objectForKey:@"score"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kHeightForLeaderboardRow;
}

-(void)showAcitvityIndicator {
    [DejalBezelActivityView activityViewForView:self.view];
}

-(void)removeAcitvityIndicator {
    [DejalBezelActivityView removeViewAnimated:YES];
}

-(void)getScore {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [scoreList removeAllObjects];
        Game *game=[scoreboardService getTopNRankers:@"Swift Ninja" max:30];
        scoreList = game.scoreList;
        jsonScoreList = [NSMutableString stringWithString:[game toString]];
        NSLog(@"json score: %@", jsonScoreList);
        NSLog(@"scoreList=%@",scoreList);

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView reloadData];
            [self removeAcitvityIndicator];
        });
    });
}


@end
