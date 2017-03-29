//
//  ViewController.m
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "ViewController.h"
#import "LFCalendarManager.h"
#import "LFCalendarCollectionViewCell.h"

#import "LFCanlendarModel.h"


#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
#define cellWidth ((self.view.frame.size.width-16)/7.0)

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *myCollectionView;
//@property (strong,nonatomic) UIView *topHeaderView;
@property (strong,nonatomic) NSMutableArray *sourceDataArray;
@end

static NSString *yearStr = @"2017";



@implementation ViewController

- (NSMutableArray *) sourceDataArray{
    if (!_sourceDataArray) {
        _sourceDataArray = [[NSMutableArray alloc] init];
        _sourceDataArray = [[LFCalendarManager sharedManager] getDateModelArrayByYear:yearStr];
    }
    return _sourceDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self creatMyCollectionView];
}


#pragma mark ---    创建表格
-  (void)creatMyCollectionView{
    if (!self.myCollectionView) {
        UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(cellWidth, cellWidth);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical]; //设置横向还是竖向
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing =2;
        
        self.myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
        
        self.myCollectionView.dataSource = self;
        self.myCollectionView.delegate = self;
        
        self.myCollectionView.bounces = NO;
        self.myCollectionView.backgroundColor = [UIColor whiteColor];
        
        [self.myCollectionView registerNib:[UINib nibWithNibName:@"LFCalendarCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"LFCalendarCollectionViewCell"];
//////////////////   设置sectionHeaderView    ////////////////////////
        [self.myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 74);
//////////////////   设置sectionHeaderView    ////////////////////////
        
        self.preferredContentSize = CGSizeMake(WIDTH,44);//headerView
        
        
        [self.view addSubview:self.myCollectionView];
    }
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIView *_topHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 74)];
    
    UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    monthLabel.text = [NSString stringWithFormat:@"%@年%ld月",yearStr,indexPath.section+1];
    monthLabel.backgroundColor = [UIColor lightGrayColor];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    [_topHeaderView addSubview:monthLabel];
    
    NSString *weekStr = nil;
    for (int i=0; i<7; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth+3)*i, 30, cellWidth, 44)];
 //       label.textColor = [UIColor whiteColor];
  //      label.backgroundColor = [UIColor greenColor];
        switch (i) {
            case 0:
                weekStr = @"SUN";
                
                label.textColor = [UIColor redColor];
                break;
            case 1:
                weekStr = @"MON";
                break;
            case 2:
                weekStr = @"TUE";
                break;
            case 3:
                weekStr = @"WED";
                break;
            case 4:
                weekStr = @"THU";
                break;
            case 5:
                weekStr = @"FRI";
                break;
            default:
                weekStr = @"SAT";
                label.textColor = [UIColor redColor];
                break;
        }
        label.font = [UIFont systemFontOfSize:15];
        label.text = [NSString stringWithFormat:@"%@",weekStr];
        label.textAlignment = NSTextAlignmentCenter;
        [_topHeaderView addSubview:label];
    }
    [headerView addSubview:_topHeaderView];
    return headerView;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sourceDataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    LFCanlendarModel *model = self.sourceDataArray[section];
    NSArray *arr = model.monthWeekArray;
    NSInteger number = [arr[0] integerValue]-1;
    return number+[model.monthAllDayCount integerValue];
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LFCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LFCalendarCollectionViewCell" forIndexPath:indexPath];
    LFCanlendarModel *model = self.sourceDataArray[indexPath.section];
    NSArray *arr = model.monthWeekArray;
    NSInteger number = indexPath.row+1-[arr[0] integerValue];
    if (number>=0) {
        [cell setCellStylebyIndexPath:indexPath withNowInteger:number+1 withYear:yearStr];
    }else{
        [cell setCellStylebyIndexPath:indexPath withNowInteger:0  withYear:yearStr];
    }
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //选中某行干嘛
    LFCanlendarModel *model = self.sourceDataArray[indexPath.section];
    NSArray *arr = model.monthWeekArray;
    NSInteger number = indexPath.row+2-[arr[0] integerValue];
    if (number>0) {
        NSLog(@"选中的日期是%@年%ld月%ld日",yearStr,indexPath.section+1,number);
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
