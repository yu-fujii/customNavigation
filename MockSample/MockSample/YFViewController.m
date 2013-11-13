//
//  YFViewController.m
//  MockSample
//
//  Created by ist_spu on 2013/11/13.
//  Copyright (c) 2013年 YUKO Fujii. All rights reserved.
//

#import "YFViewController.h"

@interface YFViewController ()

@property CAGradientLayer * gradientLayer ;
@property NSArray * colors1;
@property NSArray * colors2;

@end

@implementation YFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"First"];
    
    // ======== view BackgroundColor
    self.view.backgroundColor = [UIColor clearColor];
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.view.bounds;
    self.gradientLayer.colors = [NSArray arrayWithObjects:
                                 (id)[[UIColor greenColor] CGColor], //開始色
                                 (id)[[UIColor blueColor] CGColor], //終了色
                                 nil];
    [self.gradientLayer setStartPoint:CGPointMake(0.0, 0.0)];
    [self.gradientLayer setEndPoint:CGPointMake(1.0, 1.0)]; // 0 degree
    [self.navigationController.view.layer insertSublayer:self.gradientLayer atIndex:0];
    
    self.navigationItem.leftBarButtonItem = [self makeLeftBarButtonWithTarget];
    self.navigationItem.rightBarButtonItem  = [self makeRightBarButtonWithTarget];
    
    // return Button
//    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    UIImage * img =[YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.2] rectSize:CGSizeMake(90, 90)] ;
//    [item setBackgroundImage:img forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    
//    self.navigationItem.backBarButtonItem = item;
    
    //戻るボタンは使わない（位置が合わない）
    self.navigationItem.hidesBackButton = YES;
}

- (UIBarButtonItem *) makeLeftBarButtonWithTarget {
    
    UIImage * imageNormal = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.2]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    UIImage * imageHighlighted = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:1.0]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    UIImage * imageDisabled = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.0]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    
    // create your button
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    //    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [button setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
    [button setBackgroundImage:imageDisabled forState:UIControlStateDisabled];
    
    // set the frame of the button (better to grab actual offset of leftbarbuttonitem instead of magic numbers)
    button.frame = CGRectMake(CONST_NAVIGATIONBAR_LEFT_MARGIN + CONST_NAVIGATIONBAR_LEFT_MARGIN_IOS7,
                              -23.0,
                              imageNormal.size.width,
                              imageNormal.size.height);
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageNormal.size.width, imageNormal.size.height)];
    [view addSubview:button];
    
    // set the barbuttonitem to be the view
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

- (UIBarButtonItem *) makeRightBarButtonWithTarget {
    
    UIImage * imageNormal = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.2]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    UIImage * imageHighlighted = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.4]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    UIImage * imageDisabled = [YFColorManager createImageFromUIColor:[UIColor colorWithRed:1.0 green:1.0  blue:1.0  alpha:0.0]rectSize:CGSizeMake(CONST_NAVIGATIONBAR_HEIGHT, CONST_NAVIGATIONBAR_HEIGHT)];
    
    // create your button
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    //    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [button setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
    [button setBackgroundImage:imageDisabled forState:UIControlStateDisabled];
    [button addTarget:self action:@selector(pushNext:)
     forControlEvents:UIControlEventTouchUpInside];
    
    // set the frame of the button (better to grab actual offset of leftbarbuttonitem instead of magic numbers)
    button.frame = CGRectMake(CONST_NAVIGATIONBAR_RIGHT_MARGIN  - CONST_NAVIGATIONBAR_LEFT_MARGIN_IOS7 ,
                              -23.0,
                              imageNormal.size.width,
                              imageNormal.size.height);
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageNormal.size.width, imageNormal.size.height)];
    [view addSubview:button];
    
    // set the barbuttonitem to be the view
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushNext:(id)sender {
    
    [self performSegueWithIdentifier:@"next" sender:self];
}

@end
