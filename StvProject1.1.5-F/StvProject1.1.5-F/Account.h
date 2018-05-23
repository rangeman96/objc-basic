//
//  Account.h
//  StvProject1.1.5-F
//
//  Created by 竹本大地 on 2018/05/23.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property NSString *name;
@property NSInteger age;
@property NSString *sex;
@property NSString *language;

- (id)initWithName:(NSString *)name
               age:(NSInteger)age
               sex:(NSString *)sex
          language:(NSString *)language;

- (void)printAccount;

@end
