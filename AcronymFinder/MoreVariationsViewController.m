//
//  MoreVariationsViewController.m
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import "MoreVariationsViewController.h"
#import "AcronymTableViewCell.h"
#import "LongForm.h"
#import "AcronymTableViewCell.h"

@interface MoreVariationsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MoreVariationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *cellNib = [UINib nibWithNibName:@"AcronymTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"acronymCell"];
    self.tableView.estimatedRowHeight = 70;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.longFormsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcronymTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acronymCell" forIndexPath:indexPath];
    LongForm *longForm = self.longFormsArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.fullFormLabel.text = longForm.longForm;
    cell.frequencyLabel.text = [NSString stringWithFormat:@"%@",longForm.frequency];
    cell.yearSinceLabel.text = [NSString stringWithFormat:@"%@",longForm.yearSince];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
