

#import "ObstacleLevel.h"

@interface ObstacleLevel ()

@property SKSpriteNode* mace1;
@property SKSpriteNode* mace2;
@property SKSpriteNode* mace3;
@property SKSpriteNode* mace4;
@property SKSpriteNode* arrow;
@property SKSpriteNode* endCheckPointNode;
@property BOOL didCollide;
@property BOOL didWin;


@end

@implementation ObstacleLevel

static const NSString* flail = @"flail.png";
const CGFloat kPointsForWinning=100;

-(void)didMoveToView:(SKView *)view{
   
    
    //Creating the arrow
    
    self.arrow = [SKSpriteNode spriteNodeWithImageNamed:@"arrow.png"];
    self.arrow.size = CGSizeMake(32, 32);
    self.arrow.position= CGPointMake(self.frame.size.width*0.1, self.frame.size.height*0.5);
    self.arrow.name=@"arrow";
    [self addChild:self.arrow];
    
    //Creating the end node for the winning
    self.endCheckPointNode= [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(50, self.frame.size.height)];
    self.endCheckPointNode.position=CGPointMake(self.frame.size.width*0.9, 0);
    self.endCheckPointNode.anchorPoint=CGPointZero;
    [self addChild:self.endCheckPointNode];
    
    
    //Creating lower and upper bounds
    SKSpriteNode* upperBound  = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(self.frame.size.width*0.6, self.frame.size.height*0.4)];
    upperBound.position= CGPointMake(self.frame.size.width*0.4, self.frame.size.height*0.65);
    upperBound.anchorPoint= CGPointZero;
    [self addChild:upperBound];
    SKSpriteNode* lowerBound = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(self.frame.size.width*0.6, self.frame.size.height*0.4)];
    
    lowerBound.position = CGPointMake(self.frame.size.width*0.4, self.frame.size.height*0.35);
    lowerBound.anchorPoint = CGPointMake(0, 1);
    [self addChild:lowerBound];
    //Creating the maces and adding the animations for them
    
    [self createObstacles];
    [self rotateNode:self.mace1 withDuration:0.5];
    [self rotateNode:self.mace2 withDuration:1];
    [self rotateNode:self.mace3 withDuration:1.5];
    [self rotateNode:self.mace4 withDuration:2];
    
   
     [super didMoveToView:view];
    
}

-(void) createObstacles{
  //  self.mace1 = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(10, 80)];
    self.mace1 = [SKSpriteNode spriteNodeWithImageNamed:@"chain.png"];
    self.mace1.size = CGSizeMake(100, 30);
    self.mace1.position= CGPointMake(self.frame.size.width*0.6, self.frame.size.height*0.65);
    self.mace1.anchorPoint= CGPointMake(0, 0.5);
    [self addChild:self.mace1];
    //Mace2
    
    self.mace2 = [SKSpriteNode spriteNodeWithImageNamed:@"chain.png"];
    self.mace2.size = CGSizeMake(100, 30);
    self.mace2.anchorPoint= CGPointMake(0, 0.5);
    self.mace2.position= CGPointMake(self.frame.size.width*0.6, self.frame.size.height*0.35);
    [self addChild:self.mace2];
    
    //Mace3
    
    self.mace3 = [SKSpriteNode spriteNodeWithImageNamed:@"chain.png"];
    self.mace3.size = CGSizeMake(100, 30);
    self.mace3.anchorPoint= CGPointMake(0, 0.5);
    self.mace3.position= CGPointMake(self.frame.size.width*0.8, self.frame.size.height*0.65);
    [self addChild:self.mace3];
    
    //Mace4
    self.mace4 = [SKSpriteNode spriteNodeWithImageNamed:@"chain.png"];
    self.mace4.size = CGSizeMake(100, 30);
    self.mace4.anchorPoint= CGPointMake(0, 0.5);
    self.mace4.position= CGPointMake(self.frame.size.width*0.8, self.frame.size.height*0.35);
    [self addChild:self.mace4];
    
}

