//
//  ViewController.m
//  tipsHack
//
//  Created by Nicholas Wayoe on 6/23/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSArray *tipPercentages = @[@(0.15), @(0.20), @(0.30)];
     double tipPercentage = [tipPercentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;

    self.tipLabel.text= [NSString stringWithFormat:@"$%.2f",tip];
    self.totalLabel.text=[NSString stringWithFormat:@"$%.2f",total];
}
- (IBAction)onBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x,self.billField.frame.origin.y +30,self.billField.frame.size.width, self.billField.frame.size.height);}];
    [UIView animateWithDuration:1 animations: ^{
          self.tipLabel.alpha = 0;}];
      
}
- (IBAction)onEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    [UIView animateWithDuration:0.2 animations:^{
        self.self.billField.frame = newFrame;
    }];
    [UIView animateWithDuration:1 animations: ^{
        self.tipLabel.alpha = 1;}];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"View did disappear");
}

@end
