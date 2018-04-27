//
//  FactRowCell.h
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FactRow.h"
@interface FactRowCell : UITableViewCell

@property UILabel *factRowTitleLabel;

@property UILabel *factRowDescriptionLabel;

@property UIImageView *factRowImageView;

-(void)setDetails:(FactRow *)factRow;

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
@end
