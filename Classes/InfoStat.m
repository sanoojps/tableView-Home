//
//  InfoStat.m
//  RP
//
//  Created by theNotSoBrightLazyNovice on 6/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//



#import "InfoStat.h"
#import <sys/utsname.h>
#import <UIKit/UIKit.h>

#import <mach/mach.h>
#import <mach/mach_host.h>

#include <sys/time.h>

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#import <dns_sd.h>

#import <net/if.h>
#import <netinet/in.h>
#import <ifaddrs.h>


#import <sys/param.h>
#import <sys/mount.h>

#import <mach/processor_info.h>

#import "Reachability.h"

#import <CoreTelephony/CTCarrier.h>

#import <CoreMotion/CoreMotion.h>



@interface InfoStat ()

//getDeviceModel
-(NSString *)getModel;
//getDeviceName
-(NSString *)getName;
//getOS
-(NSString *)getOS;
//getOSVersion
-(NSString *)getOSVersion;
//get UDID
-(NSString *)getUDID;

//getlocalizedModel
-(NSString *)getlocalizedModel;

//get deviceOrientation
-(NSString *)getdeviceOrientation;

//enableBattery Monitoring
-(void)toenableBatteryMonitoring;

-(float)batteryLevelDidChange;
-(NSString *)batteryStateDidChange;


//all memory stats
-(void)getMemoryStats;

-(void)cpuLoad;

//mac--from Erica sdun
- (NSString *) macaddress;

//ip -- from apple
static NSString* StringFromIPv4Addr( UInt32 ipv4Addr );

+ (UInt32) rawLocalAddress;

+ (NSString*) localAddress;

//diskSpace
- (void) totalDiskSpace;

-(void)osBootTime;


-(void)meReachable;


-(void)myScreenResolution;

-(void) countCores;


-(void)getPixelDensity;


-(void)cameraAvailability;


-(void)gyroAndOthers;

@end


@implementation InfoStat

@synthesize model;
@synthesize version; //pending
@synthesize name;
@synthesize jaikBroken; //pending
@synthesize uDID;  //pending
@synthesize signalStrength;  //pending
@synthesize IMEA;  //pending
@synthesize totalNumberOfApps;  //pending

@synthesize localizedModelOf;
@synthesize deviceOrientation;

@synthesize oS;
@synthesize oSVersion;

@synthesize devcBatteryLevel;
@synthesize devcBatteryState;


@synthesize freeMemory;
@synthesize usedMemory;
@synthesize totalMemory;
@synthesize activeMemory;
@synthesize inactiveMemory;
@synthesize wiredMemory;


@synthesize macAddress;
//2.	IP Address
@synthesize ipAddres;



@synthesize freeDiskSpace;
//2.	Used
@synthesize usedDiskSpace;

@synthesize cpufrequency;

@synthesize cpuName;

@synthesize bootupTime;

@synthesize internetReachability;

@synthesize screenResolution;


@synthesize carrName;


@synthesize pixelDensity;



@synthesize rearCamera;
//13.	Front camera
@synthesize frontCamera;



@synthesize accelAvail;
@synthesize motionAvail;
@synthesize gyroAvail;
@synthesize magnetoAvail;

