//
//  SubViewController.m
//  For3DTouchDemo
//
//  Created by noc on 16/4/14.
//  Copyright © 2016年 syy. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@property (nonatomic, strong) UILabel *centerlabel;

@end

@implementation SubViewController

- (UILabel *)centerlabel{
    if (_centerlabel == nil) {
        _centerlabel = ({
            UILabel *label = [UILabel new];
            label.font = [UIFont italicSystemFontOfSize:40];
            label.textColor = HexRGB(0x333333);
            label.text = @"";
            label.numberOfLines = 0;
            label.textAlignment = NSTextAlignmentCenter;
            label;
        });
    }
    return _centerlabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = [NSString stringWithFormat:@"%d",(int)self.number];

    [self configLabel];
    [self.view addSubview:self.centerlabel];
    
    WS(ws);
    [self.centerlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.width.mas_equalTo(APP_SCREEN_WIDTH - 40);
    }];
}

- (void)configLabel{
    if (self.isPressInto) {
        self.centerlabel.text = [NSString stringWithFormat:@"Please Go Back And Try Again! %d",(int)self.number ];
    }else{
        self.centerlabel.text = (self.isPop) ? [NSString stringWithFormat:@"You Did it! %d",(int)self.number]:[NSString stringWithFormat:@"Press Harder! %d",(int)self.number];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self configLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *item1 = [UIPreviewAction actionWithTitle:@"Share me!" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"share");
    }];
    NSArray *actions = @[item1];
    return actions;
}

@end
