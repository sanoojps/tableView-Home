//
//  SmartExchangeController.m
//  tableView-Home
//
//  Created by theNotSoBrightLazyNovice on 6/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "SmartExchangeController.h"
#import "ItemDetailViewController.h"
#import "SVController.h"





@implementation SmartExchangeController

@synthesize emailTxtField;
@synthesize nameTxtField;

@synthesize billingButton;
@synthesize salesButton;
@synthesize technicalButton;


- (IBAction)billingButtonClicked:(id)sender {
	
	SVController *newView = [[SVController alloc]initWithNibName:@"SVController"
																  bundle:nil];
	
	[[newView navigationItem]setTitle:@"Billing"];
	
	//[[self navigationController]pushViewController:newView animated:YES];
	
	[newView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
	
	//[newView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
	[newView setModalPresentationStyle:UIModalPresentationFormSheet];
	
	[self presentModalViewController:newView animated:YES];
	
	[newView release];
	newView = nil ;
}

- (IBAction)salesButtonClicked:(id)sender {
	
	[emailTxtField resignFirstResponder];
	[nameTxtField resignFirstResponder];
	
	
    
}

- (IBAction)technicalButtonClicked:(id)sender {
    
}

- (IBAction)makeKeyBoardGoAway:(id)sender {
    
	[emailTxtField resignFirstResponder];
	[nameTxtField resignFirstResponder];
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		UITabBarItem *tbi = [self tabBarItem];
		//set title
		
		[tbi setTitle:@"Smart Exchange"];
		
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
}


- (void)dealloc {
    [super dealloc];
}


-(id)init
{
	//superClass
	self = [super init];
	
	
	if (self) {
		
		//Configure UINAVIGATIONCONTROLLER
		
		[[self navigationItem]setTitle:@"SMART EXCHANGE"];
		
		
        
	}
	
	return self;
}




#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

@end
