

#import "ObstacleLevel.h"

@interface ObstacleLevel ()

@property CALayer* mace1;
@property CALayer* mace2;
@property CALayer* mace3;
@property CALayer* mace4;

@end

@implementation ObstacleLevel

-(void)didMoveToView:(SKView *)view{
    [super didMoveToView:view];
    
    [self createMaces];
    [self rotateMace:self.mace1 andRotation:30 andDuration:5 andPosition:self.mace1.position];
    [self rotateMace:self.mace2 andRotation:30 andDuration:7 andPosition:self.mace2.position];
    [self rotateMace:self.mace3 andRotation:30 andDuration:9 andPosition:self.mace3.position];
    [self rotateMace:self.mace4 andRotation:30 andDuration:3 andPosition:self.mace4.position];
    
}

-(void) createMaces{
    self.mace1 = [CALayer layer];
    [self.mace1 setFrame:CGRectMake(0.5*self.frame.size.height, 0.4*self.frame.size.width, 64, 64)];
    self.mace1.contents =(__bridge id) [UIImage imageNamed:@"mace.png"].CGImage;
    [self.view.layer addSublayer:_mace1];
    
    self.mace2 = [CALayer layer];
    [self.mace2 setFrame:CGRectMake(0.5*self.frame.size.height, 0.6*self.frame.size.width, 64, 64)];
    self.mace2.contents =(__bridge id) [UIImage imageNamed:@"mace.png"].CGImage;
    [self.view.layer addSublayer:_mace2];
    
    self.mace3 = [CALayer layer];
    [self.mace3 setFrame:CGRectMake(0.7*self.frame.size.height, 0.4*self.frame.size.width, 64, 64)];
    self.mace3.contents =(__bridge id) [UIImage imageNamed:@"mace.png"].CGImage;
    [self.view.layer addSublayer:_mace3];
    
    self.mace4 = [CALayer layer];
    [self.mace4 setFrame:CGRectMake(0.7*self.frame.size.height, 0.6*self.frame.size.width, 64, 64)];
    self.mace4.contents =(__bridge id) [UIImage imageNamed:@"mace.png"].CGImage;
    [self.view.layer addSublayer:_mace4];
}

- (void) rotateMace :(CALayer *)sublayer andRotation:(CGFloat)rot andDuration:(CFTimeInterval)dur andPosition : (CGPoint ) position{
    CGRect rect = CGRectMake(self.frame.size.height*0.9, self.frame.size.width*0.6, 150, 150);
    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    // Creating a center point around which we will transform the path

    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, position.x, position.y);
    transform = CGAffineTransformRotate(transform, rot);
    // Recenter the transform
    transform = CGAffineTransformTranslate(transform, -position.x, -position.y);
    // This is the new path we will use.
    CGPathRef rotated =  CGPathCreateCopyByTransformingPath(aPath.CGPath, &transform);
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = rotated;
    anim.rotationMode = kCAAnimationRotateAuto;
    anim.repeatCount = HUGE_VALF;
    anim.duration =dur;
    [sublayer addAnimation:anim forKey:@"race"];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}

-(void)endLevel{
    [super endLevel];
}
@end

