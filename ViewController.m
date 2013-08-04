//
//  ViewController.m
//  WhereAmI
//
//  Created by lockUp on 7/30/13.
//  Copyright (c) 2013 lockUp. All rights reserved.
//

#import "ViewController.h"
#import "MapPoint.h"
#import "TUTorialViewController.h"

#import <MessageUI/MessageUI.h>

@interface ViewController () <
MFMailComposeViewControllerDelegate
>
@end

@implementation ViewController

@synthesize feedbackMsg;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   self.navigationItem.title = @"Maps";
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //Location Manager
    //Create Location manager Object
    locationManager = [[CLLocationManager alloc]init];
    
    //set delegate
    [locationManager setDelegate:self];
    
    //set DistanceFilter - all results
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    //accuracy - full
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    //start
    [locationManager startUpdatingLocation];
    [_worldView setShowsUserLocation:YES];
    
    
    //geoCoder
    
    geocoder = [[CLGeocoder alloc]init];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CLLocationManagerDelegate

//for < iOS 6
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    
    NSLog(@"newLocation - %@\n",newLocation);
    NSLog(@"oldLocation - %@\n",oldLocation);
    
    
    [_locationUpdate setText:[newLocation description]];
    
    //how many seconds ago was this location created
    NSTimeInterval t = [[newLocation timestamp]timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the
    // device first, you don't want that data in this case.
    // If this location was made more than 3 minutes ago, ignore it.
    if (t < -180) {
        // This is cached data, you don't want it, keep looking
        return;
    }
    
    [self foundLocation:newLocation];
    
        
    [geocoder reverseGeocodeLocation:newLocation completionHandler:
     ^(NSArray *placemark, NSError *error)
     {
         NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
         if (error){
             NSLog(@"Geocode failed with error: %@", error);
             [self displayError:error];
             return;
         }
         if ([placemark count]) {
             
             CLPlacemark *placeM = [placemark objectAtIndex:0];
             
            // NSLog(@"%@",[[[placeM addressDictionary]valueForKey:@"FormattedAddressLines"]componentsJoinedByString:@" "]);
         
             CLLocation *location = placeM.location;
             CLLocationCoordinate2D coordin = location.coordinate;
             
             NSLog(@"lat %f - long - %f ",coordin.latitude,coordin.longitude);
             
             NSDictionary *dictio = [placeM addressDictionary];
             
             NSLog(@"%@",[dictio description]);
             
             for(id key in dictio)
             {
                 id value = [dictio objectForKey:key];
                 NSLog(@"value = %@ key = %@ ",value,key);
             }

             
         
         
         }
     }
     
     ];
    
    
                        
                            
    
}


//for ios6

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    for(CLLocation *locationObj in locations)
    {
        NSLog(@"%@",[locationObj description]);
        [_locationUpdate setText:[locationObj description]];
        
        //how many seconds ago was this location created
        NSTimeInterval t = [[locationObj timestamp]timeIntervalSinceNow];
        
        // CLLocationManagers will return the last found location of the
        // device first, you don't want that data in this case.
        // If this location was made more than 3 minutes ago, ignore it.
        if (t < -180) {
            // This is cached data, you don't want it, keep looking
            return;
        }
        
        [self foundLocation:locationObj];
        
        
        [geocoder reverseGeocodeLocation:locationObj completionHandler:
         ^(NSArray *placemark, NSError *error)
         {
             NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
             if (error){
                 NSLog(@"Geocode failed with error: %@", error);
                 [self displayError:error];
                 return;
             }
             if (placemark.count > 1) {
                 
                 CLPlacemark *placeM = [placemark objectAtIndex:0];

             NSLog(@"%@",[[[placeM addressDictionary]valueForKey:@"FormattedAddressLines"]componentsJoinedByString:@" "]);
             }
         }
         
         ];

    }
}


// display a given NSError in an UIAlertView
- (void)displayError:(NSError*)error
{
    dispatch_async(dispatch_get_main_queue(),^ {

        NSString *message;
        switch ([error code])
        {
            case kCLErrorGeocodeFoundNoResult: message = @"kCLErrorGeocodeFoundNoResult";
                break;
            case kCLErrorGeocodeCanceled: message = @"kCLErrorGeocodeCanceled";
                break;
            case kCLErrorGeocodeFoundPartialResult: message = @"kCLErrorGeocodeFoundNoResult";
                break;
            default: message = [error description];
                break;
        }
        
        UIAlertView *alert =  [[[UIAlertView alloc] initWithTitle:@"An error occurred."
                                                          message:message
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil] autorelease];;
        [alert show];
    });   
}



//error
-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@ ",error);
    
    
    if (error.code == kCLErrorLocationUnknown) {
        
        NSLog(
              @"Could not find location: %d ",
              kCLErrorLocationUnknown
              );
        
    }
    
    else [locationManager stopUpdatingLocation];
    
}




-(void)viewWillDisappear:(BOOL)animated
{
    
    [locationManager stopUpdatingLocation];
}



#pragma mark mapview

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    
    //structure
    /*
     typedef struct {
     CLLocationCoordinate2D center;
     MKCoordinateSpan span; ///ZOOM
     } MKCoordinateRegion;
     */
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    
    //set mapview to zoom into my location
    [_worldView setRegion:region animated:YES];
}


#pragma mark textFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [self findLocation];
    
    return YES;
}



#pragma mark Location

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [_activityIndicator startAnimating];
    [_locationTextField setHidden:YES];
}


