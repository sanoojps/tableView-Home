//
//  PossessionController.h
//  RandomPossession
//
//  Created by lockUp on 6/20/13.
//  Copyright (c) 2013 lockUp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class InfoStat;

@class Possession;
//Controls the Possession Class


@interface PossessionController : NSObject

{
    //info Object
    InfoStat *info;
    
    //local array holding the members
    NSMutableArray* holderArrayForPossessionObjects;
   // NSArray* arrayOfCategoriesCount;
    
    
    int pNAmeforPhoneDetailsCount;
    int pNAmeforBatteryCount;
    int pNAmeforOperatingSystemCount;
    int pNAmeforCPUUSageCount;
    int pNAmeforMemoryUSageCount;
    int pNAmeforCellularNetworkCount;
    int pNAmeforWiFiNetworkCount;
    int pNAmeforDiskCount;
    int pNAmeforSystemRunTimeCount;
    int pNAmeforHardwareSpecificationCount;
    int arrayOfCategoriesCount;
    
    
    NSString*  pNAmeModel;
	NSString*  pNAmeVersion;
    NSString*  pNAmeName;
    NSString*  pNAmeJailbroken;
    NSString*  pNAmeUDID;
    NSString*  pNAmeSignalStrength;
    NSString*  pNAmeIMEA;
    NSString*  pNAmeTotalNumberOfApps;
	
	
    NSString* pNAmeBattery;
    NSString* pNAmeBatteryLeft;
                        
	
	
    NSString* pNAmeOS;
    NSString* pNAmeOSVersion;
    NSString* pNAmeKernel;
									
	
	
    NSString* pNAmeInUse;
    NSString* pNAmeSystem;
    NSString* pNAmeIdle;
								  
	
	
    NSString* pNAmeTotal;
    NSString* pNAmeUsed;
    NSString* pNAmeFree;
									 
	
	
    NSString* pNAmeCellularStatus;
										 
	
    NSString* pNAmeMACAddress;
    NSString* pNAmeIPAddress;
    NSString* pNAmeWiFiStatus;
									 
	
	
    NSString* pNAmeDiskFree;
    NSString* pNAmeDiskUsed;
							  
	
	
    NSString* pNAmeBootUpDate;
    NSString* pNAmeRunTime;
				
	
	
    NSString* pNAmeCPU;
    NSString* pNAmeFrequency;
    NSString* pNAmeSize;
    NSString* pNAmeWeight;
    NSString* pNAmeScreenSize;
    NSString* pNAmeScreenResolution;
    NSString* pNAmePixelDensity;
    NSString* pNAmeBatteryVoltage;
    NSString* pNAmeBatteryCapacity;
    NSString* pNAmeWiFiTypesSupported;
    NSString* pNAmeBlueToothVersion;
    NSString* pNAmeRearCamera;
    NSString* pNAmeFrontCamera;
    NSString* pNAmeThreeAxisGyroscopeAvailability;
    NSString* pNAmeOrientationSensor;
    NSString* pNAmeDistanceSensor;
    NSString* pNAmeAmbientLightSensor;
                    
    
}

-(id)randomPossesionS;
-(id)otherValues;


///This returns an NSMUtable Array of with members of type POSSESSION
///This array will be filled in will all data necesary to fill the TableVIew

-(NSMutableArray* )newOtherValues;

@property(nonatomic,assign) int pNAmeforPhoneDetailsCount;
@property(nonatomic,assign) int pNAmeforBatteryCount;
@property(nonatomic,assign) int pNAmeforOperatingSystemCount;
@property(nonatomic,assign) int pNAmeforCPUUSageCount;
@property(nonatomic,assign) int pNAmeforMemoryUSageCount;
@property(nonatomic,assign) int pNAmeforCellularNetworkCount;
@property(nonatomic,assign) int pNAmeforWiFiNetworkCount;
@property(nonatomic,assign) int pNAmeforDiskCount;
@property(nonatomic,assign) int pNAmeforSystemRunTimeCount;
@property(nonatomic,assign) int pNAmeforHardwareSpecificationCount;
@property(nonatomic,assign) int arrayOfCategoriesCount;

@property(nonatomic,retain) NSString*  pNAmeModel;
@property(nonatomic,retain) NSString*  pNAmeVersion;
@property(nonatomic,retain) NSString*  pNAmeName;
@property(nonatomic,retain) NSString*  pNAmeJailbroken;
@property(nonatomic,retain) NSString*  pNAmeUDID;
@property(nonatomic,retain) NSString*  pNAmeSignalStrength;
@property(nonatomic,retain) NSString*  pNAmeIMEA;
@property(nonatomic,retain) NSString*  pNAmeTotalNumberOfApps;


@property(nonatomic,retain) NSString* pNAmeBattery;
@property(nonatomic,retain) NSString* pNAmeBatteryLeft;



@property(nonatomic,retain) NSString* pNAmeOS;
@property(nonatomic,retain) NSString* pNAmeOSVersion;
@property(nonatomic,retain) NSString* pNAmeKernel;



@property(nonatomic,retain) NSString* pNAmeInUse;
@property(nonatomic,retain) NSString* pNAmeSystem;
@property(nonatomic,retain) NSString* pNAmeIdle;



@property(nonatomic,retain) NSString* pNAmeTotal;
@property(nonatomic,retain) NSString* pNAmeUsed;
@property(nonatomic,retain) NSString* pNAmeFree;



@property(nonatomic,retain) NSString* pNAmeCellularStatus;


@property(nonatomic,retain) NSString* pNAmeMACAddress;
@property(nonatomic,retain) NSString* pNAmeIPAddress;
@property(nonatomic,retain) NSString* pNAmeWiFiStatus;



@property(nonatomic,retain) NSString* pNAmeDiskFree;
@property(nonatomic,retain) NSString* pNAmeDiskUsed;



@property(nonatomic,retain) NSString* pNAmeBootUpDate;
@property(nonatomic,retain) NSString* pNAmeRunTime;



@property(nonatomic,retain) NSString* pNAmeCPU;
@property(nonatomic,retain) NSString* pNAmeFrequency;
@property(nonatomic,retain) NSString* pNAmeSize;
@property(nonatomic,retain) NSString* pNAmeWeight;
@property(nonatomic,retain) NSString* pNAmeScreenSize;
@property(nonatomic,retain) NSString* pNAmeScreenResolution;
@property(nonatomic,retain) NSString* pNAmePixelDensity;
@property(nonatomic,retain) NSString* pNAmeBatteryVoltage;
@property(nonatomic,retain) NSString* pNAmeBatteryCapacity;
@property(nonatomic,retain) NSString* pNAmeWiFiTypesSupported;
@property(nonatomic,retain) NSString* pNAmeBlueToothVersion;
@property(nonatomic,retain) NSString* pNAmeRearCamera;
@property(nonatomic,retain) NSString* pNAmeFrontCamera;
@property(nonatomic,retain) NSString* pNAmeThreeAxisGyroscopeAvailability;
@property(nonatomic,retain) NSString* pNAmeOrientationSensor;
@property(nonatomic,retain) NSString* pNAmeDistanceSensor;
@property(nonatomic,retain) NSString* pNAmeAmbientLightSensor;


-(void)callAll;


@end
