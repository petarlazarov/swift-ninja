
#import "ChessBoardLevel.h"
#import "Nodes.h"
#import "Knight.h"

@interface ChessBoardLevel ()

@property NSMutableArray* chessField;
@property Nodes* knightNode;
@property Nodes* targetNode;
@property NSArray* positionMatrix;
@property Knight* knight;

@property NSInteger* randomInteger;

@property CGFloat positionX;
@property CGFloat positionY;


@end

@implementation ChessBoardLevel



//Constants
const NSString* whiteField=@"white.jpg";
const NSString* blackField=@"black.jpg";
const NSString* horseFigure=@"chess.png";
const NSString* target=@"target.png";
const NSInteger sizeOfSquare=70;



-(void)didMoveToView:(SKView *)view{
    self.chessField = [[NSMutableArray alloc] init];
    self.positionY=self.frame.size.height*0.1;
    [self createSceneContents];
    self.knight = [[Knight alloc] init];

    //Placing the knight at a random position
    NSInteger randomObjectIndex = arc4random_uniform([self.chessField count]);
    self.knightNode = [Nodes spriteNodeWithImageNamed:horseFigure];
    
    Nodes* square = [self.chessField objectAtIndex:randomObjectIndex];
    NSLog(@"SQUARE POSITION : X - : Y- ",square.position.x , square.position.y);
    self.knightNode.position = CGPointMake(square.position.x, square.position.y);
    self.knightNode.size = CGSizeMake(sizeOfSquare, sizeOfSquare);
    [self addChild:self.knightNode];
    
    //Placing the target at random position
    
    do {
        self.randomInteger = arc4random_uniform([self.chessField count]);
    } while (randomObjectIndex==self.randomInteger);
    
    self.targetNode =[Nodes spriteNodeWithImageNamed:target];
    Nodes* nodeForTarget = [self.chessField objectAtIndex:self.randomInteger];
    self.targetNode.position= CGPointMake(nodeForTarget.position.x, nodeForTarget.position.y);
    self.targetNode.size = CGSizeMake(sizeOfSquare, sizeOfSquare);
    [self addChild:self.targetNode];
    
    [super didMoveToView:view];
}

//Creating and positioning the chessboard
-(void) createSceneContents{
    
    for (int i=0; i<5; i++) {
        self.positionX=self.frame.size.width*0.3;
        for (int j=0; j<5; j++) {
            if (i%2==0) {
               if(j%2==0){
                   [self createWhiteSquare:i andWithColumn:j];
               }
               else{
                [self createBlackSquare:i andWithColumn:j];
               }
            }else{
                if(j%2!=0){
                    [self createWhiteSquare:i andWithColumn:j];
                }
                else{
                    [self createBlackSquare:i andWithColumn:j];
                }
            }
            
            self.positionX+=sizeOfSquare;
        }
        self.positionY+=sizeOfSquare;
    }
    
}

-(void) createWhiteSquare : (NSInteger) row andWithColumn : (NSInteger) column{
    Nodes* node = [Nodes spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(sizeOfSquare, sizeOfSquare)];
    node.position=CGPointMake(self.positionX, self.positionY);
    node.row=row;
    node.column=column;
    node.name=@"square";
    [self.chessField addObject:node];
    [self addChild:node];
}

-(void) createBlackSquare :(NSInteger) row andWithColumn : (NSInteger) column {
    Nodes* node = [Nodes spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(sizeOfSquare, sizeOfSquare)];
    node.position=CGPointMake(self.positionX, self.positionY);
    node.row=row;
    node.column=column;
    node.name=@"square";
    [self.chessField addObject:node];
    [self addChild:node];
}

//Movement of the knight piece

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (int i=0; i<[nodes count]; i++) {
        if([[[nodes objectAtIndex:i] name] isEqual:@"square"]){
        if ([self.knight checkingIfPositionIsAvailable:self.knightNode.row andCurrentColumn:self.knightNode.column andNextRow:[[nodes objectAtIndex:i] row] andNextColumn:[[nodes objectAtIndex:i] column]] ) {
            
            Nodes* square = [nodes objectAtIndex:i];
            self.knightNode.position= CGPointMake(square.position.x, square.position.y);
        }
        }
    }
}

@end
