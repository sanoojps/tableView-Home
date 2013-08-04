//
//  ItemsViewController.m
//  ATableView
//
//  Created by theNotSoBrightLazyNovice on 6/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemDetailViewController.h"

#import "PossessionController.h"
//#import "PossessionStore.h"
#import "Possession.h"

#import "tableItemCell.h"


#import "CustomHeader.h"

#import "ActionViewController.h"

#import "CustomCellBackgroundCell.h"
@implementation ItemsViewController

@synthesize _pNAmeforPhoneDetailsCount;
@synthesize _pNAmeforBatteryCount;
@synthesize _pNAmeforOperatingSystemCount;
@synthesize _pNAmeforCPUUSageCount;
@synthesize _pNAmeforMemoryUSageCount;
@synthesize _pNAmeforCellularNetworkCount;
@synthesize _pNAmeforWiFiNetworkCount;
@synthesize _pNAmeforDiskCount;
@synthesize _pNAmeforSystemRunTimeCount;
@synthesize _pNAmeforHardwareSpecificationCount;
@synthesize _arrayOfCategoriesCount;


-(id)init
{
	//superClass style Set
	self = [super initWithStyle:UITableViewStylePlain];
	
    
	
	if (self) {
		
        //The possessio controller instance
		nuStore = [[PossessionController alloc]init];
		//strayArray = [nuStore newOtherValues];
        
        //the array that holds the data that goes into the tableView
        strayArray = [[NSMutableArray alloc]init];
		
		
		//Configure UINAVIGATIONCONTROLLER
		
		[[self navigationItem]setTitle:@"A Simpletons Table"];
		
		//ADd a bar button item
		
		//
	UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc]
										initWithBarButtonSystemItem:UIBarButtonSystemItemAction
										target:self action:@selector(clickedtheBUtton:)];//need to implement btn Action
		//action:@selector(clickedtheBUtton)
		//set this nutton as the the right item in the navigation Item
		
        [[self navigationItem]setRightBarButtonItem:rightBarBtnItem
										   animated:YES];
		
		[rightBarBtnItem release];
		rightBarBtnItem = nil;
		
		//add left button which is edit///not necessary just trying out
		
		//[[self navigationItem]setLeftBarButtonItem:[self editButtonItem] animated:YES];
        
        [[self tableView]setBackgroundColor:[UIColor viewFlipsideBackgroundColor]];
        
        /*
        UIView *imageTo = [[UIView alloc]initWithFrame:[self tableView].frame];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Vector Blue Mosaic Background.jpg"]];
        [imageTo addSubview:imageView];
        
        [[self tableView]setBackgroundView:imageTo];
        
        [imageView release];
        imageView = nil;
        [imageTo release];
        imageTo = nil;
        */
        
        //[[self tableView]setBackgroundColor:[UIColor clearColor]];
        //[[self tableView]setOpaque:NO];
        //[[self tableView]setBackgroundColor:
         //[UIColor colorWithPatternImage:
         // [UIImage imageNamed:
          // @"Vector Blue Mosaic Background.png"]]];
	
        
        //[[self tableView]setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [[self tableView]setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
	}
	
	return self;
}

int count = 0;
-(IBAction)clickedtheBUtton:(id)sender
{
    ActionViewController *avc;
    count ++;
    
    
    
        
    
    
     avc = [[ActionViewController alloc]initWithNibName:@"ActionViewController" bundle:[NSBundle mainBundle]];
    
        
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    [[avc view ]setFrame:CGRectMake
     (
     screenRect.origin.x + screenRect.size.width/2 - 20,
      screenRect.origin.y,184.0,218.0
     )];
    
    
        
        
        
        
        
        
    /*
     [self setDefinesPresentationContext:YES];
    [self setProvidesPresentationContextTransitionStyle:YES];
    
    
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    
    
    
    [self setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    
    //[self presentModalViewController:avc animated:YES];
    //[avc loadView];
    
    [self presentViewController:avc animated:YES completion:nil];
     */
    
    
    //if (avc.isViewLoaded == NO) {
    
    
    
    
    
    [self addChildViewController:avc];
        
    [[self view]addSubview:[avc view]];
        
    [avc didMoveToParentViewController:nil];
    
        
        
    
   // }
    
    //else avc.isViewLoaded
    
    
        
    
    [avc release];
    
    /*
    if (avc.isViewLoaded == YES) {
        
        //[[avc view]removeFromSuperview];
        [avc removeFromParentViewController];
    }
    
    */
    
   
}

