//
//  YFSecondViewController.m
//  MockSample
//
//  Created by ist_spu on 2013/11/13.
//  Copyright (c) 2013年 YUKO Fujii. All rights reserved.
//

#import "YFSecondViewController.h"

@interface YFSecondViewController ()

@end

@implementation YFSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationItem.leftBarButtonItem  = [self makeLeftBarButtonWithTarget];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIBarButtonItem *) makeLeftBarButtonWithTarget {
    
    UIImage * imageNormal = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:1.0]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    UIImage * imageHighlighted = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.4]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    UIImage * imageDisabled = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.0]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    
    // create your button
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [button setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
    [button setBackgroundImage:imageDisabled forState:UIControlStateDisabled];
    
    // set the frame of the button (better to grab actual offset of leftbarbuttonitem instead of magic numbers)
    button.frame = CGRectMake(CONST_NAVIGATIONBAR_LEFT_MARGIN + CONST_NAVIGATIONBAR_LEFT_MARGIN_IOS7,
                              -23.0,
                              imageNormal.size.width, imageNormal.size.height);
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageNormal.size.width, imageNormal.size.height)];
    [view addSubview:button];
    
    // set the barbuttonitem to be the view
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

- (void) dismiss:(id)sender {
    [self.navigationController popViewControllerAnimated:YES ];
}

@end