-(id)init
{
	self = [super init];
	if (self) {
		
		//getDeviceModel
		[self getModel];
		//getDeviceName
		[self getName];
		//getOS
		[self getOS];
		//getOSVersion
		[self getOSVersion];
		//get UDID
		[self getUDID];
		
		//getlocalizedModel
		[self getlocalizedModel];
		
		//getdeviceOrientation
		[self getdeviceOrientation];
		
		//enable battery monitoring
		[self toenableBatteryMonitoring];
		
        
        //memory stats
		[self getMemoryStats];
        
        [self cpuLoad];
        
        //mac
        [self macaddress];
        
        //ip
        [self setIpAddres:[[self class]localAddress]];
        
        //diskSpace
        [self totalDiskSpace];
		
        
        
        
        [self osBootTime];
        
        
        [self meReachable];
        
        
        
        [self setCpufrequency:[NSString stringWithFormat:@"%0.02f Hz",([self cpuFrequency])/(1000.0*1000.0)]];
        
       
        
        [self myScreenResolution];
        
        
        [self carrierThatname];
        
        
        [self countCores];
        
        
        [self getPixelDensity];
        
        
        [self cameraAvailability];
        
        
        [self gyroAndOthers];

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

	
	[model release];
	[version release]; //pending
	[name release];
	[jaikBroken release]; //pending
	[uDID release];  //pending
	[signalStrength release];  //pending
	[IMEA release];  //pending
	[totalNumberOfApps release];  //pending
	
	[localizedModelOf release];
	[deviceOrientation release];
	
	[oS release];
	[oSVersion release];
	
	[devcBatteryState release];
    
    //1.	MAC Address
   [macAddress release];
    //2.	IP Address
    [ipAddres release];
    
    
    //1.Free
    [freeDiskSpace release];
    //2.	Used
    [usedDiskSpace release];
    
    
    //Cpu frequency
    [cpufrequency release];
    
    //Cpu name
    [cpuName release];
    
    //bootTime
    [bootupTime release];
    
    //3. Status
    [internetReachability release];
    
    
    //screen resolution
    
    [screenResolution release];
    
    
    
    [carrName release];
    
    //pixel density
    [pixelDensity release];
    
    
	[super dealloc];
}


//getDeviceModel
-(NSString *)getModel
{
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *model_ ;
	if ([currentDevice_ model]) {
		model_ = [currentDevice_ model];
	}
	else {
		model_ = @" ";
	}
	
	[self setModel:model_];
	return model_;
}


//getDeviceName
-(NSString *)getName
{
	
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *name_ ;
	if ([currentDevice_ name]) {
		name_ = [currentDevice_ name];
	}
	else {
		name_ = @" ";
	}
	
	[self setName:name_];
	return name_;
}

//getlocalizedModel
-(NSString *)getlocalizedModel
{
	
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *localizedModel_ ;
	if ([currentDevice_ localizedModel]) {
		localizedModel_ = [currentDevice_ localizedModel];
	}
	else {
		localizedModel_ = @" ";
	}
	
	[self setLocalizedModelOf:localizedModel_];
	return localizedModel_;
}


//getOS
-(NSString *)getOS
{
	
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *systemName_ ;
	if ([currentDevice_ systemName]) {
		systemName_ = [currentDevice_ systemName];
	}
	else {
		systemName_ = @" ";
	}
	
	[self setOS:systemName_];
	return systemName_;
}


//getOSVersion
-(NSString *)getOSVersion
{
	
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *OSVersion_ ;
	if ([currentDevice_ systemVersion]) {
		OSVersion_ = [currentDevice_ systemVersion];
	}
	else {
		OSVersion_ = @" ";
	}
	
	[self setOSVersion:OSVersion_];
	return OSVersion_;
}



//get UDID
-(NSString *)getUDID
{
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *UDID_ ;
	if ([currentDevice_ uniqueIdentifier]) {
		UDID_ = [currentDevice_ uniqueIdentifier];
	}
	else {
		UDID_ = @" ";
	}
	
	[self setUDID:UDID_];
	return UDID_;
}

/*
typedef enum {
	UIDeviceOrientationUnknown,
	UIDeviceOrientationPortrait,
	UIDeviceOrientationPortraitUpsideDown,
	UIDeviceOrientationLandscapeLeft,
	UIDeviceOrientationLandscapeRight,
	UIDeviceOrientationFaceUp,
	UIDeviceOrientationFaceDown
} UIDeviceOrientation;
*/

//get deviceOrientation
-(NSString *)getdeviceOrientation
{
	UIDevice *currentDevice_ = [UIDevice currentDevice];
	NSString *deviceOrientation_ ;
	int   dOrientation	   = [currentDevice_ orientation];
	
		switch (dOrientation) {
				
			case UIDeviceOrientationUnknown:
				deviceOrientation_	   = @"DeviceOrientationUnknown";
				break;
				
				case UIDeviceOrientationPortrait:
					deviceOrientation_ = @"DeviceOrientationPortrait";
					break;
				
				case UIDeviceOrientationPortraitUpsideDown:
					deviceOrientation_ = @"DeviceOrientationPortraitUpsideDown";
					break;
				
				case UIDeviceOrientationLandscapeLeft:
					deviceOrientation_ = @"DeviceOrientationLandscapeLeft";
					break;
				
				case UIDeviceOrientationLandscapeRight:
					deviceOrientation_ = @"DeviceOrientationLandscapeRight";
					break;
				
				case UIDeviceOrientationFaceUp:
					deviceOrientation_ = @"DeviceOrientationFaceUp";
					break;
				
				case UIDeviceOrientationFaceDown:
					deviceOrientation_ = @"DeviceOrientationFaceDown";
					break;
				
			default:
				deviceOrientation_ = @"DeviceOrientationUnknown";
				break;
		}
		
		
	
	
	[self setDeviceOrientation:deviceOrientation_];
	NSLog(@"%@",deviceOrientation_);	
	return deviceOrientation_;
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
	[self setDevcBatteryLevel:battery_Level_];
	
	NSLog(@"BatteryState-->%@",battery_State_);
	[self setDevcBatteryState:battery_State_];
	
    /*
	NSLog(@"UIDeviceBatteryStateDidChangeNotification");
	//addObserver for UIDeviceBatteryStateDidChangeNotification
	[[NSNotificationCenter defaultCenter]addObserver:self
											selector:@selector(batteryStateDidChange:)
												name:UIDeviceBatteryStateDidChangeNotification 
											  object:nil];
	
	NSLog(@"UIDeviceBatteryLevelDidChangeNotification");
	//addObserver for UIDeviceBatteryLevelDidChangeNotification
	[[NSNotificationCenter defaultCenter]addObserver:self
											selector:@selector(batteryLevelDidChange:)
												name:UIDeviceBatteryLevelDidChangeNotification 
											  object:nil];
     
     */
	
}

-(float)batteryLevelDidChange
{
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


//get All Memory Stats
-(void)getMemoryStats
{
    mach_port_t           host_port = mach_host_self();
    mach_msg_type_number_t   host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t               pagesize;
    vm_statistics_data_t     vm_stat;
    
    host_page_size(host_port, &pagesize);
    
    /*
     kern_return_t host_statistics
     (
     host_t host_priv, //host port
     host_flavor_t flavor,
     host_info_t host_info_out,
     mach_msg_type_number_t *host_info_outCnt
     );
     
     */
    
    
    // struct vm_statistics {
    //     natural_t	free_count;		/* # of pages free */
    //    natural_t	active_count;		/* # of pages active */
    //    natural_t	inactive_count;		/* # of pages inactive */
    //    natural_t	wire_count;		/* # of pages wired down */
    //   natural_t	zero_fill_count;	/* # of zero fill pages */
    //  natural_t	reactivations;		/* # of pages reactivated */
    //   natural_t	pageins;		/* # of pageins */
    //   natural_t	pageouts;		/* # of pageouts */
    //   natural_t	faults;			/* # of faults */
    //   natural_t	cow_faults;		/* # of copy-on-writes */
    //   natural_t	lookups;		/* object cache lookups */
    //  natural_t	hits;			/* object cache hits */
    
    /* added for rev1 */
    // natural_t	purgeable_count;	/* # of pages purgeable */
    // natural_t	purges;			/* # of pages purged */
    
    /* added for rev2 */
    /*
     * NB: speculative pages are already accounted for in "free_count",
     * so "speculative_count" is the number of "free" pages that are
     * used to hold data that was read speculatively from disk but
     * haven't actually been used by anyone so far.
     */
    // natural_t	speculative_count;	/* # of pages speculative */
    //  };
    
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) NSLog(@"Failed to fetch vm statistics");
    
    natural_t   mem_active = vm_stat.active_count * pagesize;
    natural_t   mem_inactive = vm_stat.inactive_count * pagesize;
    natural_t   mem_wired   = vm_stat.wire_count * pagesize;
    
    natural_t   mem_used = (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count) * pagesize;
    natural_t   mem_free = vm_stat.free_count * pagesize;
    natural_t   mem_total = mem_used + mem_free;
    
    /*
     NSLog
     (
     @"mem_used - %.02f MB \n mem_free - %.02f MB \n mem_total - %.02f MB \n mem_active - %.02f MB \n mem_inactive - %.02f \n MB mem_wired - %.02f MB \n"
     ,
     (mem_used/(1024.0*1024.0)),
     mem_free /(1024.0*1024.0) ,
     mem_total/(1024.0*1024.0) ,
     mem_active/(1024.0*1024.0),
     mem_inactive/(1024.0*1024.0),
     mem_wired/(1024.0*1024.0)
     
     );
     */
    
    NSLog(@"memory %% Used %% %.02f",((mem_used/(1024.0*1024.0))/(mem_total/(1024.0*1024.0))) *100.0
          );
    
    NSLog(@"memory %% Inactive %% %.02f",((mem_inactive/(1024.0*1024.0))/(mem_used/(1024.0*1024.0))) *100.0
          );
    
    NSLog(@"memory %% Active %% %.02f",((mem_active/(1024.0*1024.0))/(mem_used/(1024.0*1024.0))) *100.0
          );
    
    NSLog(@"memory %% Wired %% %.02f",((mem_wired/(1024.0*1024.0))/(mem_used/(1024.0*1024.0))) *100.0
          );
    
    NSLog(@"memory %% Free %% %.02f",((mem_free/(1024.0*1024.0))/(mem_total/(1024.0*1024.0))) *100.0
          );
    
    
    [self setFreeMemory:mem_free /(1024.0*1024.0)]; //mem
    
    [self setUsedMemory:mem_used/(1024.0*1024.0)]; //mem
    
    [self setTotalMemory:mem_total/(1024.0*1024.0)]; //mem
    
    
    
}




#pragma mark MAC addy
// Return the local MAC addy
// Courtesy of FreeBSD hackers email list
// Accidentally munged during previous update. Fixed thanks to mlamb.
- (NSString *) macaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Error: Memory allocation error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2\n");
        free(buf); // Thanks, Remy "Psy" Demerest
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    free(buf);
    [self setMacAddress:outstring];
    NSLog(@"mac address %@ \n",outstring);
    return outstring;
}
/** Converts a raw IPv4 address to an NSString in dotted-quad notation */
static NSString* StringFromIPv4Addr( UInt32 ipv4Addr )
{
    if( ipv4Addr != 0 ) {
        const UInt8* addrBytes = (const UInt8*)&ipv4Addr;
        return [NSString stringWithFormat: @"%u.%u.%u.%u",
                (unsigned)addrBytes[0],(unsigned)addrBytes[1],
                (unsigned)addrBytes[2],(unsigned)addrBytes[3]];
    } else
        return nil;
}