-(void)viewDidLoad
{
	[super viewDidLoad];
	
	//returns the array created by POSSESSIONCONTROLLER CLASS's  method "newOtherValues:"
	strayArray = [nuStore newOtherValues];
	
	//categoryCount = [[NSArray alloc]init];
	
	[self set_pNAmeforPhoneDetailsCount:[nuStore pNAmeforPhoneDetailsCount]];
	[self set_pNAmeforBatteryCount:[nuStore pNAmeforBatteryCount]];
	[self set_pNAmeforOperatingSystemCount:[nuStore pNAmeforOperatingSystemCount]];
	[self set_pNAmeforCPUUSageCount:[nuStore pNAmeforCPUUSageCount]];
	[self set_pNAmeforMemoryUSageCount:[nuStore pNAmeforMemoryUSageCount]];
	[self set_pNAmeforCellularNetworkCount:[nuStore pNAmeforCellularNetworkCount]];
	[self set_pNAmeforWiFiNetworkCount:[nuStore pNAmeforWiFiNetworkCount]];
	[self set_pNAmeforDiskCount:[nuStore pNAmeforDiskCount]];
	[self set_pNAmeforSystemRunTimeCount:[nuStore pNAmeforSystemRunTimeCount]];
	[self set_pNAmeforHardwareSpecificationCount:[nuStore pNAmeforHardwareSpecificationCount]];
	[self set_arrayOfCategoriesCount:[strayArray count]];
	
	[[self view]setBackgroundColor:[UIColor whiteColor]];
	
	//When using navigationController It has to be [[self navigationController]tabBarItem]
	
	/*
	UITabBarItem *tbi = [[self navigationController]tabBarItem];
	[tbi setTitle:@"Info"];
	 */
}

/*
-(void)viewWillAppear:(BOOL)animated
{
	
	//When using navigationController It has to be [[self navigationController]tabBarItem]
	UITabBarItem *tbi = [[self navigationController]tabBarItem];
	[tbi setTitle:@"Info"];
	
	
}
*/

-(id)iniWithStyle:(UITableViewStyle)style
{
	return [self init];
}


-(void)dealloc
 {
     //[categoryCount release];
	 [strayArray release];
	 [nuStore release];
	 [super dealloc];
 }


#pragma mark -
#pragma mark UITableViewDataSource	

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section

