//
//  PossessionController.m
//  RandomPossession
//
//  Created by lockUp on 6/20/13.
//  Copyright (c) 2013 lockUp. All rights reserved.
//

#import "PossessionController.h"
#import "Possession.h"

#import "InfoStat.h"
@implementation PossessionController

@synthesize pNAmeforPhoneDetailsCount;
@synthesize pNAmeforBatteryCount;
@synthesize pNAmeforOperatingSystemCount;
@synthesize pNAmeforCPUUSageCount;
@synthesize pNAmeforMemoryUSageCount;
@synthesize pNAmeforCellularNetworkCount;
@synthesize pNAmeforWiFiNetworkCount;
@synthesize pNAmeforDiskCount;
@synthesize pNAmeforSystemRunTimeCount;
@synthesize pNAmeforHardwareSpecificationCount;
@synthesize arrayOfCategoriesCount;



@synthesize pNAmeModel;
@synthesize pNAmeVersion;
@synthesize pNAmeName;
@synthesize pNAmeJailbroken;
@synthesize pNAmeUDID;
@synthesize pNAmeSignalStrength;
@synthesize pNAmeIMEA;
@synthesize pNAmeTotalNumberOfApps;


@synthesize pNAmeBattery;
@synthesize pNAmeBatteryLeft;



@synthesize pNAmeOS;
@synthesize pNAmeOSVersion;
@synthesize pNAmeKernel;



@synthesize pNAmeInUse;
@synthesize pNAmeSystem;
@synthesize pNAmeIdle;



@synthesize pNAmeTotal;
@synthesize pNAmeUsed;
@synthesize pNAmeFree;



@synthesize pNAmeCellularStatus;


@synthesize pNAmeMACAddress;
@synthesize pNAmeIPAddress;
@synthesize pNAmeWiFiStatus;



@synthesize pNAmeDiskFree;
@synthesize pNAmeDiskUsed;



@synthesize pNAmeBootUpDate;
@synthesize pNAmeRunTime;


@synthesize pNAmeCPU;
@synthesize pNAmeFrequency;
@synthesize pNAmeSize;
@synthesize pNAmeWeight;
@synthesize pNAmeScreenSize;
@synthesize pNAmeScreenResolution;
@synthesize pNAmePixelDensity;
@synthesize pNAmeBatteryVoltage;
@synthesize pNAmeBatteryCapacity;
@synthesize pNAmeWiFiTypesSupported;
@synthesize pNAmeBlueToothVersion;
@synthesize pNAmeRearCamera;
@synthesize pNAmeFrontCamera;
@synthesize pNAmeThreeAxisGyroscopeAvailability;
@synthesize pNAmeOrientationSensor;
@synthesize pNAmeDistanceSensor;
@synthesize pNAmeAmbientLightSensor;


//return an instance of Possession Class
-(id)randomPossesionS
{
	//seed the random
	srand([[NSDate date]timeIntervalSince1970]);
    //Create an array of 3 adjectives
	NSMutableArray* randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                    @"Rusty",
									@"Shiny",nil];
    //NSLog(@"randomAdjectiveList %@",[randomAdjectiveList description]);
	
	//Create an array of three nouns
	NSMutableArray* randomNounList      = [NSArray arrayWithObjects:@"Bear",
									@"Spork",@"Mac",nil];
    //NSLog(@"randomNounList %@",[randomNounList description]);
	
	//Get the index of a random adjective/noun from the lists
	//Note:The % operrator,called modulo operator,gives
	//you th eremainder.So adjectiveIndex is a random number
	//from 0 to 1 inclusive.
	int adjectiveIndex = rand() % [randomAdjectiveList count];
	int nounIndex	   = rand() % [randomNounList count];
	
	NSString* randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue  = rand() % 100;
    
	NSString* randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
									'0' + rand() % 10,
									'A' + rand() % 26,
									'0' + rand() % 10,
									'A' + rand() % 26,
									'0' + rand() % 10];
    
    
    
    Possession *nuPossesion = [[Possession alloc]init];
    [nuPossesion setPossessionName:randomName];
    [nuPossesion setValueInDollars:randomValue];
    [nuPossesion setSerialNumber:randomSerialNumber];
    
    return [nuPossesion autorelease];
    
    }

