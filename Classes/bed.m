//
//  bed.m
//  Battery
//
//  Created by theNotSoBrightLazyNovice on 6/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "bed.h"
@interface bed ()

-(void)toenableBatteryMonitoring;
-(float)batteryLevelDidChange;
-(NSString *)batteryStateDidChange;

@end




@implementation bed

@synthesize devcBatteryState,devcBatteryLevel;
@synthesize currentBatteryState,currentBatteryLevel;

-(id)init
{
	self = [super init];
	if (self) {
		
		//enable battery monitoring
		[self toenableBatteryMonitoring];
			
	}
	return self;
}

-(void)dealloc
{
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	//disable battery monitoring
	[currentDevice_ setBatteryMonitoringEnabled:NO];
	
	//remove Notification
	[[NSNotificationCenter defaultCenter]removeObserver:self];
	
	
	[devcBatteryState release];
	[currentBatteryState release];
	[super dealloc];
}



//enableBattery Monitoring
-(void)toenableBatteryMonitoring
{
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	//enable battery monitoring
	[currentDevice_ setBatteryMonitoringEnabled:YES];
	
	float batteryLeft  = [currentDevice_ batteryLevel];
	int   bState	   = [currentDevice_ batteryState];
	
	int battery_Level_=(batteryLeft*100);
	
	NSLog(@"Battry Level is :%d and Battery Status is :%d",battery_Level_,bState);
	NSString *battery_State_ ;
	
	switch (bState)
	{
		case UIDeviceBatteryStateUnplugged:
		{
			battery_State_ = @"BatteryStateUnknown";
			break;
		}
		case UIDeviceBatteryStateCharging:
		{
			battery_State_ = @"BatteryStateCharging";
			break;
		}
		case UIDeviceBatteryStateFull:
		{
			battery_State_ = @"BatteryStateFull";
			break;
		}
		default:
		{
			battery_State_ = @"BatteryStateUnknown";
			break;
		}
	}
	
	NSLog(@"BatteryLevel-->%d",battery_Level_);
	//[self setDevcbatteryLevel:batteryLevel_];
	[self setCurrentBatteryLevel:battery_Level_];
	
	NSLog(@"BatteryState-->%@",battery_State_);
	[self setCurrentBatteryState:battery_State_];
	
	
	//addObserver for UIDeviceBatteryStateDidChangeNotification
	[[NSNotificationCenter defaultCenter]addObserver:self
											selector:@selector(batteryStateDidChange:)
												name:UIDeviceBatteryStateDidChangeNotification 
											  object:nil];
	
	
	//addObserver for UIDeviceBatteryLevelDidChangeNotification
	[[NSNotificationCenter defaultCenter]addObserver:self
											selector:@selector(batteryLevelDidChange:)
												name:UIDeviceBatteryLevelDidChangeNotification 
											  object:nil];
	
}

-(float)batteryLevelDidChange
{
	NSLog(@"UIDeviceBatteryLevelDidChangeNotification");
	
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	float batteryLevel_ ;
	if ([currentDevice_ batteryLevel]) {
		batteryLevel_ = [currentDevice_ batteryLevel];		
	}
	else {
		batteryLevel_ = 0.0;
	}
	[self setDevcBatteryLevel:batteryLevel_];
	return batteryLevel_;
	
}

/*
 typedef enum {
 UIDeviceBatteryStateUnknown,
 UIDeviceBatteryStateUnplugged,
 UIDeviceBatteryStateCharging,
 UIDeviceBatteryStateFull,
 } UIDeviceBatteryState;
 */
-(NSString *)batteryStateDidChange
{
	NSLog(@"UIDeviceBatteryStateDidChangeNotification");
	
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *batteryState_ ;
	if ([currentDevice_ batteryState]) {
		//batteryState_ = [currentDevice_ batteryState];
		switch ([currentDevice_ batteryState]) {
			case UIDeviceBatteryStateUnknown:
				batteryState_ = @"BatteryStateUnknown";
				break;
				
			case UIDeviceBatteryStateUnplugged:
				batteryState_ = @"BatteryStateUnplugged";
				break;
				
			case UIDeviceBatteryStateCharging:
				batteryState_ = @"BatteryStateCharging";
				break;
				
			case UIDeviceBatteryStateFull:
				batteryState_ = @"BatteryStateFull";
				break;
				
			default:
				batteryState_ = @"BatteryStateUnknown";
				break;
		}
		
	}
	else {
		batteryState_ = @" ";
	}
	
	[self setDevcBatteryState:batteryState_];
	return batteryState_;
	
}

@end
