//
//  ViewController.m
//  DynamicFont
//
//  Created by Subo on 2024/2/20.
//

#import "ViewController.h"
#import "FontsManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFont *font = [FontsManager dinotBoldFontOfSize:17];
    self.label.font = font;
}


@end