+ (UInt32) rawLocalAddress
{
    // getifaddrs returns a linked list of interface entries;
    // find the first active non-loopback interface with IPv4:
    UInt32 address = 0;
    struct ifaddrs *interfaces;
    if( getifaddrs(&interfaces) == 0 ) {
        struct ifaddrs *interface;
        for( interface=interfaces; interface; interface=interface->ifa_next ) {
            if( (interface->ifa_flags & IFF_UP) && ! (interface->ifa_flags & IFF_LOOPBACK) ) {
                const struct sockaddr_in *addr = (const struct sockaddr_in*) interface->ifa_addr;
                if( addr && addr->sin_family==AF_INET ) {
                    address = addr->sin_addr.s_addr;
                    break;
                }
            }
        }
        freeifaddrs(interfaces);
    }
    return address;
}

+ (NSString*) localAddress
{
    NSLog(@"mac address %@ \n",StringFromIPv4Addr( [self rawLocalAddress] ));
    if (StringFromIPv4Addr( [self rawLocalAddress]) ){
        
    
        return StringFromIPv4Addr( [self rawLocalAddress] );
    }
        
        else return @" ";
        

}

- (void) totalDiskSpace
{
    NSError *error = nil;
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) {
        NSLog(@"totalDiskSpace - %@",[error localizedDescription]);
        
        [self setFreeDiskSpace:nil];
        
        [self setUsedDiskSpace:nil];
        return;
    }
    
    double totDiskSpace = [[fattributes objectForKey:NSFileSystemSize]floatValue]/(1024.0*1024.0*1024.0);
    
    double freeDisSpace = [[fattributes objectForKey:NSFileSystemFreeSize]floatValue]/(1024.0*1024.0*1024.0);
    
    double usedDisSpace = totDiskSpace - freeDisSpace;
    
    NSLog(@" totDiskSpace - %.002f GB -",totDiskSpace);
    
    NSLog(@" freeDiskSpace - %.002f GB -",freeDisSpace);
    
    NSLog(@" usedDiskSpace - %.002f GB -",usedDisSpace);
    
    [self setFreeDiskSpace:[NSString stringWithFormat:@"%.002f GB",freeDisSpace]];
    
    [self setUsedDiskSpace:[NSString stringWithFormat:@"%.002f GB",usedDisSpace]];
    
   // return [fattributes objectForKey:NSFileSystemSize];
}

