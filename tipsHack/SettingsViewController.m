//
//  SettingsViewController.m
//  tipsHack
//
//  Created by Nicholas Wayoe on 6/24/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *DefaultTipSlider;
@property (weak, nonatomic) IBOutlet UITextField *sliderLabel;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
// Pass the selected object to the new view  controller.
}
*/
- (IBAction)onDefaultTipSelected:(id)sender {
    float x = self.DefaultTipSlider.value;
    self.sliderLabel.text = [NSString stringWithFormat:@"%.2f",x];

}
- (IBAction)onRelease:(id)sender {
    float defaultTip =self.DefaultTipSlider.value;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setFloat:defaultTip forKey:@"default_tip_percentage"];
    [defaults synchronize];
}
@end
