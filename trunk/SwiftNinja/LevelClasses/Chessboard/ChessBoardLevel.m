
#import "ChessBoardLevel.h"

@interface ChessBoardLevel ()

@property NSMutableArray* chessField;
@property SKSpriteNode* knightNode;

@property CGFloat positionX;
@property CGFloat positionY;

@end

@implementation ChessBoardLevel

//Constants
const NSString* whiteField=@"white.jpg";
const NSString* blackField=@"black.jpg";
const NSString* horseFigure=@"chess.png";
const NSInteger sizeOfSquare=70;

-(void)didMoveToView:(SKView *)view{
    self.chessField = [[NSMutableArray alloc] init];
    self.positionY=self.frame.size.height*0.1;
    [self createSceneContents];
    
    //Placing the knight at a random position
    NSInteger randomObjectIndex = arc4random_uniform([self.chessField count]);
    self.knightNode = [SKSpriteNode spriteNodeWithImageNamed:horseFigure];
    
    SKSpriteNode* square = [self.chessField objectAtIndex:randomObjectIndex];
    NSLog(@"SQUARE POSITION : X - : Y- ",square.position.x , square.position.y);
    self.knightNode.position = CGPointMake(square.position.x, square.position.y);
    self.knightNode.size = CGSizeMake(sizeOfSquare, sizeOfSquare);
    [self addChild:self.knightNode];
    
    [super didMoveToView:view];
}

//Creating and positioning the chessboard
-(void) createSceneContents{
    
    for (int i=0; i<5; i++) {
        self.positionX=self.frame.size.width*0.3;
        for (int j=0; j<5; j++) {
            if (i%2==0) {
               if(j%2==0){
                [self createWhiteSquare];
               }
               else{
                [self createBlackSquare];
               }
            }else{
                if(j%2!=0){
                    [self createWhiteSquare];
                }
                else{
                    [self createBlackSquare];
                }
            }
            
            self.positionX+=sizeOfSquare;
        }
        self.positionY+=sizeOfSquare;
    }
    
}

-(void) createWhiteSquare{
    SKSpriteNode* node = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(sizeOfSquare, sizeOfSquare)];
    node.position=CGPointMake(self.positionX, self.positionY);
    
    [self.chessField addObject:node];
    [self addChild:node];
}

-(void) createBlackSquare {
    SKSpriteNode* node = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(sizeOfSquare, sizeOfSquare)];
    node.position=CGPointMake(self.positionX, self.positionY);
    
    [self.chessField addObject:node];
    [self addChild:node];
}

@end
