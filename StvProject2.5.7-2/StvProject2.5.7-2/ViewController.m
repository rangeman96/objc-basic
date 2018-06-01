//
//  ViewController.m
//  StvProject2.5.7-2
//
//  Created by 竹本大地 on 2018/06/01.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//


#import "ViewController.h"
@import MapKit;

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Delegate をセット
    self.mapView.delegate = self;

    // 緯度・軽度を設定
    CLLocationCoordinate2D location;
    location.latitude = 35.623655;
    location.longitude = 139.724858;

    // 指定した位置で地図を表示
    [self.mapView setCenterCoordinate:location animated:NO];

    // 縮尺を設定
    MKCoordinateRegion region = self.mapView.region;
    region.center = location;
    region.span.latitudeDelta = 0.01;
    region.span.longitudeDelta = 0.01;
    [self.mapView setRegion:region animated:NO];

    // 表示タイプを航空写真と地図のハイブリッドに設定
    self.mapView.mapType = MKMapTypeHybrid;
//    // 表示タイプ普通のやつVer.
//    self.mapView.mapType = MKMapTypeStandard;

    // Annotation // 新しいピンを作成
    MKPointAnnotation *annotation = [MKPointAnnotation new];

    // ピンの位置
    annotation.coordinate = CLLocationCoordinate2DMake(35.623655, 139.724858);
    annotation.title = @"スマートテック・ベンチャーズ";
    annotation.subtitle = @"東京都品川区大崎5-1-5 4F";
    
    // ピンを追加
    [self.mapView addAnnotation:annotation];
    [self.view addSubview:self.mapView];
}

// Annotation用のデリゲートメソッド
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {

    // 識別子を定義
    static NSString *Identifier = @"PinAnnotationIdentifier";
    MKPinAnnotationView *pinView;

    // 再利用可能なものを取得
    pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:Identifier];

    if (!pinView) {
        annotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:Identifier];
        return pinView;
    }
    pinView.annotation = annotation;
    pinView.canShowCallout = YES;

    return pinView;
}

@end
