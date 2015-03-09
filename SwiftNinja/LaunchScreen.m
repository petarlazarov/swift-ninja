#import "LaunchScreen.h"
#import "CentralViewController.h"

@implementation LaunchScreen


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load images
    NSArray *imageNames = @[@"1.tiff", @"2.tiff", @"3.tiff", @"4.tiff",
                            @"5.tiff", @"6.tiff", @"7.tiff", @"8.tiff",
                            @"9.tiff", @"10.tiff", @"11.tiff", @"12.tiff",
                            @"13.tiff", @"14.tiff", @"15.tiff", @"16.tiff",
                            @"17.tiff", @"18.tiff", @"19.tiff", @"20.tiff",
                            @"21.tiff", @"22.tiff", @"23.tiff", @"24.tiff",
                            @"25.tiff", @"26.tiff"];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.2, self.view.frame.size.height*0.02, self.view.frame.size.width*0.55, self.view.frame.size.height*0.89)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 2.6;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    
    NSArray *pressImage = @[@"001.jpg", @"002.jpg", @"003.jpg", @"004.jpg",
                            @"005.jpg", @"006.jpg", @"007.jpg", @"008.jpg",
                            @"009.jpg", @"010.jpg", @"011.jpg", @"012.jpg",
                            @"013.jpg", @"014.jpg", @"015.jpg", @"016.jpg",
                            @"017.jpg", @"019.jpg", @"020.jpg", @"021.jpg",
                            @"022.jpg", @"021.jpg", @"020.jpg", @"019.jpg",
                            @"017.jpg", @"016.jpg", @"015.jpg", @"014.jpg",
                            @"013.jpg", @"012.jpg", @"011.jpg", @"010.jpg",
                            @"009.jpg", @"008.jpg", @"007.jpg", @"006.jpg",
                            @"005.jpg", @"004.jpg", @"003.jpg", @"002.jpg"];
    NSMutableArray *image = [[NSMutableArray alloc] init];
    for (int i = 0; i < pressImage.count; i++) {
        [image addObject:[UIImage imageNamed:[pressImage objectAtIndex:i]]];
    }
    
    UIImageView *animationImageViews = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.34, self.view.frame.size.height*0.85, self.view.frame.size.width*0.25, self.view.frame.size.height*0.09)];
    animationImageViews.animationImages = image;
    animationImageViews.animationDuration = 2.6;
    
    [self.view addSubview:animationImageViews];
    [animationImageViews startAnimating];
    animationImageViews.animationRepeatCount=0;
    [self performSelector:@selector(animationFinished) withObject:nil afterDelay:2.6];
   
   
   
    
    
}


-(void)animationFinished {
     [self performSegueWithIdentifier:@"yay" sender:self];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self performSegueWithIdentifier:@"yay" sender:self];
}



@end

