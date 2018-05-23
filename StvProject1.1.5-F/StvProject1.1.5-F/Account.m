//
//  Account.m
//  StvProject1.1.5-F
//
//  Created by 竹本大地 on 2018/05/23.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "Account.h"

@implementation Account

- (id)initWithName:(NSString *)name
               age:(NSInteger)age
               sex:(NSString *)sex
          language:(NSString *)language {
    
    if (self = [super init]) {
        self.name = name;
        self.age = age;
        self.sex = sex;
        self.language = language;
        
    }
    return self;
}

- (void)printAccount {
    if ([self.sex isEqual: @"M"]) {
        NSLog(@"%@ Kovacsは、%@が得意な%ld歳です。", self.name, self.language, self.age);
    } else {
        NSLog(@"%@さんは、%@が得意な%ld歳です。", self.name, self.language, self.age);
    }
}

@end