-(void) rotateNode : (SKSpriteNode*) node withDuration : (CGFloat) duration{
    
    SKAction* rotation = [SKAction rotateByAngle:M_PI/2.0 duration:duration];
    
    SKAction* repeatRotation = [SKAction repeatActionForever:rotation];
    [node runAction:repeatRotation];
}


//-(void) createMaces{
//    self.mace1 = [CALayer layer];
//    [self.mace1 setFrame:CGRectMake(0.5*self.frame.size.height, 0.4*self.frame.size.width, 64, 64)];
//    self.mace1.contents =(__bridge id) [UIImage imageNamed:flail].CGImage;
//    [self.view.layer addSublayer:_mace1];
//    
//    self.mace2 = [CALayer layer];
//    [self.mace2 setFrame:CGRectMake(0.5*self.frame.size.height, 0.6*self.frame.size.width, 64, 64)];
//    self.mace2.contents =(__bridge id) [UIImage imageNamed:flail].CGImage;
//    [self.view.layer addSublayer:_mace2];
//    
//    self.mace3 = [CALayer layer];
//    [self.mace3 setFrame:CGRectMake(0.7*self.frame.size.height, 0.4*self.frame.size.width, 64, 64)];
//    self.mace3.contents =(__bridge id) [UIImage imageNamed:flail].CGImage;
//    [self.view.layer addSublayer:_mace3];
//    
//    self.mace4 = [CALayer layer];
//    [self.mace4 setFrame:CGRectMake(0.7*self.frame.size.height, 0.6*self.frame.size.width, 64, 64)];
//    self.mace4.contents =(__bridge id) [UIImage imageNamed:flail].CGImage;
//    [self.view.layer addSublayer:_mace4];
//}
//
//- (void) rotateMace :(CALayer *)sublayer andRotation:(CGFloat)rot andDuration:(CFTimeInterval)dur andPosition : (CGPoint ) position{
//    CGRect rect = CGRectMake(self.frame.size.height*0.9, self.frame.size.width*0.6, 150, 150);
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:rect];
//    // Creating a center point around which we will transform the path
//
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    transform = CGAffineTransformTranslate(transform, position.x, position.y);
//    transform = CGAffineTransformRotate(transform, rot);
//    // Recenter the transform
//    transform = CGAffineTransformTranslate(transform, -position.x, -position.y);
//    // This is the new path we will use.
//    CGPathRef rotated =  CGPathCreateCopyByTransformingPath(aPath.CGPath, &transform);
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    anim.path = rotated;
//    anim.rotationMode = kCAAnimationRotateAuto;
//    anim.repeatCount = HUGE_VALF;
//    anim.duration =dur;
//    [sublayer addAnimation:anim forKey:@"race"];
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self pushArrow];
}

-(void) pushArrow{
    
    SKAction* action = [SKAction moveToX:self.frame.size.width+100 duration:1];
    

    [self.arrow runAction:action];
    
}

-(void)endLevel{
    [super endLevel];

}


-(void) checkForCollisionWithRec{
    
    
    if (CGRectIntersectsRect(self.arrow.frame,
                             self.mace1.frame) ||
        CGRectIntersectsRect(self.arrow.frame,
                            self.mace2.frame)  ||
        CGRectIntersectsRect(self.arrow.frame,
                             self.mace3.frame) ||
        CGRectIntersectsRect(self.arrow.frame,
                             self.mace4.frame)) {
            self.didCollide=YES;
            NSLog(@"COLLISIIIOOOONNN!!!!!");
    }
    
 
}

-(void) didWinLevel{
    if(CGRectIntersectsRect(self.arrow.frame,self.endCheckPointNode.frame )) {
        self.didWin=YES;
        
    }
}



-(void)update:(NSTimeInterval)currentTime{
    if (self.didCollide || self.didWin) return;
    
    [super update:currentTime];
    [self checkForCollisionWithRec];
    [self didWinLevel];
    if (self.didCollide) {
        [self endLevel];
        NSLog(@"ENDING GAME!");
    }
    if (self.didWin) {
        [self setCurrentScore:kPointsForWinning*currentTime];
        NSLog(@"CONGRATS!");
    }
}




@end

