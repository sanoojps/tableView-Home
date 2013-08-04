//
//  Common.m
//  noArcCoolTable
//
//  Created by Sanooj on 7/20/13.
//  Copyright (c) 2013 marjinn. All rights reserved.
//

#import "Common.h"


//Two rects
//          <-- x- axis -->
// (0,0)|--------------------- >
//      |
//      |
//   y  |
//      |
//   -  |
//   a  |
//   x  |
//   i  |
//   s  |
//      |
//      |




 //                midX
//	minX,minY  ------------ minX,maxY
//            |			   |
//            |			   | midY
//            |            |
///  minX,maxY ------------ maxX,MaxY


void drawLinearGradient(CGContextRef _context,
                        CGRect _rect,
                        CGColorRef _startColor,
                        CGColorRef _endColor
                        )
{
    // 1 -- get your ColorSpace
    // 2 -- get the locations array - for tracking the position of colors
            // 0 start of color 1 end of color
    // 3 -- you also supply an array of colors you are going to use
    
    //use CGGradientCreateWithColors(
    //CGColorSpaceRef space,
    //CFArrayRef colors,
    //const CGFloat locations[]
    //);
    
    CGColorSpaceRef _colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat locations[] = {0.0,1.0};
    
    NSArray *colorArray = [NSArray arrayWithObjects:
                                    (id)_startColor,
                                    (id)_endColor,
                                       nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(
                                                        _colorSpace,
                                                        (CFArrayRef)colorArray, locations);
    
    // 4 -- We use this to draw
    
    //use CGContextDrawLinearGradient(
     //CGContextRef context,
     //CGGradientRef gradient,
     //CGPoint startPoint,
     //CGPoint endPoint,
     //CGGradientDrawingOptions options
    // );
    
    // 5 -- context - will be provided
    // 6 -- gradient - was created at step 3
    // 7 -- startPoint - has to be created using CGPointMake
    // 8 -- endPoint - to be created
    // 9 -- options - control whether the fill should extend beyond the
                      //starting or ending point
    
    //the “top middle” to the “bottom middle” of the rectangle
    CGPoint startPoint = CGPointMake(
                                     CGRectGetMidX(_rect),
                                     CGRectGetMinY(_rect));
    CGPoint endPoint  = CGPointMake(
                                    CGRectGetMidX(_rect),
                                    CGRectGetMaxY(_rect));
    
    // 10 -- to draw gradient we save the current Context
    // 11 -- clip the shape that we need the gradient to be applied to
                // because the draw gradient function fills the entire context
    // 12 -- and finally restore the context
    
    CGContextSaveGState(_context);
    //add the shape to clip
    CGContextAddRect(_context, _rect);
    //clip
    CGContextClip(_context);
    //draw the gradient
    CGContextDrawLinearGradient(_context, gradient, startPoint, endPoint, 0);
    //restore
    CGContextRestoreGState(_context);
    
    //release gradient
    CGGradientRelease(gradient);
    //release colorspace
    CGColorSpaceRelease(_colorSpace);
    
    
}


CGRect rectFor1PxStroke(CGRect rect)
{
    // 0.5 for 1 px rect
    return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, rect.size.width - 1, rect.size.height - 1);
}


void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color)
{
    //save the context as this may not be the only drawing
    CGContextSaveGState(context);
    //set line cap
    CGContextSetLineCap(context,kCGLineCapSquare);
    //kCGLineCapSquare
    //A line with a squared-off end. Quartz extends the line beyond the endpoint of
    //the path for a distance equal to half the line width.
    
    //line width
    CGContextSetLineWidth(context, 1.0);
    
    //strokeColor
    CGContextSetStrokeColorWithColor(context, color);
    
    //line startPoint
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    //line endPoint
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    
    //stroke
    CGContextStrokePath(context);
    
    //restoreState
    CGContextRestoreGState(context);
    
}

void drawGlossAndGradient(CGContextRef context,CGRect rect,CGColorRef startColor,CGColorRef endColor)
{
    //draw gardient Using the drawLinearGradient function
    drawLinearGradient(context, rect, startColor, endColor);
    
    //step 1 -- To draw the gradient, you call the routine you wrote earlier.
    
    //step 2 -- Then to draw the gloss, you just draw another gradient on top of that, from pretty-transparent (white with 0.35 alpha) to very transparent (white with 0.1 alpha).
    
    UIColor * glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35];
    UIColor * glossColor2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
    
    //top half rectangle
    CGRect tophalf = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height /2);
    

    drawLinearGradient(context, tophalf, glossColor1.CGColor,glossColor2.CGColor);
    
}

void drawGloss(CGContextRef context,CGRect rect)
{
    //step 1 -- To draw the gradient, you call the routine you wrote earlier.
    
    //step 2 -- Then to draw the gloss, you just draw another gradient on top of that, from pretty-transparent (white with 0.35 alpha) to very transparent (white with 0.1 alpha).
    
    UIColor * glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35];
    UIColor * glossColor2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
    
    //top half rectangle
    CGRect tophalf = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height /2);
    
    
    drawLinearGradient(context, tophalf, glossColor1.CGColor,glossColor2.CGColor);
}


void drawingDropShadow(CGContextRef context,CGRect rect)
{
    ///* DRAWING DROP SHADOWS /////
    
    //step 1 --- Draw paper ie a rect with white background
    //step 2 --- Draw shadow - enable drawing shadows - provide a path
    //              CG draws a shadow under the path
    //step 3 -- draw colored box
    
    //Well, in Core Graphics, to draw a shadow, you simply call a function to enable
    //drawing shadows, and then draw a path. A shadow will then be drawn
    //under the path with the parameters you specified – regardless of the shape of
    //the path!
    
    
    //getContext
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    //create paper
    CGContextSetFillColorWithColor(context, whiteColor.CGColor);
    //fill
    
    
    CGFloat coloredBoxMargin = 6.0;
    CGFloat coloredBoxHeight = 40.0;
    
    CGRect coloredBoxRect = CGRectMake(coloredBoxMargin,
                                       coloredBoxMargin,
                                       rect.size.width - coloredBoxMargin*2, coloredBoxHeight);
    
    CGFloat paperMargin = 9.0;
    CGRect paperRect = CGRectMake(
                                  paperMargin,
                                  CGRectGetMaxY(rect),
                                  rect.size.width-paperMargin*2,
                                  rect.size.height-CGRectGetMaxY(rect));
    
    CGContextFillRect(context, paperRect);//underlying rect
    
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
    UIColor *lightColor = [UIColor colorWithRed:105.0/255.0 green:179.0/255.0 blue:216.0/255.0 alpha:1.0];
    CGContextSetFillColorWithColor(context, lightColor.CGColor);
    
    //fill
    
    CGContextFillRect(context, coloredBoxRect);//label rect
    //restore Context
    CGContextRestoreGState(context);
    
    //*//// DRAWING DROP SHADOWS //////
}