{
	//return [strayArray count];
	//return 2;
    
    switch (section) {
        case 0:
            return [nuStore pNAmeforPhoneDetailsCount];
            break;
        case 1:
            return [nuStore pNAmeforBatteryCount];
            break;
        case 2:
            return [nuStore pNAmeforOperatingSystemCount];
            break;
        case 3:
            return [nuStore pNAmeforCPUUSageCount];
            break;
        case 4:
            return [nuStore pNAmeforMemoryUSageCount];
            break;
        case 5:
            return [nuStore pNAmeforCellularNetworkCount];
            break;
        case 6:
            return [nuStore pNAmeforWiFiNetworkCount];
            break;
        case 7:
            return [nuStore pNAmeforDiskCount];
            break;
        case 8:
            return [nuStore pNAmeforSystemRunTimeCount];
            break;
        case 9:
            return [nuStore pNAmeforHardwareSpecificationCount];
            break;
            
        default:
            return [strayArray count];
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	///*
	//Create a UITABleView cell
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableVIewCEll"];
	
	if (!cell) {
		
	cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableVIewCEll"]autorelease];
	
	}
	//*/
	
	
	/*
	///getting cutsom cell
	
	tableItemCell *cell = (tableItemCell *)[tableView dequeueReusableCellWithIdentifier:@"tableItemCell"];
	
	if (!cell) {
		
	cell = [[[tableItemCell alloc]initWithStyle:UITableViewCellStyleValue2
											   reuseIdentifier:@"tableItemCell"]autorelease];
	
	}
	*/
    
    //Disable selction BLUE highlight
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    /*
	//getting cutsom cell
	
	CustomCellBackgroundCell *cell = (CustomCellBackgroundCell *)[tableView dequeueReusableCellWithIdentifier:@"tableItemCell"];
	
	if (!cell) {
    
	cell = [[[CustomCellBackgroundCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tableItemCell"]autorelease];
	
	}
	*/
	
	int theRow = indexPath.row;
	
	
	
    switch ([indexPath section]) {
        
        case 0:
            NSLog(@"%d",theRow);//0-7
            
            break;
        case 1:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount];
            NSLog(@"%d",theRow);
            break;
        
        case 2:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount];
            NSLog(@"%d",theRow);
            break;
        
        case 3:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount];
            NSLog(@"%d",theRow);
            break;
        
        case 4:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount];
            NSLog(@"%d",theRow);
            break;
        
        case 5:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount];
            NSLog(@"%d",theRow);
			
            break;
        case 6:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount];
            NSLog(@"%d",theRow);
            break;
        
        case 7:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount]
            + [self _pNAmeforWiFiNetworkCount];
            NSLog(@"%d",theRow);
            break;
        
        case 8:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount]
            + [self _pNAmeforWiFiNetworkCount] + [self _pNAmeforDiskCount];
            NSLog(@"%d",theRow);
            break;
        
        case 9:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount]
            + [self _pNAmeforWiFiNetworkCount] + [self _pNAmeforDiskCount]
            + [self _pNAmeforSystemRunTimeCount];
            NSLog(@"%d",theRow);
            break;
            
        default:
            theRow = _arrayOfCategoriesCount;
            break;
    }
     
    
	//set The text
	Possession *p;
	p = [strayArray objectAtIndex:theRow];
	
	//[cell setPossession:p];
	
	
	///*
	//[[cell valueLabel] setText:[NSString stringWithFormat:@"%d",[p valueInDollars]]];
	//[[cell nameLabel] setText:[p possessionName]];
	
	//*/
	
	///*
	//[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
	
	
    [[cell textLabel]setText:[p possessionName]];
    
    [[cell textLabel]setTextColor:[UIColor whiteColor]];
	
	[[cell detailTextLabel]setText:[NSString stringWithFormat:@"%d",[p valueInDollars]]];
	
	[[cell detailTextLabel]setText:[p serialNumber]];
    
    [[cell detailTextLabel]setTextColor:[UIColor whiteColor]];
    
    [[cell imageView]setImage:[UIImage imageNamed:@"specs_camera_small.png"]];
	 
	 //*/
	
	
	/*
	[p release];
	p = nil;
	*/
	
	
	//[[cell textLabel] setText: @"hhaha"];
	
	//set clear color
    //[[cell textLabel ]setBackgroundColor:[UIColor clearColor]];
    //[[cell detailTextLabel]setBackgroundColor:[UIColor clearColor]];
    
    
    
	return cell;
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [nuStore arrayOfCategoriesCount];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"       Phone Details";
            break;
        case 1:
            return @"       Battery";
            break;
        case 2:
            return @"       Operating System";
            break;
        case 3:
            return @"       CPU Usage";
            break;
        case 4:
            return @"       Memory Usage";
            break;
        case 5:
            return @"       Cellular Network";
            break;
        case 6:
            return @"       WiFi Network";
            break;
        case 7:
            return @"       Disk";
            break;
        case 8:
            return @"       System Run Time";
            break;
        case 9:
            return @"       Hardware Specification";
            break;
            
        default:
            return @"       ";
            break;
    }

}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CustomHeader *customHeader = [[CustomHeader alloc]init];
    //title for headerView
    
    customHeader.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    customHeader.titleLabel.textAlignment = UITextAlignmentLeft;
    
    //if (section == 1) {
        //customHeader.lightColor = [UIColor colorWithRed:147.0/255.0 green:105.0/255.0 blue:216.0/255.0 alpha:1.0];
        
        //customHeader.darkColor = [UIColor colorWithRed:72.0/255.0 green:22.0/255.0 blue:137.0/255.0 alpha:1.0];
    //}
    
    switch (section) {
        case 0:
            [[customHeader headerImage]setImage:[UIImage imageNamed:@"iphone5-intro.jpg"]];
            break;
        case 1:
            [[customHeader headerImage]setImage:[UIImage imageNamed:@"battery_header.png"]];
            break;
        case 2:
            [[customHeader headerImage]setImage:[UIImage imageNamed:@"ios-logo-4313.jpg"]];
            break;
        case 3:
            [[customHeader headerImage]setImage:[UIImage imageNamed:@"A4-chip.jpg"]];
            break;
        case 4:
             [[customHeader headerImage]setImage:[UIImage imageNamed:@"RAM.jpg"]];
            break;
        case 5:
            [[customHeader headerImage]setImage:[UIImage imageNamed:@"Metro-Signal1-Blue-128.png"]];
            break;
        case 6:
           [[customHeader headerImage]setImage:[UIImage imageNamed:@"Wi-Fi_Logo.svg.png"]];
            break;
        case 7:
           [[customHeader headerImage]setImage:[UIImage imageNamed:@"samsung-emmc-class-1500,Q-7-353455-1.jpg"]];
            break;
        case 8:
            [[customHeader headerImage]setImage:[UIImage imageNamed:@"How-to-Change-IOS-5.0.1-Boot-Logo.png"]];
            break;
        case 9:
            [[customHeader headerImage]setImage:[UIImage imageNamed:@"lightning_hero.png"]];
            break;
            
        default:
            
            break;
    }

    
    return [customHeader autorelease];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 24.0;
}





