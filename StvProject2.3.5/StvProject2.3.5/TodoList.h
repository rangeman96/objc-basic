//
//  TodoList.h
//  StvProject2.3.5
//
//  Created by 竹本大地 on 2018/05/24.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoList : NSObject

@property (nonatomic, assign) NSInteger todo_id;
@property (nonatomic,   copy) NSString *todo_title;
@property (nonatomic,   copy) NSString *todo_contents;
@property (nonatomic,   copy) NSDate *created;
@property (nonatomic,   copy) NSDate *modified;
@property (nonatomic,   copy) NSDate *limit_date;

@end