/*
- (NSNumber *) freeDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}
*/

#pragma mark sysctl utils
- (NSUInteger) getSysInfo: (uint) typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

- (NSUInteger) cpuFrequency
{
    if ([self getSysInfo:HW_CPU_FREQ]) {
        NSLog(@"cpuFrequency %lu",(unsigned long)[self getSysInfo:HW_CPU_FREQ]);
        return [self getSysInfo:HW_CPU_FREQ];
    }

    else return 0;
    
}

- (NSUInteger) busFrequency
{
    return [self getSysInfo:HW_BUS_FREQ];
}

- (NSUInteger) cpuCount
{
    return [self getSysInfo:HW_NCPU];
}


- (BOOL) hasRetinaDisplay
{
    return ([UIScreen mainScreen].scale == 2.0f);
}


-(void)osBootTime
{
    //BO0TTime
    
    //_STRUCT_TIMEVAL
    //{
    //  __darwin_time_t		tv_sec;		/* seconds */
    //   __darwin_suseconds_t	tv_usec;	/* and microseconds */
    //};
    
    struct timeval *newTimeVal;
    
    
    int BTmib[2];
    size_t BTlen;
    
    
    BTmib[0] = CTL_KERN;
    BTmib[1] = KERN_BOOTTIME ;
    int o1ctl = sysctl(BTmib, 2, NULL, &BTlen, NULL, 0);
    
    newTimeVal = malloc(BTlen);
    int o2ctl = sysctl(BTmib, 2, (void *)newTimeVal, &BTlen, NULL, 0);
    printf("KERN_BOOTTIME %ld\n",newTimeVal ->tv_sec/3600);
    NSDate* bootDate = [NSDate dateWithTimeIntervalSince1970:newTimeVal ->tv_sec];
    NSLog(@"date description %@ - -- >",[NSDate date]);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    NSString *formattedDateString = [dateFormatter stringFromDate:bootDate];
    NSLog(@"%@",formattedDateString);
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *some = [gregorian components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:bootDate];
    
    NSLog(@"%ld",(long)[some hour]);
    NSLog(@"%ld",(long)[some minute]);
    NSLog(@"%ld",(long)[some second]);
    
    
    
    NSLog(@"%@",bootDate);
    [dateFormatter release];
    printf("o1ctl %d\n",o1ctl);
    printf("o2ctl %d\n",o2ctl);
    
    [self setBootupTime:formattedDateString];
    
}

