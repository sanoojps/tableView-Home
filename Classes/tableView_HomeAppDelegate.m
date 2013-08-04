//
//  tableView_HomeAppDelegate.m
//  tableView-Home
//
//  Created by theNotSoBrightLazyNovice on 6/27/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import "tableView_HomeAppDelegate.h"
//#import "ItemsViewController.h"

#import "SmartExchangeController.h"

#import "bed.h"


#import "ViewController.h"


#import "OldViewController.h"

@implementation tableView_HomeAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	
    /*
	bed *nuBed = [[bed alloc]init];
	NSLog(@"batteryLevel-->%d",[nuBed devcBatteryLevel]);
	NSLog(@"batteryState --> %@",[nuBed devcBatteryState]);
	
	[nuBed release];
	nuBed = nil;
     */
	
	
	///FOR TABLE WITH NAVIGATION CONTROLLER
	/*
	//tableView
	ItemsViewController *itemsViewController = 
	[[ItemsViewController alloc]init];
	
	//view 2
	//Adding UINavigationController
	UINavigationController *navController = [[UINavigationController alloc]
											 initWithRootViewController:itemsViewController];
	[itemsViewController release];
	itemsViewController = nil;
	
	[[self window]setRootViewController:navController];	
											 
	*///FOR TABLE WITH NAVIGATION CONTROLLER
											 
											 
		/* for NORMAL TABLEVIEW 									 
	ItemsViewController *itemsViewController = 
											 [[ItemsViewController alloc]init];									 
											 
	[[self window]setRootViewController:itemsViewController];	
	
	[itemsViewController release];
	itemsViewController = nil;
	*/
		
	
	UITabBarController *tabBarController = [[UITabBarController alloc]init];
	
	
	//FOR Just Plain VIEW
	//view 1
	SmartExchangeController* smartExchangeViewController = 
	[[SmartExchangeController alloc]init];
	
	///VIEW 1 WITH  NAVIGATION CONTROLLER
	
	UINavigationController *firstTabNavController = 
	[[UINavigationController alloc]initWithRootViewController:smartExchangeViewController];
	[[firstTabNavController navigationBar]setBarStyle:UIBarStyleBlackOpaque];
	
	
	[[firstTabNavController tabBarItem]setTitle:@"Smart Exchange"];
	[[firstTabNavController tabBarItem]setImage:[UIImage imageNamed:@"star"]];
	
    [smartExchangeViewController release];
	smartExchangeViewController = nil;
	
	
	
	//tableView
	//ItemsViewController *itemsViewController =
	//[[ItemsViewController alloc]init];
	
	/*
	//view 2
	//Adding UINavigationController
	UINavigationController *navController = [[UINavigationController alloc]
											 initWithRootViewController:itemsViewController];
	
	[[navController tabBarItem]setTitle:@"Info"];
	[[navController navigationBar]setBarStyle:UIBarStyleBlackOpaque];
	
	[itemsViewController release];
	itemsViewController = nil;
	
	*/
    
    //View 3
    ///*
    ViewController *thirdViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //[[thirdViewController tabBarItem]setTitle:@"Location"];
	
    UINavigationController *thirdNavController = [[UINavigationController alloc]
                                                  initWithRootViewController:thirdViewController];
    [[thirdNavController tabBarItem]setTitle:@"Location"];
    [[thirdNavController navigationBar]setBarStyle:UIBarStyleBlackOpaque];
    [[thirdNavController tabBarItem]setImage:[UIImage imageNamed:@"earth-usa.png"]];

    //*/
    
    
    //View 4
    
    OldViewController *fourthViewController = [[OldViewController alloc] initWithNibName:@"OldViewController" bundle:nil];
    //[[thirdViewController tabBarItem]setTitle:@"Location"];
	
    UINavigationController *FourthNavController = [[UINavigationController alloc]
                                                  initWithRootViewController:fourthViewController];
    [[FourthNavController tabBarItem]setTitle:@"System Info"];
    [[FourthNavController navigationBar]setBarStyle:UIBarStyleBlackOpaque];
    [[FourthNavController tabBarItem]setImage:[UIImage imageNamed:@"info"]];
    
    
    
    
	//array with single view controller
	/*
	NSArray *viewControllers = [NSArray arrayWithObjects:smartExchangeViewController,
								navController,nil];
	 */
	
	//array With both nav controllers
	
	NSArray *viewControllers = [NSArray arrayWithObjects:firstTabNavController,
								
                                //navController,
                                thirdNavController,
                                FourthNavController,
                                nil];

	
	
	[firstTabNavController release];
	firstTabNavController = nil;
	
	
	//[navController release];
	//navController = nil;
    
    [thirdViewController release];
    thirdViewController = nil;
    
    [thirdNavController release];
    thirdNavController = nil;
	
    
    [fourthViewController release];
    fourthViewController = nil;
    
    [FourthNavController release];
    FourthNavController = nil;
    
    
    
    
	[tabBarController setViewControllers:viewControllers animated:YES];
	
	[[self window]setRootViewController:tabBarController];
	[tabBarController release];
	tabBarController = nil;
	
	

    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
