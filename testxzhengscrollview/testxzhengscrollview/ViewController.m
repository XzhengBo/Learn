//
//  ViewController.m
//  testxzhengscrollview
//
//  Created by xzheng on 15/10/30.
//  Copyright © 2015年 xzheng. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"


@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic)UIScrollView *scrollView;

@property(nonatomic)UIView *onePixView;
@property(nonatomic)UIView *twoPixView;
@property(nonatomic)UIView *threePixView;
@property(nonatomic)UIView *fourPixView;
@property(nonatomic)UIView *fivePixView;

@property(nonatomic)UIView *bannerView;

@property(nonatomic)CGFloat opVal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    NSLog(@"viewDidLoad");
    [self initSubViews];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initSubViews{
    self.scrollView=[[UIScrollView alloc]init];
    self.onePixView=[[UIView alloc]init];
    self.twoPixView=[[UIView alloc]init];
    self.threePixView=[[UIView alloc]init];
    self.fourPixView=[[UIView alloc]init];
    self.fivePixView=[[UIView alloc]init];

    self.bannerView=[[UIView alloc]init];
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.bannerView];
    [self.scrollView addSubview:self.onePixView];
    [self.scrollView addSubview:self.twoPixView];
    [self.scrollView addSubview:self.threePixView];
    [self.scrollView addSubview:self.fivePixView];
    [self.scrollView addSubview:self.fourPixView];
    
    
    self.scrollView.clipsToBounds = NO;
    self.scrollView.delegate=self;
    self.scrollView.backgroundColor=[UIColor grayColor];
    self.bannerView.backgroundColor=[UIColor darkGrayColor];
    self.scrollView.contentSize=CGSizeMake(self.view.frame.size.width, 600);
    self.onePixView.backgroundColor=[UIColor redColor];
    self.twoPixView.backgroundColor=[UIColor yellowColor];
    self.threePixView.backgroundColor=[UIColor blueColor];
    self.fourPixView.backgroundColor=[UIColor purpleColor];
    self.fivePixView.backgroundColor=[UIColor brownColor];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(300.f);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    [self.onePixView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView.mas_width);
        make.height.equalTo(@1);
        make.top.equalTo(self.scrollView.mas_top);
    }];
    [self.twoPixView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView.mas_width);
        make.height.equalTo(@50);
        make.top.equalTo(self.onePixView.mas_bottom);
    }];
    [self.threePixView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView.mas_width);
        make.height.equalTo(@50);
        make.top.equalTo(self.twoPixView.mas_bottom);
    }];
    [self.fourPixView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView.mas_width);
        make.height.equalTo(@50);
        make.top.equalTo(self.threePixView.mas_bottom);
    }];
    [self.fivePixView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView.mas_width);
        make.height.equalTo(@50);
        make.top.equalTo(self.fourPixView.mas_bottom);
    }];
    
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.onePixView.mas_top);
    }];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //Y轴偏移量
    
    CGFloat offset=300-scrollView.contentOffset.y;
    NSLog(@"offset:%f",offset);
    [self.scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(offset);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    self.opVal=(offset/300);
    self.bannerView.layer.opacity=self.opVal;

    
}
@end
