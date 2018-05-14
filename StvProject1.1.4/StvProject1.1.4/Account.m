//
//  Account.m
//  StvProject1.1.4
//
//  Created by 竹本大地 on 2018/05/02.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "Account.h"

@implementation Account

- (id)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex words:(NSString *)words {
    if (self = [super init]) {
        self.name = name;
        self.age = age;
        self.sex = sex;
        self.words = words;
    }
    return self;
}

- (void)dasu {
    //NSString *sex = man;
    // _ = self
    if ([self.sex  isEqual: @"man"]) {
        NSLog(@"%@君は、%@が得意な%ld歳です。",self.name,self.words,(long)_age);
        
    } else {
        NSLog(@"%@さんは、%@が得意な%ld歳です。",self.name,self.words,(long)_age);
        }
    
}

@end
