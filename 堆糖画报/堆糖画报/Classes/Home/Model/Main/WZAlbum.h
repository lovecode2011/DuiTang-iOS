//
//  WZAlbum.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface WZAlbum : JSONModel
/**
 *  画报的所属相册名称 */
@property (nonatomic, copy) NSString *name;
/**
 *  画报的所属相册封面
 */
//@property (nonatomic, copy) NSString *covers;
@property (nonatomic,copy) NSString *id;

@property (nonatomic,weak) NSNumber *count;
@property (nonatomic,weak) NSNumber *category;
@property (nonatomic,weak) NSNumber *like_count;

@end
