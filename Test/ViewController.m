//
//  ViewController.m
//  Test
//
//  Created by qyhc on 2017/11/13.
//  Copyright © 2017年 com.qykj. All rights reserved.
//

#import "ViewController.h"
#import "PlayerViewController.h"

@interface ViewController ()

<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (strong, nonatomic) UIWindow *videoWin;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}


#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellStr"];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellStr"];
    }
    
    cell.textLabel.text = @"test";
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PlayerViewController *playerVC = [[PlayerViewController alloc] init];
    
    UIViewController *vc = [[UIViewController alloc] init];
    self.videoWin.rootViewController = vc;
    UIWindow *keyWin = [UIApplication sharedApplication].keyWindow;
    
    typeof(self) __weak weakSelf = self;
    playerVC.url = @"http://flv3.bn.netease.com/videolib3/1712/05/FCOLY1319/SD/FCOLY1319-mobile.mp4";
    playerVC.playFinished = ^(){
        
        weakSelf.videoWin.rootViewController = nil;
        [keyWin makeKeyAndVisible];
    };
    [self.videoWin makeKeyAndVisible];
     [vc presentViewController:playerVC animated:YES completion:nil];
    
}



#pragma mark  - lazyloadind
- (UIWindow *)videoWin{
    
    if (!_videoWin) {
        _videoWin = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _videoWin;
}


- (UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 100;
        
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
