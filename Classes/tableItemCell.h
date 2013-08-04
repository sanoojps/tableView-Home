//
//  tableItemCell.h
//  tableView-Home
//
//  Created by theNotSoBrightLazyNovice on 7/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Possession;

@interface tableItemCell : UITableViewCell {
	
	UILabel	*valueLabel;
	UILabel *nameLabel;
	UIImageView *imageView;
//When this is instantiated - it will instantiate it valueLabel,nameLabel.ImageView
}

//UITableViewCell has a "contentView" which is the subclass of UIView
@property(nonatomic,retain)UILabel	*valueLabel;
@property(nonatomic,retain)UILabel *nameLabel;
@property(nonatomic,retain)UIImageView *imageView;

-(void)setPossession:(Possession *)possession;
@end
