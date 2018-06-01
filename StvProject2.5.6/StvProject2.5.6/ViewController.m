//
//  ViewController.m
//  StvProject2.5.6
//
//  Created by 竹本大地 on 2018/06/01.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import  <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;
// 緯度
@property (weak, nonatomic) IBOutlet UILabel *labelLatitude;
// 経度
@property (weak, nonatomic) IBOutlet UILabel *labelLongitude;
// 時間
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ユーザから位置情報の利用について承認
    if (nil == self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        
        // iOS 8以上
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            // NSLocationWhenInUseUsageDescriptionに設定したメッセージでユーザに確認
            [ self.locationManager requestWhenInUseAuthorization];
            // NSLocationAlwaysUsageDescriptionに設定したメッセージでユーザに確認
            //[locationManager requestAlwaysAuthorization];
        }
    }
    if (nil == self.locationManager)
        self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // 更新間隔はdistanceFilterプロパティ
    //self.locationManager.distanceFilter = 500;
    // 情報の更新を開始すれば、位置情報を取得
    [self.locationManager startUpdatingLocation];
}

// GPSで位置情報の更新があったときに呼ばれる
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    // 時間
    NSDate* timestamp = location.timestamp;
    NSLog(@"緯度 %+.6f, 経度 %+.6f\n", location.coordinate.latitude, location.coordinate.longitude);
    // 緯度 %+.6f
    self.labelLatitude.text = [NSString stringWithFormat:@"%+.6f", location.coordinate.latitude];
    // 経度 %+.6f
    self.labelLongitude.text = [NSString stringWithFormat:@"%+.6f", location.coordinate.longitude];
    // 日時時間
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    self.labelTime.text = [df stringFromDate:timestamp];
    
}

@end