-(void)meReachable
{
    Reachability *internetReach = [[Reachability reachabilityForInternetConnection] retain];
    [internetReach startNotifier];
    Reachability *wifiReach = [[Reachability reachabilityForLocalWiFi] retain];
    [wifiReach startNotifier];
    
    NetworkStatus netStatus1 = [internetReach currentReachabilityStatus];
    NetworkStatus netStatus2 = [wifiReach currentReachabilityStatus];
    if(netStatus1 == NotReachable && netStatus2 == NotReachable)
    {
        //UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"This feature requires an internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //[alertView show];
        //[alertView release];
    }
    else
    {//wifi connection available;
    }
    
    if (netStatus1) {
        [self setInternetReachability:@"Connected"];
    }
    else [self setInternetReachability:@"No Connection"];
    
    [internetReach release];
    [wifiReach release];
    
}


-(void)cpuLoad
{
    processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
    mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
    unsigned _numCPUs;
    NSLock *_cpuUsageLock;
    
    int _mib[2U] = { CTL_HW, HW_NCPU };
    size_t _sizeOfNumCPUs = sizeof(_numCPUs);
    int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
    if(_status)
        _numCPUs = 1;
    
    _cpuUsageLock = [[NSLock alloc] init];
    
    natural_t _numCPUsU = 0U;
    kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
    if(err == KERN_SUCCESS) {
        [_cpuUsageLock lock];
        
        for(unsigned i = 0U; i < _numCPUs; ++i) {
            Float32 _inUse, _total;
            if(_prevCPUInfo) {
                _inUse = (
                          (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
                          
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
                          
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE])
                          );
                
                _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
            } else {
                
                _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
                
                _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
            }
            
            NSLog(@"Coreeewrwerrwrer : %u, Usage: %.2f%%", i, _inUse );
            
            NSLog(@"Coreeewrwerrwrer : %u, Usage: %.2f%%", i, _total);
            
            NSLog(@"Coreeewrwerrwrer : %u, Usage: %.2f%%", i, ((_total - _inUse)/ _total)*100.0f);//free
            
            NSLog(@"Coreeewrwerrwrer : %u, Usage: %.2f%%", i, _inUse / _total * 100.f);
            
            
            
            [self setActiveMemory:_inUse / _total * 100.f];//wired //inUse
            
            [self setInactiveMemory:_total];//active //System
            
            [self setWiredMemory:((_total - _inUse)/ _total)*100.0f];//inactive //Idle
            
            
        }
        
        [_cpuUsageLock unlock];
        
        if(_prevCPUInfo) {
            size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
            vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
        }
        
        _prevCPUInfo = _cpuInfo;
        _numPrevCPUInfo = _numCPUInfo;
        
        _cpuInfo = nil;
        _numCPUInfo = 0U;
        
    } else {
        NSLog(@"Error!");
    }
    
    [_cpuUsageLock release];
    _cpuUsageLock = nil;
}