//instead of returnng random value we return Meaningfull and different text

-(id)otherValues
{
	Possession *nuPossesion = [[Possession alloc]init];
	
	NSMutableArray* pNAmeforPhoneDetails =  [NSArray arrayWithObjects:
					   @"Model",
					   @"Version",
					   @"Name",
					   @"Jailbroken",
					   @"UDID",
					   @"Signal Strength",
					   @"IMEA",
					   @"Total Number of apps",nil];
	
	NSMutableArray* pNAmeforBattery =  [NSArray arrayWithObjects:
									  @"Battery \%",
									  @"Battery Left",
									  nil];
	
	NSMutableArray* pNAmeforOperatingSystem =  [NSArray arrayWithObjects:
								 @"OS",
								 @"OS Version",
										 @"Kernel",
								 nil];
	
	NSMutableArray* pNAmeforCPUUSage =  [NSArray arrayWithObjects:
										 @"In Use",
										 @"System",
										 @"Idle",
										 nil];
	
	NSMutableArray* pNAmeforMemoryUSage =  [NSArray arrayWithObjects:
								  @"Total",
								  @"Used",
								  @"Free",
								  nil];
	
	NSMutableArray* pNAmeforCellularNetwork =  [NSArray arrayWithObjects:
									 @"Status",
									 nil];
	
	NSMutableArray* pNAmeforWiFiNetwork =  [NSArray arrayWithObjects:
										 @"MAC Address",
									 @"IP Address",
									 @"Status",
										 nil];
	
	NSMutableArray* pNAmeforDisk =  [NSArray arrayWithObjects:
									 @"Free",
									 @"Used",
									  nil];
	
	NSMutableArray* pNAmeforSystemRunTime =  [NSArray arrayWithObjects:
							  @"Boot Up Date",
							  @"Run Time",
							  nil];
	
	NSMutableArray* pNAmeforHardwareSpecification =  [NSArray arrayWithObjects:
									  @"CPU",
									   @"Frequency",
									 // @"Size",
									//  @"Weight",
									  //@"Screen Size",
									  @"Screen Resolution",
									  @"Resolution (after scaling)",
									 // @"Battery Voltage",
									 // @"Battery Capacity",
									  // @"Wi-Fi - Types Supported",
									  //@"BlueTooth - Version",
									   @"Rear Camera",
									  @"Front camera",
									   @"Three-axis Gyroscope",
									   @"Orientation Sensor",
									  @"Motion Sensor",
									   @"Magnetometer",
									   nil];
	
	
	NSArray *arrayOfCategories = [NSArray arrayWithObjects:
								  pNAmeforPhoneDetails,
								  pNAmeforBattery,
								  pNAmeforOperatingSystem,
								  pNAmeforCPUUSage,
								  pNAmeforMemoryUSage,
								  pNAmeforCellularNetwork,
								  pNAmeforWiFiNetwork,
								  pNAmeforDisk,
								  pNAmeforSystemRunTime,
								  pNAmeforHardwareSpecification,
								  nil];
	
	for(int i =0;i<[arrayOfCategories count];i++)
	{
		for(int k =0 ; k < [[arrayOfCategories objectAtIndex:i]count];k++)
		{
			//get first Array in CategoryARRAy
			NSArray *tempArray = [arrayOfCategories objectAtIndex:i];
			//NSLog(@"tempArray --> %@",[tempArray description]);
			
			//get the element in category array
			NSString *tempString = [tempArray objectAtIndex:k];
			NSLog(@"tempString --> %@",[tempString description]);
			
			[nuPossesion setPossessionName:tempString];
			//[nuPossesion setValueInDollars:randomValue];
			//[nuPossesion setSerialNumber:randomSerialNumber];
		}
	}
		
	
   
    
    return [nuPossesion autorelease];
	
}

