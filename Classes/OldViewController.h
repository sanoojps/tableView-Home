//
//  OldViewController.h
//  tableView-Home
//
//  Created by lockUp on 8/1/13.
//
//

#import <UIKit/UIKit.h>
@class PossessionController;
@interface OldViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
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
    
    
    NSString *feedbackMsg;
    
    IBOutlet UITableView *thisIsTableView;
    NSTimer *tableUpdateTimer;
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

@property (retain, nonatomic)  NSString *feedbackMsg;


- (IBAction)chatButtonClicked:(id)sender;
- (IBAction)mailButtonClicked:(id)sender;

@end
