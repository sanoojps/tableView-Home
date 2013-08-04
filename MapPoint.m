//
//  MapPoint.m
//  WhereAmI
//
//  Created by marJinn on 31/07/13.
//  Copyright (c) 2013 lockUp. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

@synthesize coordinate,title;

-(id)initWithCoordinateL:(CLLocationCoordinate2D)c
               withTitle:(NSString *)t;
{
    self = [super init];
    if (self) {
        coordinate = c;
        
        [self setTitle:t];
    }
    
    return self;
}

-(void)dealloc
{
    [title release];
    [super dealloc];
}
@end