///Returns an array with contents of Type Possession
-(NSMutableArray* )newOtherValues
{
	NSLog(@"newOtherValues");
	[self callAll];
	
	
	[self setPNAmeModel:[info model]];
	[self setPNAmeVersion:[info localizedModelOf]];
	[self setPNAmeName:[info name]];
	[self setPNAmeJailbroken:@"No"];
	[self setPNAmeUDID:[info uDID]];
	[self setPNAmeSignalStrength:@"sadds"];
	[self setPNAmeIMEA:@"sadds"];
	[self setPNAmeTotalNumberOfApps:@"sadds"];
	
	
	[self setPNAmeBattery:[info devcBatteryState]];
	[self setPNAmeBatteryLeft:
     [NSString stringWithFormat:@"%d",[info devcBatteryLevel]]];
	
	
	
	[self setPNAmeOS:[info oS]];
	[self setPNAmeOSVersion:[info oSVersion]];
	[self setPNAmeKernel:@"sadds"];
	
	
	
	[self setPNAmeInUse:[NSString stringWithFormat:@"%.02f %%",[info wiredMemory]]];
	[self setPNAmeSystem:[NSString stringWithFormat:@"%.02f %%",[info activeMemory]]];
	[self setPNAmeIdle:[NSString stringWithFormat:@"%.02f %%",[info inactiveMemory]]];
	
	
	
	[self setPNAmeTotal:[NSString stringWithFormat:@"%.02f MB",[info totalMemory]]];
	[self setPNAmeUsed:[NSString stringWithFormat:@"%.02f MB",[info usedMemory]]];
	[self setPNAmeFree:[NSString stringWithFormat:@"%.02f MB",[info freeMemory]]];
	
	
	
	[self setPNAmeCellularStatus:[info carrName]];
	
	
	[self setPNAmeMACAddress:[info macAddress]];
	[self setPNAmeIPAddress:[info ipAddres]];
	[self setPNAmeWiFiStatus:[info internetReachability]];
	
	
	
	[self setPNAmeDiskFree:[info freeDiskSpace]];
	[self setPNAmeDiskUsed:[info usedDiskSpace]];
	
	
	
	[self setPNAmeBootUpDate:[info bootupTime]];
	[self setPNAmeRunTime:@"sadds"];
	
	
	[self setPNAmeCPU:[info cpuName]];
	[self setPNAmeFrequency:[info cpufrequency]];
	[self setPNAmeSize:@"sadds"];
	[self setPNAmeWeight:@"sadds"];
	[self setPNAmeScreenSize:@"sadds"];
	[self setPNAmeScreenResolution:[info screenResolution]];
	[self setPNAmePixelDensity:[info pixelDensity]];
	[self setPNAmeBatteryVoltage:@"sadds"];
	[self setPNAmeBatteryCapacity:@"sadds"];
	[self setPNAmeWiFiTypesSupported:@"sadds"];
	[self setPNAmeBlueToothVersion:@"sadds"];
	[self setPNAmeRearCamera:[info rearCamera]];
	[self setPNAmeFrontCamera:[info frontCamera]];
	[self setPNAmeThreeAxisGyroscopeAvailability:[info gyroAvail]];
	[self setPNAmeOrientationSensor:[info accelAvail]];
	[self setPNAmeDistanceSensor:[info motionAvail]];
	[self setPNAmeAmbientLightSensor:[info magnetoAvail]];
	
	///----------------/ TEXT LABELS /-----------------////
	NSMutableArray* pNAmeforPhoneDetails =  [NSArray arrayWithObjects:
									  @"Model",
									  @"Version",
									  @"Name",
									  @"Jailbroken",
									  @"UDID",
									 // @"Signal Strength",
									 // @"IMEA",
									 // @"Total Number of apps",
                                      nil];
	
	NSMutableArray* pNAmeforBattery =  [NSArray arrayWithObjects:
								 @"Battery \%",
								 @"Battery Left",
								 nil];
	
	NSMutableArray* pNAmeforOperatingSystem =  [NSArray arrayWithObjects:
										 @"OS",
										 @"OS Version",
										 //@"Kernel",
										 nil];
	
	NSMutableArray* pNAmeforCPUUSage =  [NSArray arrayWithObjects:
								  @"In Use",
								  //@"System",
								  @"Idle",
								  nil];
	
	NSMutableArray* pNAmeforMemoryUSage =  [NSArray arrayWithObjects:
									 @"Total",
									 @"Used",
									 @"Free",
									 nil];
	
	NSMutableArray* pNAmeforCellularNetwork =  [NSArray arrayWithObjects:
										 @"Status",
										 nil];
	
	NSMutableArray* pNAmeforWiFiNetwork =  [NSArray arrayWithObjects:
									 @"MAC Address",
									 @"IP Address",
									 @"Status",
									 nil];
	
	NSMutableArray* pNAmeforDisk =  [NSArray arrayWithObjects:
							  @"Free",
							  @"Used",
							  nil];
	
	NSMutableArray* pNAmeforSystemRunTime =  [NSArray arrayWithObjects:
									   @"Boot Up Date",
									   //@"Run Time",
									   nil];
	
	NSMutableArray* pNAmeforHardwareSpecification =  [NSArray arrayWithObjects:
											   @"CPU",
											   @"Frequency",
											   //@"Size",
											   //@"Weight",
											   //@"Screen Size",
											   @"Screen Resolution",
											   @"Resolution (after scaling)",
											  // @"Battery Voltage",
											  // @"Battery Capacity",
											   //@"Wi-Fi - Types Supported",
											  // @"BlueTooth - Version",
											   @"Rear Camera",
											   @"Front camera",
											   @"Three-axis Gyroscope",
											   @"Orientation Sensor",
											   @"Motion Sensor",
											   @"Magnetometer",
											   nil];
	
    ///----------------/ TEXT LABELS /-----------------////
    
	

	///----------------/ VAlue LABELS /-----------------////
	
	NSMutableArray* pVAlueforPhoneDetails = [NSArray arrayWithObjects: [self   pNAmeModel],
									  [self   pNAmeVersion],
									  [self   pNAmeName],
									  [self   pNAmeJailbroken],
									  [self   pNAmeUDID],
									  [self   pNAmeSignalStrength],
									  [self   pNAmeIMEA],
									  [self   pNAmeTotalNumberOfApps],nil];
	
	NSMutableArray* pVAlueforBattery = [NSArray arrayWithObjects:[self  pNAmeBattery],
								 [self  pNAmeBatteryLeft],nil];
	
	NSMutableArray* pVAlueforOperatingSystem= [NSArray arrayWithObjects:[self  pNAmeOS],
										[self  pNAmeOSVersion],
										[self  pNAmeKernel],nil];
	
	NSMutableArray* pVAlueforCPUUSage= [NSArray arrayWithObjects: [self  pNAmeInUse],
								 [self  pNAmeSystem],
								 [self  pNAmeIdle],nil];
								 
	NSMutableArray* pVAlueforMemoryUSage= [NSArray arrayWithObjects: [self  pNAmeTotal],
									[self  pNAmeUsed],
									[self  pNAmeFree],nil];
									
	NSMutableArray* pVAlueforCellularNetwork= [NSArray arrayWithObjects: [self  pNAmeCellularStatus],nil];
	
	NSMutableArray* pVAlueforWiFiNetwork= [NSArray arrayWithObjects: [self  pNAmeMACAddress],
									[self  pNAmeIPAddress],
									[self  pNAmeWiFiStatus],nil];
	
	NSMutableArray* pVAlueforDisk= [NSArray arrayWithObjects: [self  pNAmeDiskFree],
							 [self  pNAmeDiskUsed],nil];
	
	NSMutableArray* pVAlueforSystemRunTime= [NSArray arrayWithObjects:[self  pNAmeBootUpDate],
									  [self  pNAmeRunTime],nil];
	
	NSMutableArray* pVAlueforHardwareSpecification= [NSArray arrayWithObjects:[self  pNAmeCPU],
											  [self  pNAmeFrequency],
											  //[self  pNAmeSize],
											 // [self  pNAmeWeight],
											 // [self  pNAmeScreenSize],
											  [self  pNAmeScreenResolution],
											  [self  pNAmePixelDensity],
											  //[self  pNAmeBatteryVoltage],
											 // [self  pNAmeBatteryCapacity],
											 // [self  pNAmeWiFiTypesSupported],
											 // [self  pNAmeBlueToothVersion],
											  [self  pNAmeRearCamera],
											  [self  pNAmeFrontCamera],
											  [self  pNAmeThreeAxisGyroscopeAvailability],
											  [self  pNAmeOrientationSensor],
											  [self  pNAmeDistanceSensor],
											  [self  pNAmeAmbientLightSensor]
											  , nil];
	

	///----------------/ VALUE LABELS /-----------------////
	
	
    NSArray *arrayOfValues = [NSArray arrayWithObjects:
							   pVAlueforPhoneDetails,
							   pVAlueforBattery,
							   pVAlueforOperatingSystem,
							   pVAlueforCPUUSage,
							   pVAlueforMemoryUSage,
							   pVAlueforCellularNetwork,
							   pVAlueforWiFiNetwork,
							   pVAlueforDisk,
							   pVAlueforSystemRunTime,
							   pVAlueforHardwareSpecification,
							   nil];	
	
	NSArray *arrayOfCategories = [NSArray arrayWithObjects:
								  pNAmeforPhoneDetails,
								  pNAmeforBattery,
								  pNAmeforOperatingSystem,
								  pNAmeforCPUUSage,
								  pNAmeforMemoryUSage,
								  pNAmeforCellularNetwork,
								  pNAmeforWiFiNetwork,
								  pNAmeforDisk,
								  pNAmeforSystemRunTime,
								  pNAmeforHardwareSpecification,
								  nil];
    
    [self setArrayOfCategoriesCount:[arrayOfCategories count]];
    [self setPNAmeforPhoneDetailsCount:[pNAmeforPhoneDetails count]]; //1
    [self setPNAmeforBatteryCount:[pNAmeforBattery count]]; //2
    [self setPNAmeforOperatingSystemCount:[pNAmeforOperatingSystem count]]; //3
    [self setPNAmeforCPUUSageCount:[pNAmeforCPUUSage count]]; //4
    [self setPNAmeforMemoryUSageCount:[pNAmeforMemoryUSage count]]; //5
    [self setPNAmeforCellularNetworkCount:[pNAmeforCellularNetwork count]]; //6
    [self setPNAmeforWiFiNetworkCount:[pNAmeforWiFiNetwork count]]; //7
    [self setPNAmeforDiskCount:[pNAmeforDisk count]]; //8
    [self setPNAmeforSystemRunTimeCount:[pNAmeforSystemRunTime count]];//9
    [self setPNAmeforHardwareSpecificationCount:[pNAmeforHardwareSpecification count]];//10
    
    
	/*
    NSMutableArray* arrayOfCategoriesCount =
    [NSArray arrayWithObjects:
     [pNAmeforPhoneDetails count],
     [pNAmeforBattery count],
     [pNAmeforOperatingSystem count],
     [pNAmeforCPUUSage count],
     [pNAmeforMemoryUSage count],
      [pNAmeforCellularNetwork count],
      [pNAmeforWiFiNetwork count],
      [pNAmeforDisk count],
      [pNAmeforSystemRunTime count],
      [pNAmeforHardwareSpecification count],
     nil];
    */
    
	 
	for(int i =0;i<[arrayOfCategories count];i++)
	{
		for(int k =0 ; k < [[arrayOfCategories objectAtIndex:i]count];k++)
		{
			//get first Array in CategoryARRAy
			NSArray *tempArray = [arrayOfCategories objectAtIndex:i];
			//NSLog(@"tempArray --> %@",[tempArray description]);
			
			//get the element in category array
			NSString *tempString = [tempArray objectAtIndex:k];
			//NSLog(@"tempString --> %@",[tempString description]);
			
			
			
			//get first Array in arrayOfValues
			NSArray *tempValueArray = [arrayOfValues objectAtIndex:i];
			NSLog(@"tempValueArray --> %@",[tempValueArray description]);
			
			//get the element in arrayOfValues array
			NSString *tempValueString = [tempValueArray objectAtIndex:k];
			NSLog(@"tempValueString --> %@",[tempValueString description]);
			
			
			Possession *nuPossesion = [[Possession alloc]init];
			[nuPossesion setPossessionName:tempString];
			[nuPossesion setValueInDollars:i];
			[nuPossesion setSerialNumber:tempValueString];
			
			//NSLog(@"possessionName --> %@",[nuPossesion possessionName]);
			//NSLog(@"valueInDollars --> %d",[nuPossesion valueInDollars]);
			
			//add it to the Holder array and release it;
			[holderArrayForPossessionObjects addObject:nuPossesion];
			//release nuPossession
			[nuPossesion release];	
		}
	}
	
	
	
    //previous logic had this return the Object
    //return [nuPossesion autorelease];
	//NSLog(@"holderArrayForPossessionObjects --> %@",[holderArrayForPossessionObjects description]);
    NSError *error;
    
    NSData* archiveData;
    archiveData = [NSKeyedArchiver archivedDataWithRootObject:holderArrayForPossessionObjects];
    
    //write to a file
    NSFileManager *fileman = [NSFileManager defaultManager];
    
    NSArray *paths;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory;
    documentDirectory = [paths objectAtIndex:0];
    
    NSString *pathToWriteTo;
    pathToWriteTo = [documentDirectory stringByAppendingPathComponent:@"systemInfo.plist"];
    
    BOOL fileWiteStatus;
    if ([fileman fileExistsAtPath:pathToWriteTo]) {
        
        [fileman removeItemAtPath:pathToWriteTo error:nil];
        
        //fileWiteStatus = [strayArray writeToFile:pathToWriteTo atomically:YES];
        fileWiteStatus = [archiveData writeToFile:pathToWriteTo options:NSDataWritingAtomic error:&error];
        NSLog(@"\n<-------FileWriteStatus----> %@ -- %d \n",fileWiteStatus ? @"YES" : @"NO",fileWiteStatus);
        /*
        if (error) {
            NSLog(@"\n<-------localizedDescription----> %@ --  \n",[error localizedDescription]);
        }
        */
    }
    
    else
    {
        
        fileWiteStatus = [archiveData writeToFile:pathToWriteTo options:NSDataWritingAtomic error:&error];
        NSLog(@"\n<-------FileWriteStatus----> %@ -- %d \n",fileWiteStatus ? @"YES" : @"NO",fileWiteStatus);
        /*
        if (error) {
            NSLog(@"\n<-------localizedDescription----> %@ --  \n",[error localizedDescription]);
        }
         */

        
    }

    
    
	
    return holderArrayForPossessionObjects;
	
}


/*
-(NSArray *)returnArrayOfCategoriesCount
{
    return arrayOfCategoriesCount;
}

*/

- (id)init
{
	NSLog(@"init");
    self = [super init];
    if (self) {
		
        // Add your subclass-specific initialization here.
        // If an error occurs here, send a [self release] message and return nil.
		//Instnatiate the array
		holderArrayForPossessionObjects = [[NSMutableArray alloc]init];
        
        info = [[InfoStat alloc]init];
        
        
        
		
    }
    return self;
}

-(void) dealloc
{
	NSLog(@"dealloc");
	[holderArrayForPossessionObjects release];
    [info release];
    
	[super dealloc];
}


-(void)callAll
{
    [info callAll];
    
}



@end
