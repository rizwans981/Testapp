//
//  FactRowCell.m
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import "FactRowCell.h"

@implementation FactRowCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Initialization code
        [self addSubviews];
        
        [self addConstraints];
        
        [self setStyles];
    }
    
    return self;
}
#pragma mark - Setting Style
-(void)setStyles
{
    [self.factRowDescriptionLabel setFont:[UIFont systemFontOfSize:12]];
    
    [self.factRowDescriptionLabel setNumberOfLines:0];
    
    [self.factRowDescriptionLabel setTextColor:[UIColor darkGrayColor]];
    
    [self.factRowDescriptionLabel setBackgroundColor:[UIColor whiteColor]];
    
    [self.factRowDescriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
    //    [self.factRowDescriptionLabel sizeToFit];
    [self.factRowTitleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    
    [self.factRowTitleLabel setNumberOfLines:0];
    
    [self.factRowTitleLabel setTextColor:[UIColor blackColor]];
    
    [self.factRowTitleLabel setBackgroundColor:[UIColor whiteColor]];
    
    [self.factRowTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    
}
#pragma mark - Adding Subviews
-(void)addSubviews
{
    self.factRowImageView = [[UIImageView alloc] init];
    self.factRowTitleLabel = [[UILabel alloc] init];
    self.factRowDescriptionLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.factRowImageView];
    [self.contentView addSubview:self.factRowTitleLabel];
    [self.contentView addSubview:self.factRowDescriptionLabel];
}
#pragma mark - Adding Constraints
-(void)addConstraintsToFactRowImageView
{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.factRowImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.factRowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.factRowImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.factRowImageView.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:5];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.factRowImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:5];
    
    [NSLayoutConstraint activateConstraints:@[widthConstraint,heightConstraint,leadingConstraint,topConstraint]];
    
}

-(void)addConstraintsToFactRowTitle
{
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.factRowTitleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20];
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.factRowTitleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.factRowImageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.factRowTitleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.factRowTitleLabel.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.factRowTitleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.factRowTitleLabel.superview attribute:NSLayoutAttributeTop multiplier:1 constant:5];
    [NSLayoutConstraint activateConstraints:@[leadingConstraint,trailingConstraint,topConstraint, heightConstraint]];
    
}

-(void)addConstraintsToFactRowDescription
{
    
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.factRowDescriptionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.factRowImageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.factRowDescriptionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.factRowDescriptionLabel.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.factRowDescriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.factRowTitleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.factRowDescriptionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.factRowDescriptionLabel.superview  attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
    [NSLayoutConstraint activateConstraints:@[leadingConstraint,trailingConstraint,topConstraint,bottomConstraint]];
    
}

-(void)addConstrintsToContentView
{
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [NSLayoutConstraint activateConstraints:@[leadingConstraint,trailingConstraint,topConstraint,bottomConstraint]];}

-(void)addConstraints
{
    [self addConstraintsToFactRowImageView];
    [self addConstraintsToFactRowTitle];
    [self addConstraintsToFactRowDescription];
    //    [self addConstrintsToContentView];
    [self disableAutoresizeMask];
}
#pragma mark - Disabling Size mask
-(void)disableAutoresizeMask
{
    self.factRowTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.factRowDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.factRowImageView.translatesAutoresizingMaskIntoConstraints = NO;
    //    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
}
#pragma mark - Setting Fact Row Details
-(void)setDetails:(FactRow *)factRow
{
    
    [self.factRowTitleLabel setText:factRow.title];
    [self.factRowDescriptionLabel setText:factRow.descriptionDetails];
    [self.factRowImageView setImage:[UIImage imageNamed:@"PlaceholderImage"]];
    if (factRow.imageURL.length > 0) {
        NSURL *url = [NSURL URLWithString:factRow.imageURL];
        __weak __typeof(self) weakSelf = self;
        
        [self downloadImageWithURL:url
                   completionBlock:^(BOOL succeeded, UIImage *image) {
                       if (succeeded) {
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [weakSelf.factRowImageView setImage:image];
                           });
                       }
                   }];
    }
    
}
#pragma mark - Downloading Image

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if ( !error )
                {
                data = [NSData dataWithContentsOfURL:url];
                UIImage *image = [[UIImage alloc] initWithData:data];
                completionBlock(YES,image);
                } else{
                    completionBlock(NO,nil);
                }
        }];
        [task resume];
    });
    
    
}



@end