-(void)myScreenResolution
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    [self setScreenResolution:
     [NSString stringWithFormat:@"%d X %d",
      
      (int)screenRect.size.height,(int)screenRect.size.width
      ]];
}


-(void)carrierThatname
{
    CTCarrier *nuCarrier = [[CTCarrier alloc]init];
    
    if([nuCarrier carrierName])
    {
        [self setCarrName:[nuCarrier carrierName]];
    }
    else{
        
        [self setCarrName:@" "];
    }
    
    
    [nuCarrier release];
    nuCarrier = nil;
}


-(void) countCores
{
    /*
    size_t len;
    unsigned int ncpu;
    
    len = sizeof(ncpu);
    if(sysctlbyname ("hw.ncpu",&ncpu,&len,NULL,0))
    {
        if (ncpu > 1) {
            [self setCpuName:[NSString stringWithFormat:
             @"%d cores",ncpu]];
        }
        else [self setCpuName:[NSString stringWithFormat:
                               @"%d core",ncpu]];
        
    }
    
    else [self setCpuName:@" "];
    */
    
    
    host_basic_info_data_t hostInfo;
    mach_msg_type_number_t infoCount;
    
    infoCount = HOST_BASIC_INFO_COUNT;
    host_info(mach_host_self(), HOST_BASIC_INFO,
              (host_info_t)&hostInfo, &infoCount);
    
    if(hostInfo.max_cpus > 1)
    {
        [self setCpuName:[NSString stringWithFormat:
                      @"%d cores",hostInfo.max_cpus]];
    }
    
    else
    {
        [self setCpuName:[NSString stringWithFormat:
                          @"%d core",hostInfo.max_cpus]];
    }

    
}


