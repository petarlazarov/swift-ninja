

#import "PuzzleLevel.h"

@interface PuzzleLevel ()

@property SKSpriteNode* view1;
@property SKSpriteNode* view2;
@property SKSpriteNode* view3;
@property SKSpriteNode* view4;
@property SKAction* repeatRotation;
@property BOOL gameHasEnded;

@end

@implementation PuzzleLevel

static const NSString* face1= @"face1.png";
const NSString* face2= @"face2.png";
const NSString* face3= @"face3.png";
const NSString* face4= @"face4.png";
const NSUInteger defaultSize = 128;
const CGFloat anchorPointX=0.6;
const CGFloat anchorPointY=0.4;


-(void)didMoveToView:(SKView *)view{
    
    
    self.view1 = [SKSpriteNode spriteNodeWithImageNamed:face1];
    self.view2 = [SKSpriteNode spriteNodeWithImageNamed:face2];
    self.view3 = [SKSpriteNode spriteNodeWithImageNamed:face3];
    self.view4 = [SKSpriteNode spriteNodeWithImageNamed:face4];
    
    //Size of the Nodes
    
    self.view1.size= CGSizeMake(defaultSize, defaultSize);
    self.view2.size= CGSizeMake(defaultSize, defaultSize);
    self.view3.size= CGSizeMake(defaultSize, defaultSize);
    self.view4.size= CGSizeMake(defaultSize, defaultSize);
    
    self.view1.name=@"face";
    self.view2.name=@"face";
    self.view3.name=@"face";
    self.view4.name=@"face";
    
    //Position of the Nodes
    
    
    self.view1.position = CGPointMake(self.frame.size.width*anchorPointX,self.frame.size.height* anchorPointY);
    self.view2.position = CGPointMake(self.frame.size.width*anchorPointX,((self.frame.size.height*anchorPointY)+defaultSize));
    self.view3.position = CGPointMake(((self.frame.size.width*anchorPointX)-defaultSize), ((self.frame.size.height*anchorPointY)+defaultSize));
    self.view4.position = CGPointMake(((self.frame.size.width*anchorPointX)-defaultSize), self.frame.size.height*anchorPointY);
    
    NSLog(@"ROTATION OF THE NODES : 1- %f , 2- %f , 3 - %f , 4- %f ",self.view1.zRotation , self.view2.zRotation , self.view3.zRotation , self.view4.zRotation);
    
    [self rotateNode:self.view1];
    [self rotateNode:self.view2];
    [self rotateNode:self.view3];
    [self rotateNode:self.view4];
    
    //Adding the childs to the scene
    [self addChild:self.view1];
    [self addChild:self.view2];
    [self addChild:self.view3];
    [self addChild:self.view4];
   
    [super didMoveToView:view];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKSpriteNode *node in nodes) {
        if([node isEqual:self.view1] || [node isEqual:self.view2] ||
           [node isEqual:self.view3] || [node isEqual:self.view4]){
            if([node hasActions]){
                
              [self stopRotation:node];
            }else{
                [node runAction:self.repeatRotation];
            }

        
         NSLog(@"ROTATION OF THE NODES : 1- %f , 2- %f , 3 - %f , 4- %f ",self.view1.zRotation , self.view2.zRotation , self.view3.zRotation , self.view4.zRotation);
        }
    }
}

-(void) rotateNode : (SKSpriteNode*) node {
    
    SKAction* rotation = [SKAction rotateByAngle:M_PI/2.0 duration:2];
    
    self.repeatRotation = [SKAction repeatActionForever:rotation];
    [node runAction:self.repeatRotation];
}

-(void) stopRotation : (SKSpriteNode*) node {
    
    [node removeAllActions];
    if(node.zRotation>7*M_PI/4 || node.zRotation<M_PI/4)
        node.zRotation=0;
    if(node.zRotation>M_PI/4 && node.zRotation <3*M_PI/4)
        node.zRotation=M_PI/2.0;
    if(node.zRotation>3*M_PI/4 && node.zRotation < 5*M_PI/4)
        node.zRotation=M_PI;
    if(node.zRotation > 5*M_PI/4 && node.zRotation<7*M_PI/4)
        node.zRotation=3*M_PI/2;
}

- (void) endGame {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Very Good!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"DemandNewScene"
     object:self];
    
}

-(void)update:(NSTimeInterval)currentTime{
    [super update:currentTime];
    if (self.gameHasEnded) {
        return;
    }
    if(![self.view1 hasActions]&& self.view1.zRotation==0
       && ![self.view2 hasActions] && self.view2.zRotation==0
       && ![self.view3 hasActions] && self.view3.zRotation==0
       && ![self.view4 hasActions] && self.view4.zRotation==0){
        self.gameHasEnded=YES;
        [self endGame];
    }
    
   }

@end