-(void)foundLocation:(CLLocation *)loc
{
    //willZoom the mapView
    CLLocationCoordinate2D coord = [loc coordinate];
    
    //mappoint object with current Data
    MapPoint *mp = [[MapPoint alloc]initWithCoordinateL:coord
                                              withTitle:[_locationTextField text]];
    
    [_worldView addAnnotation:mp];
    
    
    [mp release];
    
    
    //Zoom
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    
    [_worldView setRegion:region animated:YES];
    
    [_locationTextField setText:@""];
    [_activityIndicator stopAnimating];
    [_locationTextField setHidden:NO];
    
    [locationManager stopUpdatingLocation];
}

- (IBAction)changeMapType:(id)sender {
    
    switch ([sender selectedSegmentIndex]) {
        case 0:
            [_worldView setMapType:MKMapTypeStandard];
            break;
        
        case 1:
            [_worldView setMapType:MKMapTypeSatellite];
            break;
            
        case 2:
            [_worldView setMapType:MKMapTypeHybrid];
            break;
        
        default:
            [_worldView setMapType:MKMapTypeStandard];
            break;
    }
    
}

- (IBAction)ViewInMaps:(id)sender {
    
  //  locationManager.location.coordinate.latitude;
  //  locationManager.location.coordinate.longitude;
    
    NSString *ll = [NSString stringWithFormat:@"%f,%f",
                    locationManager.location.coordinate.latitude,
                    locationManager.location.coordinate.longitude];
    
    NSLog(@"from this button %f,%f",
          locationManager.location.coordinate.latitude,
          locationManager.location.coordinate.longitude);
    
    ll = [ll stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?ll=%@",ll];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}



- (IBAction)KBButtonClicked:(id)sender {
    
    TUTorialViewController *tutView = [[TUTorialViewController alloc]initWithNibName:@"TUTorialViewController" bundle:[NSBundle mainBundle]];
    
    UINavigationController *nuNavig = [[UINavigationController alloc]initWithRootViewController:tutView];
    [tutView release];
    tutView = nil;
    
    [self presentModalViewController:nuNavig animated:YES];
    [nuNavig release];
    nuNavig = nil;
    
}

- (IBAction)MailButtonClicked:(id)sender {
    
    if ([MFMailComposeViewController canSendMail])
        // The device can send email.
    {
        [self displayMailComposerSheet];
    }
    else
        // The device can not send email.
    {
        UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"Mail Composer"
                                                        message:@"Device not configured to send mail." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertV show];
        
        [alertV release];
		
    }

}

#pragma mark - Compose Mail/SMS

// -------------------------------------------------------------------------------
//	displayMailComposerSheet
//  Displays an email composition interface inside the application.
//  Populates all the Mail fields.
// -------------------------------------------------------------------------------
- (void)displayMailComposerSheet
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"LOCATION"];
	
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@"first@example.com"];
	NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
	NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
	
	[picker setToRecipients:toRecipients];
	[picker setCcRecipients:ccRecipients];
	[picker setBccRecipients:bccRecipients];
	
	// Attach aplist to the email
	//NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"jpg"];
	//NSData *myData = [NSData dataWithContentsOfFile:path];
	//[picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"rainy"];
	//application/xml
    //text/plain
    
    NSString *ll;
    ll = [NSString stringWithFormat:@"latitude -: %f \n longitude -: %f",
                    locationManager.location.coordinate.latitude,
                    locationManager.location.coordinate.longitude];
    /*
    NSData *data;
    data = [ll dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
     */
    
    [picker setMessageBody:ll isHTML:NO];
    /*
    //write to a file
    NSFileManager *fileman = [NSFileManager defaultManager];
    
    NSArray *paths;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory;
    documentDirectory = [paths objectAtIndex:0];
    
    NSString *pathToWriteTo;
    pathToWriteTo = [documentDirectory stringByAppendingPathComponent:@"systemInfo.plist"];
    
    
    if ([fileman fileExistsAtPath:pathToWriteTo]) {
        NSData *data;
        data = [NSData dataWithContentsOfFile:pathToWriteTo];
        [picker addAttachmentData:data mimeType:@"application/xml" fileName:@"systemInfo.plist"];
    }
    
    else
    {
        UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"Mail Composer"
                                                        message:@"Failed to attach System Info.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertV show];
        
        [alertV release];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }

    */
    
    /*
	// Fill out the email body text
	NSString *emailBody = @"System Info";
	[picker setMessageBody:emailBody isHTML:NO];
     */
	
    
    
	[self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Delegate Methods

// -------------------------------------------------------------------------------
//	mailComposeController:didFinishWithResult:
//  Dismisses the email composition interface when users tap Cancel or Send.
//  Proceeds to update the message field with the result of the operation.
// -------------------------------------------------------------------------------
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			self->feedbackMsg = @"Result: Mail sending canceled";
			break;
		case MFMailComposeResultSaved:
			self->feedbackMsg = @"Result: Mail saved";
			break;
		case MFMailComposeResultSent:
			self->feedbackMsg = @"Result: Mail sent";
			break;
		case MFMailComposeResultFailed:
			self->feedbackMsg = @"Result: Mail sending failed";
			break;
		default:
			self->feedbackMsg = @"Result: Mail not sent";
			break;
	}
    
	UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"Mail Composer"
                                                    message:self->feedbackMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertV show];
    
    [alertV release];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
}




-(void)dealloc
{
    [locationManager stopUpdatingLocation];
    [_worldView release];
    [_activityIndicator release];
    [_locationTextField release];
    [_locationUpdate release];
    
    [geocoder release];
    
    [_mapTypeControl release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setWorldView:nil];
    [self setActivityIndicator:nil];
    [self setLocationTextField:nil];
    [self setLocationUpdate:nil];
    [self setMapTypeControl:nil];
    [super viewDidUnload];
}
@end
