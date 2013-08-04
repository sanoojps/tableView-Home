//
//  bed.h
//  Battery
//
//  Created by theNotSoBrightLazyNovice on 6/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface bed : NSObject {

	//*>Battery
	
	//1.	Battery %
	
	//2.	Battery Left
	int devcBatteryLevel;
	int currentBatteryLevel;
	//battery state
	NSString* devcBatteryState;
	NSString* currentBatteryState;
	
	
}

@property(nonatomic,retain)NSString* devcBatteryState;
@property(nonatomic,assign)int devcBatteryLevel;

@property(nonatomic,retain)NSString* currentBatteryState;
@property(nonatomic,assign)int currentBatteryLevel;
@end
