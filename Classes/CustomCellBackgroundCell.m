//
//  CustomCellBackgroundCell.m
//  noArcCoolTable
//
//  Created by Sanooj on 7/20/13.
//  Copyright (c) 2013 marjinn. All rights reserved.
//

#import "CustomCellBackgroundCell.h"

#import "Common.h"

@implementation CustomCellBackgroundCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //[[self textLabel]setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect
{
    
    /* -- DRAW A RED RECT
    
     //get Context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *redColor = [UIColor colorWithRed:1.0
                                        green:0.0
                                         blue:0.0
                                        alpha:1.0];
    //Choose color to fill
    CGContextSetFillColorWithColor(context, redColor.CGColor);
    
    //fill the rect
    CGContextFillRect(context, rect);
     
     */
    
    
    ///* -- DRAW GRADIENT
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    
    CGRect paperRect = self.bounds;
   
    /*
    drawLinearGradient
    (
        context,
        paperRect,
        whiteColor.CGColor,
        lightGrayColor.CGColor
     );
    */
    
     //*/ -- DRAW GRADIENT
    
    
    
    drawGlossAndGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    
    
    /* -- STROKE A RECT -- ie draw a subrect inside a  rect
    
    //new rect
    //-- adding a 1/2 pixel fix
    CGRect strokeRect = rectFor1PxStroke(CGRectInset(paperRect, 1.0, 1.0));
    //get color
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor]CGColor]);
    //set stroke width
    CGContextSetLineWidth(context, 1.0);
    //make the stroke
    CGContextStrokeRect(context, strokeRect);
    

    */ //-- STROKE A RECT -- ie draw a subrect inside a  rect
        //ie draw arectangle without filling it with color
    
    
    
    
    /* -- STROKE A SUBTLE WHITE BORDER AROUND THE CELLS
    
    //reduce the height of the paper rect by 1 to leave room for the separator, convert it, and stroke the color with white.
    
    //Build and run your project, and there should now be a subtle white border around the cells:
    
    //CGRect paperRect = self.bounds;
    CGRect strokeRect = paperRect;
    //reduce height by 1
    strokeRect.size.height = strokeRect.size.height - 1;
    //draw a 1 px rect - also apply 1/2 pixel fix
    strokeRect = rectFor1PxStroke(strokeRect);
    //stroke color
    CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
    //lineWidth
    CGContextSetLineWidth(context, 1.0);
    //make the stroke
    //CGContextStrokeRect(context, strokeRect);
    
    */ // -- STROKE A SUBTLE WHITE BORDER AROUND THE CELLS
    
    
    
    
    
    /* -- DRAW A SEPARATOR BETWEEN THE CELLS
    UIColor *separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0];
    
    //startpoint
    CGPoint startPoint = CGPointMake(paperRect.origin.x,
                                     paperRect.origin.y +
                                     paperRect.size.height - 1);// 1 size of the line
    
    CGPoint endPoint   = CGPointMake(paperRect.origin.x
                                     + paperRect.size.width - 1,
                                     paperRect.origin.y
                                     + paperRect.size.height - 1);
    
    draw1PxStroke(context, startPoint, endPoint,separatorColor.CGColor);
    */ //* -- DRAW A SEPARATOR BETWEEN THE CELLS
    
    
    
    
    
    //drawGlossAndGradient(context, self.bounds, [[UIColor colorWithRed:170.0/255.0 green:218.0/255.0 blue:250.0/255.0 alpha:1.0]CGColor], [[UIColor colorWithRed:227.0/255.0 green:241.0/255.0 blue:250.0/255.0 alpha:1.0]CGColor]);
    
    //drawGloss(context, self.bounds);
    
    //draw 1px rect around the main rect ie coloredBoxRect aka frame of the label
    //CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:170.0/255.0 green:218.0/255.0 blue:250.0/255.0 alpha:1.0]CGColor]);
    //CGContextSetLineWidth(context, 1.0);
    //CGContextStrokeRect(context, rectFor1PxStroke(strokeRect));
    
    
}

@end
