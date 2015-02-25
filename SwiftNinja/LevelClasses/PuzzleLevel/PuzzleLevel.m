

#import "PuzzleLevel.h"

@interface PuzzleLevel ()

@property SKSpriteNode* view1;
@property SKSpriteNode* view2;
@property SKSpriteNode* view3;
@property SKSpriteNode* view4;

@end

@implementation PuzzleLevel

const NSString* face1= @"face1.png";
const NSString* face2= @"face2.png";
const NSString* face3= @"face3.png";
const NSString* face4= @"face4.png";

-(void)didMoveToView:(SKView *)view{
    
    
    self.view1 = [SKSpriteNode spriteNodeWithImageNamed:@"face1.png"];
    self.view2 = [SKSpriteNode spriteNodeWithImageNamed:@"face2.png"];
    self.view3 = [SKSpriteNode spriteNodeWithImageNamed:@"face3.png"];
    self.view4 = [SKSpriteNode spriteNodeWithImageNamed:@"face4.png"];
    //Size of the Nodes
    
    self.view1.size= CGSizeMake(64, 64);
    self.view2.size= CGSizeMake(64, 64);
    self.view3.size= CGSizeMake(64, 64);
    self.view4.size= CGSizeMake(64, 64);
    //Position of the Nodes
    
    self.view1.position = CGPointMake(self.size.width*0.5,self.size.height* 0.5);
    self.view2.position = CGPointMake(self.size.width*0.5,((self.size.height*0.5)+64));
    self.view3.position = CGPointMake(((self.size.width*0.5)-64), ((self.size.height*0.5)+64));
    self.view4.position = CGPointMake(((self.size.width*0.5)-64), self.size.height*0.5);
    
    
    
    //Adding the childs to the scene
    [self addChild:self.view1];
    [self addChild:self.view2];
    [self addChild:self.view3];
    [self addChild:self.view4];
    
    [super didMoveToView:view];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKSpriteNode *node in nodes) {
        if([node isEqual:self.view1] || [node isEqual:self.view2] ||
           [node isEqual:self.view3] || [node isEqual:self.view4]){
            
        SKAction* rotate = [SKAction rotateByAngle:M_PI/2.0 duration:0.15];
        [node runAction:rotate];
        }
    }
}


@end
