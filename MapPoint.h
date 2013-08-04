//
//  MapPoint.h
//  WhereAmI
//
//  Created by marJinn on 31/07/13.
//  Copyright (c) 2013 lockUp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

@property(nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property(nonatomic,copy)NSString *title;



-(id)initWithCoordinateL:(CLLocationCoordinate2D)c
               withTitle:(NSString *)t;


@end
