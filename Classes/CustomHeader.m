//
//  CustomHeader.m
//  noArcCoolTable
//
//  Created by marJinn on 7/21/13.
//  Copyright (c) 2013 marjinn. All rights reserved.
//

#import "CustomHeader.h"
#import "Common.h"


@interface CustomHeader ()
@property(nonatomic,assign)CGRect coloredBoxRect;//frame for label
@property(nonatomic,assign)CGRect paperRect;//main rect
@end

@implementation CustomHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.opaque = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
        _titleLabel.textColor = [UIColor underPageBackgroundColor];
        _titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _titleLabel.shadowOffset = CGSizeMake(0, -1);//default
        [self addSubview:_titleLabel];
        
    
        //for ARC omit retain
        //_lightColor = [[UIColor colorWithRed:105.0/255.0 green:179.0/255.0 blue:216.0/255.0 alpha:1.0]retain];
        //_darkColor = [[UIColor colorWithRed:21.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1.0]retain];
        
        [self setLightColor:[UIColor colorWithRed:105.0/255.0 green:179.0/255.0 blue:216.0/255.0 alpha:1.0]];
        
        [self setDarkColor:[UIColor colorWithRed:21.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1.0]];
        
        //[self setLightColor:[UIColor viewFlipsideBackgroundColor]];
        //[self setDarkColor:[UIColor viewFlipsideBackgroundColor]];
        
        CGRect imagViewRect = CGRectMake(
                                         self.frame.origin.x + self.frame.size.width/2 + 5.0,
                                         self.frame.origin.y + 3.0,
                                         20.0,
                                         20.0
                                         );
        _headerImage = [[UIImageView alloc]initWithFrame:imagViewRect];
        //_headerImage.image = [UIImage imageNamed:@"iphone5-intro.jpg"];
        
        [_titleLabel addSubview:_headerImage];
        
                
        
    }
    return self;
}


-(void)layoutSubviews
{
    //Two rects
    //          <-- x- axis -->
    // (0,0)|--------------------- >
    //      |
    //      |
    //   y  |
    //      |
   //    -  |
   //    a  |
    //   x  |
    //   i  |
    //   s  |
   //       |
    //      |
    
    


    
    //	minX,minY  ------------ minX,maxY
	//            |			   |
	//            |			   |
	///  minX,maxY ------------ maxX,MaxY

    
    CGFloat coloredBoxMargin = 0.0;
    CGFloat coloredBoxHeight = 24.0;
    
    //frame for label
    self.coloredBoxRect = CGRectMake(coloredBoxMargin,
                                     coloredBoxMargin,
                                     self.bounds.size.width - coloredBoxMargin*2, coloredBoxHeight);
    
    CGFloat paperMargin = 9.0;
    self.paperRect = CGRectMake(paperMargin,
                                CGRectGetMaxY(self.coloredBoxRect),
                                self.bounds.size.width - paperMargin*2,
                                self.bounds.size.height - CGRectGetMaxY(self.coloredBoxRect));
    
    self.titleLabel.frame = self.coloredBoxRect;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
     /* -- DRAW RECT
    //get context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //color
    UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    //fill
    CGContextSetFillColorWithColor(context, redColor.CGColor);
    //draw
    CGContextFillRect(context, rect);
    
     */ //-- DRAW RECT
    
    
    /* -- DRAW TWO RECTS 
    
    //get context
    CGContextRef context = UIGraphicsGetCurrentContext();

    
    UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    UIColor * greenColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
    
    //fill
    CGContextSetFillColorWithColor(context, redColor.CGColor);
    //draw
    CGContextFillRect(context, self.coloredBoxRect);
    
    //fill
    CGContextSetFillColorWithColor(context, greenColor.CGColor);
    //draw
    CGContextFillRect(context, self.paperRect);

    */ // -- DRAW TWO RECTS 
    
    
    ///* DRAWING DROP SHADOWS /////
    
    //step 1 --- Draw paper ie a rect with white background
    //step 2 --- Draw shadow - enable drawing shadows - provide a path
                 //CG draws a shadow under the path
    //step 3 -- draw colored box
    
    //getContext
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
  
    //create paper
  CGContextSetFillColorWithColor(context, whiteColor.CGColor);
    //fill
   CGContextFillRect(context, _paperRect);//underlying rect
    
    //Save Context
    CGContextSaveGState(context);
    

    //set shadow
    //void CGContextSetShadowWithColor (
    //CGContextRef context,
    //CGSize offset,
    //CGFloat blur,
    //CGColorRef color
    //);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor.CGColor);
    
    //color
    CGContextSetFillColorWithColor(context, _lightColor.CGColor);
    
    //fill
    CGContextFillRect(context, self.coloredBoxRect);//label rect
    //restore Context
   CGContextRestoreGState(context);

    //*//// DRAWING DROP SHADOWS //////
    
    
    
    ///* DRAWING GLOSS AND GRADIENT
    //add the gradient
    
    drawGlossAndGradient(context, self.coloredBoxRect, self.lightColor.CGColor  , self.darkColor.CGColor);
    
    //draw 1px rect around the main rect ie coloredBoxRect aka frame of the label
    CGContextSetStrokeColorWithColor(context, self.darkColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, rectFor1PxStroke(self.coloredBoxRect));
    
    //*/ DRAWING GLOSS AND GRADIENT
}

-(void)dealloc
{
    [_headerImage release];
    [_titleLabel release];
    [_lightColor release];
    [_darkColor release];
    
    [super dealloc];
}



@end
