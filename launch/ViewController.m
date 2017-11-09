//
//  ViewController.m
//  launch
//
//  Created by qtz on 2017/2/22.
//  Copyright © 2017年 qtz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenRect.size;
    CGFloat btnW = 80;
    CGFloat btnH = 30;
    CGFloat dW = screenSize.width/5;
    
    for(int i = 1; i <= 3; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        CGRect frame = CGRectMake(screenSize.width/2 - btnW/2 + (i-2) * dW, screenSize.height/2 - btnH/2, btnW, btnH);
        btn.tag = i;
        [btn setFrame:frame];
        NSString *title = [NSString stringWithFormat:@"test%d", i];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:btn];
    }
  }

-(void) btnPressed:(id)sender
{
    UIButton *btn = (UIButton*) sender;
    NSURL *url = NULL;
    
    if(btn.tag == 1)
    {
        url = [NSURL URLWithString:@"dhh://client.alpha.q3.175game.com/patch/ios/config_launch1"];
    }
    else if(btn.tag == 2)
    {
        url = [NSURL URLWithString:@"dhh://client.alpha.q3.175game.com/patch/ios/config_launch2"];
    }
    else if (btn.tag == 3)
    {
        url = [NSURL URLWithString:@"dhh://client.alpha.q3.175game.com/patch/ios/config_launch3"];
    }
    else
    {
        return;
    }
    
    if([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
        NSLog(@"launch dhh success!");
    }
    else
    {
        NSLog(@"launch dhh failure!");
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
