//
//  Common.h
//  noArcCoolTable
//
//  Created by Sanooj on 7/20/13.
//  Copyright (c) 2013 marjinn. All rights reserved.
//

#import <Foundation/Foundation.h>

void drawLinearGradient(CGContextRef context,
                        CGRect rect,
                        CGColorRef startColor,
                        CGColorRef endColor
                        );

//Well, it turns out that when Core Graphics strokes a path,
//it draws the stroke on the middle of the exact edge of the path.

//In your case, the edge of the path is the rectangle you wish to fill.
//So when drawing a 1 pixel line along that edge,
//half of the line (1/2 pixel) will be on the inside of the rectangle,
//and the other half of the line (1/2 pixel) will be on the outside of the rectangle.

CGRect rectFor1PxStroke(CGRect rect);

//draw  a line -- 1px fix applied

void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color);

//draw Gloss gradient
void drawGlossAndGradient(CGContextRef context,CGRect rect,CGColorRef startColor,CGColorRef endColor);

//draw just gloss - 
void drawGloss(CGContextRef context,CGRect rect);