//
//  AppDelegate.m
//  StvProject2.6.2
//
//  Created by 竹本大地 on 2018/06/05.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options

{
    NSLog(@"url - %@", url);
    NSString *encodeUrl = [url.query stringByRemovingPercentEncoding];
    NSLog(@"encode - %@", encodeUrl);
    
    if (encodeUrl) {
        self.result = [NSMutableDictionary new];
        NSArray *params = [encodeUrl componentsSeparatedByString:@"&"]; // この文字列で分断してarrayに
        
        NSLog(@"%@", params);
        
        for (NSString *param in params) {
            if (param.length > 0) {
                NSArray *elements = [param componentsSeparatedByString:@"="];
                id key   = [elements[0] stringByRemovingPercentEncoding];
                id value = (elements.count == 1 ? @YES : [elements[1] stringByRemovingPercentEncoding]);
                
                [self.result setObject:value forKey:key];
            }
        }
        return [self.result copy];
    } else {
        return YES;
    }
}
@end
