//
//  ItemDetailViewController.m
//  tableView-Home
//
//  Created by theNotSoBrightLazyNovice on 6/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Possession.h"

@implementation ItemDetailViewController

@synthesize dateLabel;
@synthesize nameLabel;
@synthesize serialLabel;
@synthesize valueField;

@synthesize possession;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	[nameLabel release];
	nameLabel =nil;
	
	[dateLabel release];
	dateLabel = nil;
	
	[valueField release];
	valueField = nil;
	
	[serialLabel release];
	serialLabel = nil;
	
}


- (void)dealloc {
	
	[possession release];
	
	[nameLabel release];
	[dateLabel release];
	[valueField release];
	[serialLabel release];
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[[self nameLabel]setText:[possession possessionName]];
	
	[[self serialLabel]setText:[possession serialNumber]];
	
	[[self valueField]setText:[NSString stringWithFormat:@"%d",[possession valueInDollars]]];
	
	[[self dateLabel]setText:[[NSDate date]description]];
	
	[[self navigationItem]setTitle:[possession possessionName]];
}



@end