-(void)getPixelDensity
{
 
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    
    CGFloat screenScale = [[UIScreen mainScreen]scale];
    
    CGSize screenWidth = CGSizeMake(screenBounds.size.width * screenScale,
                                    screenBounds.size.height * screenScale
                                    );
    
    [self setPixelDensity:
     [NSString stringWithFormat:
     @"%d X %d",(int)screenWidth.height,(int)screenWidth.width]
     ];
    
}


-(void)cameraAvailability
{
    BOOL _rearCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    
    BOOL _frontCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    
    NSString *FC = _frontCamera ? @"Yes" :@"No";
    
    NSString *RC = _rearCamera ? @"Yes" :@"No";
    
    [self setFrontCamera:FC];
    
    [self setRearCamera:RC];
    
}


-(void)gyroAndOthers
{
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    
    BOOL _accel =  [motionManager isAccelerometerAvailable];
    
    BOOL _DeviceMotion = [motionManager isDeviceMotionAvailable];
    
    BOOL _Gyro = [motionManager isGyroAvailable];
    
    BOOL _Magnetometer = [motionManager isMagnetometerAvailable];
    
    NSString *acc = _accel ? @"Yes" :@"No";
    
    NSString *devM = _DeviceMotion ? @"Yes" :@"No";
    
    NSString *gyro = _Gyro ? @"Yes" :@"No";
    
    NSString *mag = _Magnetometer ? @"Yes" :@"No";
    
    
    [self setAccelAvail:acc];
    
    [self setMotionAvail:devM];
    
    [self setGyroAvail:gyro];
    
    [self setMagnetoAvail:mag];
    
    
    [motionManager release];
    
}



-(void)callAll
{
    //getDeviceModel
    [self getModel];
    //getDeviceName
    [self getName];
    //getOS
    [self getOS];
    //getOSVersion
    [self getOSVersion];
    //get UDID
    [self getUDID];
    
    //getlocalizedModel
    [self getlocalizedModel];
    
    //getdeviceOrientation
    [self getdeviceOrientation];
    
    //enable battery monitoring
    [self toenableBatteryMonitoring];
    
    
    //memory stats
    [self getMemoryStats];
    
    [self cpuLoad];
    
    //mac
    [self macaddress];
    
    //ip
    [self setIpAddres:[[self class]localAddress]];
    
    //diskSpace
    [self totalDiskSpace];
    
    
    
    
    [self osBootTime];
    
    
    [self meReachable];
    
    
    
    [self setCpufrequency:[NSString stringWithFormat:@"%0.02f Hz",([self cpuFrequency])/(1000.0*1000.0)]];
    
    
    
    [self myScreenResolution];
    
    
    [self carrierThatname];
    
    
    [self countCores];
    
    
    [self getPixelDensity];
    
    
    [self cameraAvailability];
    
    
    [self gyroAndOthers];

}
	 @end
