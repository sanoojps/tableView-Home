//
//  ItemsViewController.h
//  ATableView
//
//  Created by theNotSoBrightLazyNovice on 6/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class PossessionController;

@interface ItemsViewController : UITableViewController {

	PossessionController *nuStore;
	NSMutableArray *strayArray;
    //NSArray* categoryCount;
    
    int _pNAmeforPhoneDetailsCount;
    int _pNAmeforBatteryCount;
    int _pNAmeforOperatingSystemCount;
    int _pNAmeforCPUUSageCount;
    int _pNAmeforMemoryUSageCount;
    int _pNAmeforCellularNetworkCount;
    int _pNAmeforWiFiNetworkCount;
    int _pNAmeforDiskCount;
    int _pNAmeforSystemRunTimeCount;
    int _pNAmeforHardwareSpecificationCount;
    int _arrayOfCategoriesCount;
    
}

@property(nonatomic,assign) int _pNAmeforPhoneDetailsCount;
@property(nonatomic,assign) int _pNAmeforBatteryCount;
@property(nonatomic,assign) int _pNAmeforOperatingSystemCount;
@property(nonatomic,assign) int _pNAmeforCPUUSageCount;
@property(nonatomic,assign) int _pNAmeforMemoryUSageCount;
@property(nonatomic,assign) int _pNAmeforCellularNetworkCount;
@property(nonatomic,assign) int _pNAmeforWiFiNetworkCount;
@property(nonatomic,assign) int _pNAmeforDiskCount;
@property(nonatomic,assign) int _pNAmeforSystemRunTimeCount;
@property(nonatomic,assign) int _pNAmeforHardwareSpecificationCount;
@property(nonatomic,assign) int _arrayOfCategoriesCount;


@end
