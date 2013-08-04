//
//  SmartExchangeController.h
//  tableView-Home
//
//  Created by theNotSoBrightLazyNovice on 6/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SmartExchangeController : UIViewController <UITextFieldDelegate> {
    IBOutlet UIButton *billingButton;
    IBOutlet UITextField *emailTxtField;
    IBOutlet UITextField *nameTxtField;
    IBOutlet UIButton *salesButton;
    IBOutlet UIButton *technicalButton;
}


@property(nonatomic,retain)IBOutlet UITextField *emailTxtField;
@property(nonatomic,retain)IBOutlet UITextField *nameTxtField;


@property(nonatomic,retain)IBOutlet UIButton *billingButton;
@property(nonatomic,retain)IBOutlet UIButton *salesButton;
@property(nonatomic,retain)IBOutlet UIButton *technicalButton;


- (IBAction)billingButtonClicked:(id)sender;
- (IBAction)salesButtonClicked:(id)sender;
- (IBAction)technicalButtonClicked:(id)sender;
- (IBAction)makeKeyBoardGoAway:(id)sender;
@end
