//
//  FactDetailsView.m
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import "FactDetailsView.h"
#import "FactRow.h"
#import "FactRowCell.h"
#import "FactDetailsPresenter.h"

@interface FactDetailsView ()
{
    UIActivityIndicatorView *spinner;
    Fact *fact;
}
@end

@implementation FactDetailsView
static NSString *FactCellIdentifier = @"FactCellIdentifier";
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpView];
    
    [self.factDetailsPresenter viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Setting view
-(void)setUpView
{
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    
    self.tableView.rowHeight = 50;
    
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.tableView registerClass:[FactRowCell class] forCellReuseIdentifier:FactCellIdentifier];
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return fact.rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FactRowCell *cell = [tableView dequeueReusableCellWithIdentifier:FactCellIdentifier forIndexPath:indexPath];
    
    [cell setDetails:[fact.rows objectAtIndex:indexPath.row]];
    
    return cell;
}
#pragma mark - Tablew View delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FactRow *factRow = fact.rows[indexPath.row];
    
    NSString *cellText = factRow.descriptionDetails;
    
    UIFont *cellFont = [UIFont systemFontOfSize:14];
    
    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    
    CGRect labelSize = [cellText boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:cellFont} context:nil];
    
    CGFloat height = labelSize.size.height + 35;
    
    if (height < 60)
        {
        return 60;
        }
    return height;
}
#pragma mark - Adding Spinner
-(void)addSpinner
{
    if(!spinner)
        {
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        spinner.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        
        spinner.center =  self.view.center;
        
        [self.view addSubview: spinner];
        
        [spinner setHidesWhenStopped:YES];
        }
}

#pragma mark - Show Loading
-(void)showLoading
{
    [self addSpinner];
    
    [spinner startAnimating];
    
    [spinner setHidden:NO];
}
#pragma mark - Hiding Spinner
-(void)hideLoading
{
    [spinner setHidden:YES];
    
    [spinner stopAnimating];
}
#pragma mark - Show Fact Details
-(void)showFactDetails:(Fact *)factDetails
{
    fact = factDetails;
    
    self.title = fact.title;
    
    [self.tableView reloadData];
}

@end

