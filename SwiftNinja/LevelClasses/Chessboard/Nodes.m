
#import "Nodes.h"

@implementation Nodes

- (instancetype)init
{
    self = [super init];
    if (self) {
        _row=0;
        _column=0;
    }
    return self;
}

-(void)setRow:(NSInteger)row{
    if(row>=0 && row<3)
       _row=row;
}

-(void)setColumn:(NSInteger)column{
    if(column>=0 && column<3)
        _column=column;
}

@end
