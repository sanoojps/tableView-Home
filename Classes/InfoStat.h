//
//  InfoStat.h
//  RP
//
//  Created by theNotSoBrightLazyNovice on 6/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InfoStat : NSObject {
	
	//*>Phone Details
	//1.	Model
	NSString* model;
	//2.	Version
	NSString* version;
	//3.	Name
	NSString* name;
	//4.	Jailbroken
	NSString* jaikBroken;
	//5.	UDID
	NSString* uDID;
	//6.	Signal Strength
	NSString* signalStrength;
	//7.	IMEA
	NSString* IMEA;
	//8.	Total Number of apps
	NSString* totalNumberOfApps;
	
	//localizedModel
	NSString* localizedModelOf;
	
	//deviceOrienttaion
	NSString* deviceOrientation;
	
	//*>Battery
	
	//1.	Battery %
	
	//2.	Battery Left
	int devcBatteryLevel;
	//battery state
	NSString* devcBatteryState;
	
	//*>Operating System
	//1.	OS
	NSString *oS;
	//2.	OS Version
	NSString* oSVersion;
	//3.	Kernel
	
	//*>CPU Usage
	//1.	In Use
	//2.	System
	//3.	Idle
	
	//*>Memory Usage
	//1.	Total
	//2.	Used
	//3.	Free
	//4.	Breakdown of memory Usage
	//1.	Wired
	//2.	Active
	//3.	Inactive
	//4.	System
	
	//*>Cellular Network
	//1.	Status - Available/not-Available
    NSString *carrName;
	
	//*>Wi-Fi Network
	//1.	MAC Address
    NSString *macAddress;
	//2.	IP Address
    NSString *ipAddres;
	//3.	Status - Active/non-Active
	NSString* internetReachability;

    
    
	//*>Disk
	//1.	Free
    NSString *freeDiskSpace;
	//2.	Used
    NSString *usedDiskSpace;
	
	//*>System Run Time
	//1.	Boot Up Date
    NSString *bootupTime;
	//2.	Run Time
	
	//*>Hardware Specification
	//1.	CPU
    NSString *cpuName;
	//2.	Frequency
    NSString *cpufrequency;
	//3.	Size
	//4.	Weight
	//5.	Screen Size
	//6.	Screen resolution
    NSString *screenResolution;
	//7.	Pixel density
    NSString *pixelDensity;
	//8.	Battery Voltage
	//9.	Battery Capacity
	//10.	Wi-Fi - Types Supported
	//11.	BlueTooth - Version
	//12.	Rear Camera
    NSString *rearCamera;
	//13.	Front camera
    NSString *frontCamera;
	//14.	Three-axis Gyroscope - availability
	//15.	Orientation Sensor
	//16.	Distance Sensor
	//17.	Ambient Light Sensor
    
    NSString *accelAvail;
    NSString *motionAvail;
    NSString *gyroAvail;
    NSString *magnetoAvail;

    
}


@property(nonatomic,retain)NSString* model;
@property(nonatomic,retain)NSString* version;
@property(nonatomic,retain)NSString* name;
@property(nonatomic,retain)NSString* jaikBroken;
@property(nonatomic,retain)NSString* uDID;
@property(nonatomic,retain)NSString* signalStrength;
@property(nonatomic,retain)NSString* IMEA;
@property(nonatomic,retain)NSString* totalNumberOfApps;

@property(nonatomic,retain)NSString* localizedModelOf;
@property(nonatomic,retain)NSString* deviceOrientation;

@property(nonatomic,retain)NSString* oS;
@property(nonatomic,retain)NSString* oSVersion;


@property(nonatomic,assign)int devcBatteryLevel;
@property(nonatomic,retain)NSString* devcBatteryState;



//1.	Total
//2.	Used
//3.	Free
//4.	Breakdown of memory Usage
//1.	Wired
//2.	Active
//3.	Inactive
//4.	System

@property(nonatomic,assign)double freeMemory;
@property(nonatomic,assign)double usedMemory;
@property(nonatomic,assign)double totalMemory;
@property(nonatomic,assign)double activeMemory;
@property(nonatomic,assign)double inactiveMemory;
@property(nonatomic,assign)double wiredMemory;


//1.	MAC Address
@property(nonatomic,retain)NSString *macAddress;
//2.	IP Address
@property(nonatomic,retain)NSString *ipAddres;


//1.Free
@property(nonatomic,retain)NSString *freeDiskSpace;
//2.	Used
@property(nonatomic,retain)NSString *usedDiskSpace;


//Cpu frequency
@property(nonatomic,retain) NSString *cpufrequency;

//Cpu name
@property(nonatomic,retain) NSString *cpuName;

//bootTime
@property(nonatomic,retain) NSString *bootupTime;

//3. Status
@property(nonatomic,retain)NSString* internetReachability;


//screen resolution

@property(nonatomic,retain) NSString *screenResolution;



@property(nonatomic,retain)NSString *carrName;

//pixel density
@property(nonatomic,retain)NSString *pixelDensity;

@property(nonatomic,retain)NSString *rearCamera;
//13.	Front camera
@property(nonatomic,retain)NSString *frontCamera;

@property(nonatomic,retain)NSString *accelAvail;
@property(nonatomic,retain)NSString *motionAvail;
@property(nonatomic,retain)NSString *gyroAvail;
@property(nonatomic,retain)NSString *magnetoAvail;



-(void)callAll;


@end
