//
//  URSwitchCardView.m
//  URJapan
//
//  Created by lin weiyan on 20/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URSwitchCardView.h"
#import "URCard.h"
#import "URLessionModel.h"
#import "URMarco.h"

static float viewScale = 0.70f;

@interface URSwitchCardView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView          *scrollView;
@property (nonatomic, strong) NSMutableArray        *cardsArray;
@property (nonatomic, assign) CGFloat               startPointX;
//滚动之后的位置
@property (nonatomic, assign) CGFloat               endPointX;
//需要居中显示的index
@property (nonatomic, assign) NSInteger             currentIndex;
@property (nonatomic, strong) NSArray               *dataArray;

@end

@implementation URSwitchCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cardsArray = [[NSMutableArray alloc] init];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = false;
        [self addSubview:_scrollView];
        
        _currentIndex = 0;
    }
    return self;
}

- (void)dealloc
{
    _scrollView.delegate = nil;
}


#pragma mark - init

- (float)cardWidth
{
    return viewScale * self.bounds.size.width;
}

//卡片间隔
-(float)margin
{
    return (self.bounds.size.width - [self cardWidth])/4;
}
//卡片起始位置
-(float)startX
{
    return (self.bounds.size.width - [self cardWidth])/2.0f;
}

- (void)updateData:(NSArray *)array
{
    self.dataArray = [[NSMutableArray alloc] initWithArray:array];
    
    for (NSInteger i = 0; i < array.count; i++ ) {
        //第一步 在ScrollView上添加卡片
        float viewX = [self startX] + i*([self cardWidth] + [self margin]);
        URCard * card = [[URCard alloc] initWithFrame:CGRectMake(viewX, 0, [self cardWidth], self.bounds.size.height)];
        URLessionModel *model = [array objectAtIndex:i];
        [card updateData:model];
        card.tag = i;
        [_cardsArray addObject:card];
        [_scrollView addSubview:card];
        [_scrollView setContentSize:CGSizeMake(card.frame.origin.x + [self cardWidth] + 2*[self margin], 0)];
        
        WeakSelf()
        card.callback = ^(NSUInteger tag) {
            [weakSelf onCardClick:tag];
        };
    }
    //更新卡片的大小
    [self updateCardTransform];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //滚动到视图中间位置
    dispatch_async(dispatch_get_main_queue(), ^{
        [self scrollToCurrentCard];
    });
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _startPointX = scrollView.contentOffset.x;
}

//当ScrollView拖动时 变换每个view的大小，并保证居中屏幕的view高度最高
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updateCardTransform];
}

- (void)scrollToCurrentCard
{
    _endPointX = _scrollView.contentOffset.x;
    //设置滚动最小生效范围，滚动超过scrollMiniDistance 即视为有切换卡片的意向
    float scrollMiniDistance = self.bounds.size.width/30.0f;
    if (_startPointX - _endPointX > scrollMiniDistance) {
        NSLog(@"向右滑动屏幕");
        if (_currentIndex != 0) {
            _currentIndex -= 1;
        }
    }else if (_endPointX - _startPointX  > scrollMiniDistance)
    {
        NSLog(@"向左滑动屏幕");
        if (_currentIndex != self.cardsArray.count - 1) {
            _currentIndex += 1;
        }
    }
    float viewX = [self startX] + _currentIndex*([self cardWidth] + [self margin]);
    float needX = viewX - [self startX];
    
    [_scrollView setContentOffset:CGPointMake(needX, 0) animated:true];
}

- (void)updateCardTransform
{
    for (int i = 0; i < self.cardsArray.count; i++) {
        URCard *card = [self.cardsArray objectAtIndex:i];
        
        if (i == self.currentIndex + 1 && self.currentIndex != 0) {
            [self bringSubviewToFront:card];
        }
        else {
            [self sendSubviewToBack:card];
        }
        
        //获取卡片所在index
        //获取ScrollView滚动的位置
        CGFloat scrollOffset = _scrollView.contentOffset.x;
        //获取卡片中间位置滚动的相对位置
        CGFloat cardCenterX = card.center.x - scrollOffset;
        //获取卡片中间位置和父视图中间位置的间距，目标是间距越大卡片越短
        CGFloat apartLength = fabs(self.bounds.size.width/2.0f - cardCenterX);
        //移动的距离和屏幕宽度的的比例
        CGFloat apartScale = apartLength/self.bounds.size.width;
        //把卡片移动范围固定到 -π/4到 +π/4这一个范围内
        CGFloat scale = fabs(cos(apartScale * M_PI/4));
//        NSLog(@"++++ %ld, %f", self.currentIndex, scale);
        //设置卡片的缩放
        card.transform = CGAffineTransformMakeScale(1.0, scale);
    }
}

#pragma mark - callback

- (void)onCardClick:(NSUInteger)tag
{
    SafetyCallblock(self.switchCardCallback, tag);
}

@end