#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    /*
	ItemDetailViewController *itemDetailViewController = 
	[[[ItemDetailViewController alloc]init]autorelease];
	
	int theRow = indexPath.row;
	
	
    switch ([indexPath section]) {
			
        case 0:
            NSLog(@"%d",theRow);//0-7
            
            break;
        case 1:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount];
            NSLog(@"%d",theRow);
            break;
			
        case 2:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount];
            NSLog(@"%d",theRow);
            break;
			
        case 3:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount];
            NSLog(@"%d",theRow);
            break;
			
        case 4:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount];
            NSLog(@"%d",theRow);
			
            break;
			
        case 5:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount];
            NSLog(@"%d",theRow);
            break;
			
        case 6:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount];
            NSLog(@"%d",theRow);
            break;
			
        case 7:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount]
            + [self _pNAmeforWiFiNetworkCount];
            NSLog(@"%d",theRow);
            break;
			
        case 8:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
            [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount]
            + [self _pNAmeforWiFiNetworkCount] + [self _pNAmeforDiskCount];
            NSLog(@"%d",theRow);
            break;
			
        case 9:
            theRow = theRow + [self _pNAmeforPhoneDetailsCount] + [self _pNAmeforBatteryCount] +
            [self _pNAmeforOperatingSystemCount] + [self _pNAmeforCPUUSageCount] +
    
        [self _pNAmeforMemoryUSageCount] + [self _pNAmeforCellularNetworkCount]
            + [self _pNAmeforWiFiNetworkCount] + [self _pNAmeforDiskCount]
            + [self _pNAmeforSystemRunTimeCount];
            NSLog(@"%d",theRow);
            break;
            
        default:
            theRow = _arrayOfCategoriesCount;
            break;
    }
	
	[itemDetailViewController setPossession:[strayArray objectAtIndex:theRow]];
	 
	//push it to the top of the navigation Controller stack
	[[self navigationController]pushViewController:itemDetailViewController animated:YES];
     */
	
}



@end 
