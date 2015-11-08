//
//  ViewController.m
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import "AcronymViewController.h"
#import "AcronymDataManager.h"
#import "AcronymTableViewCell.h"
#import "LongForm.h"
#import "MoreVariationsViewController.h"

@interface AcronymViewController ()  <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong) NSArray *longFormsArray;
@property (weak, nonatomic) IBOutlet UITextField *acronymTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AcronymViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *cellNib = [UINib nibWithNibName:@"AcronymTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"acronymCell"];
    self.tableView.estimatedRowHeight = 70;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource

- (IBAction)searchAcronymTapped:(id)sender {
    AcronymDataManager* acronymDataManager = [[AcronymDataManager alloc] init];
    [acronymDataManager getLongFormsForString:self.acronymTextField.text];
    [acronymDataManager setComplitionBlock:^(NSArray* longFormsArray) {
        self.longFormsArray = longFormsArray;
        [self.tableView reloadData];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.longFormsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcronymTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acronymCell" forIndexPath:indexPath];
    LongForm *longForm = self.longFormsArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.fullFormLabel.text = longForm.longForm;
    cell.frequencyLabel.text = [NSString stringWithFormat:@"%@",longForm.frequency];
    cell.yearSinceLabel.text = [NSString stringWithFormat:@"%@",longForm.yearSince];    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"variationsSegue" sender:self];

}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self searchAcronymTapped:self];
    [textField resignFirstResponder];
    return YES;
}

 #pragma mark - Navigation


@end
