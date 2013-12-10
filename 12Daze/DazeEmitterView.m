//
// DazeEmitterView
// Created by Patrick B. Gibson on 12/10/13
//

#import "DazeEmitterView.h"

@implementation DazeEmitterView

-(id)initWithFrame:(CGRect)frame {
    
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor blackColor];
	}
	
	return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    
	self = [super initWithCoder:aDecoder];
	if (self) {
		self.backgroundColor = [UIColor blackColor];
	}
	
	return self;
}

+ (Class) layerClass {
    return [CAEmitterLayer class];
}

-(void)awakeFromNib {
    CAEmitterLayer *emitterLayer = (CAEmitterLayer*)self.layer;

	emitterLayer.name = @"GlowLayer";

	emitterLayer.emitterShape = kCAEmitterLayerRectangle;
	emitterLayer.emitterMode = kCAEmitterLayerSurface;
	emitterLayer.renderMode = kCAEmitterLayerBackToFront;

	emitterLayer.seed = 630879317;

    emitterLayer.lifetime = 1.0;
    emitterLayer.opacity = 0.9;
	
	CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
	
	emitterCell.name = @"Glow";

	emitterCell.contents = (id)[[UIImage imageNamed:@"dot.png"] CGImage];
	emitterCell.contentsRect = CGRectMake(0.00, 0.00, 1.00, 1.00);

	emitterCell.scale = .2;
	emitterCell.scaleRange = .25;
	emitterCell.scaleSpeed = .9;

	emitterCell.color = [[UIColor colorWithRed:1.0 green:0.83 blue:0.42 alpha:0.9] CGColor];
	emitterCell.alphaRange = 0.05;
	emitterCell.alphaSpeed = -0.1;

	emitterCell.lifetime = 10.00;
	emitterCell.lifetimeRange = 0.00;
	emitterCell.birthRate = 6;
	emitterCell.velocity = 0.00;

	emitterLayer.emitterCells = @[emitterCell];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    CAEmitterLayer *emitterLayer = (CAEmitterLayer*)self.layer;
    CGFloat scale = [[UIScreen mainScreen] scale];
    emitterLayer.emitterSize = CGSizeApplyAffineTransform(frame.size, CGAffineTransformMakeScale(scale, scale));
}

@end
