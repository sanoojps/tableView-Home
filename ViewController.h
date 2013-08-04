//
//  ViewController.h
//  WhereAmI
//
//  Created by lockUp on 7/30/13.
//  Copyright (c) 2013 lockUp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <
CLLocationManagerDelegate,MKMapViewDelegate,UITextFieldDelegate
>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    
    NSString *feedbackMsg;
}

@property (retain, nonatomic) IBOutlet MKMapView *worldView;

@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (retain, nonatomic) IBOutlet UITextField *locationTextField;
@property (retain, nonatomic) IBOutlet UILabel *locationUpdate;
@property (retain, nonatomic) IBOutlet UISegmentedControl *mapTypeControl;

@property (retain, nonatomic)  NSString *feedbackMsg;

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;
- (IBAction)changeMapType:(id)sender;
- (IBAction)ViewInMaps:(id)sender;
- (IBAction)KBButtonClicked:(id)sender;
- (IBAction)MailButtonClicked:(id)sender;

@end
