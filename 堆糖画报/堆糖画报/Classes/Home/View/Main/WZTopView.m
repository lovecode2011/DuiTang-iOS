//
//  WZTopView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/7.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZTopView.h"
#import "WZCellFrame.h"
#import "WZObjectLists.h"
#import "WZPhoto.h"
#import "UIImageView+WebCache.h"
#import "JXLDayAndNightMode.h"
@interface WZTopView()
/**画报的配图*/
@property(nonatomic ,weak)UIImageView *photo;
/**画报的配图描述*/
@property(nonatomic ,weak)UILabel *msg;
/**画报的配图右下角长图标志*/
@property(nonatomic ,weak)UILabel *mark;

@end
@implementation WZTopView

- (void)setCellFrame:(WZCellFrame *)cellFrame
{
    _cellFrame=cellFrame;
    // 1.取出模型数据
    WZObjectLists *objectList=cellFrame.objectLists;
    WZPhoto *photo=objectList.photo;

    // 2.画报的配图
    
    NSMutableString *str = [[NSMutableString alloc]initWithCapacity:0];
    [str appendString:[NSString stringWithFormat:@"%@",photo.path]];
    NSRange range = [str rangeOfString:@"_webp"];
    if (range.location == NSNotFound) {
//         NSLog(@"没有找到");
//        NSLog(@"%@",photo.path);
    }else{
    [str deleteCharactersInRange:range];
    
    [self.photo setImageWithURL:[NSURL URLWithString:str]placeholderImage:[UIImage imageNamed:@"image_default"]];
    }

    self.photo.frame=self.cellFrame.photoF;
    
    // 3.画报的配图右下角长图标志
    self.mark.frame=self.cellFrame.markF;
    
    // 4.画报的配图描述
    self.msg.text=[NSString stringWithFormat:@"%@",objectList.msg];
    
    self.msg.frame=self.cellFrame.msgF;
}
- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        // 画报的配图
        UIImageView *photo=[[UIImageView alloc]init];
        self.photo=photo;
        [self addSubview:self.photo];
        
        //画报的配图右下角长图标志
        UILabel *mark=[[UILabel alloc]init];
        mark.backgroundColor=WZColor(102, 138, 189);
        mark.text=@"长图";
        mark.textAlignment=NSTextAlignmentCenter;
        mark.textColor=[UIColor whiteColor];
        mark.font=ToolBarFont;
        self.mark=mark;
        [self addSubview:self.mark];
        
        //画报的配图描述
        UILabel *msg=[[UILabel alloc]init];
        msg.font = MsgFont;
        msg.numberOfLines=0;
        self.msg=msg;
        [self addSubview:self.msg];
        
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            self.msg.textColor=[UIColor blackColor];
        } nightMode:^(UIView *view) {
            self.msg.textColor=WZNightTextColor;
        }];
    }
    return self;
}


@end
