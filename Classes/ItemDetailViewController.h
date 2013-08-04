//
//  ItemDetailViewController.h
//  tableView-Home
//
//  Created by theNotSoBrightLazyNovice on 6/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Possession;
@interface ItemDetailViewController : UIViewController {
    
	IBOutlet UILabel *dateLabel;
    IBOutlet UITextField *nameLabel;
    IBOutlet UITextField *serialLabel;
    IBOutlet UITextField *valueField;
	
	Possession *possession;
}


@property(nonatomic,retain)IBOutlet UILabel *dateLabel;
@property(nonatomic,retain)IBOutlet UITextField *nameLabel;
@property(nonatomic,retain)IBOutlet UITextField *serialLabel;
@property(nonatomic,retain)IBOutlet UITextField *valueField;

@property(nonatomic,retain)Possession *possession;

@end
