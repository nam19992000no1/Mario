//
//  MainScene.m
//  Mario
//
//  Created by techmaster on 9/6/15.
//  Copyright (c) 2015 techmaster. All rights reserved.
//

#import "MainScene.h"
#import "Sprite.h"
#import "City.h"
#import "Cloud.h"
#import "Block.h"
#import "Light.h"
#define city_background_width 1498


@implementation MainScene {
    City *city1, *city2;
    CGSize citySize;
    NSTimer *timer;
    Cloud *cloud1,*cloud2,*cloud3;
    Light *light1,*light2,*light3;
    NSMutableArray *blocks;
    CGFloat marioRunSpeed;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height +self.navigationController.navigationBar.bounds.size.height;
    self.size = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - statusNavigationBarHeight);
    [self addCity];
    [self addClouds];
    [self addLight];
    marioRunSpeed = 20.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(gameloop) userInfo:nil repeats:true];
}
-(void) addCity {
    citySize = CGSizeMake(city_background_width, 400);
    UIImage *cityBackground = [UIImage imageNamed:@"city.png"];
    city1 = [[City alloc]initWithName:@"city1"
                              ownView:[[UIImageView alloc]initWithImage:cityBackground]
                              inScene:self];
    city1.view.frame = CGRectMake(0, self.size.height - citySize.height, citySize.width, citySize.height);
    city2 = [[City alloc]initWithName:@"city2"
                              ownView:[[UIImageView alloc]initWithImage:cityBackground]
                              inScene:self];
    city2.view.frame = CGRectMake(citySize.width, self.size.height - citySize.height, citySize.width, citySize.height);
    [self.view addSubview:city1.view];
    [self.view addSubview:city2.view];
}
-(void) addClouds {
    cloud1 = [[Cloud alloc]initWithName:@"cloud1"
                              ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cloud1.png"]]
                              inScene:self];
    cloud1.speed = -10.0;
    cloud2 = [[Cloud alloc]initWithName:@"cloud2"
                                ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cloud2.png"]]
                                inScene:self];
    cloud2.speed = - 5.0;
    cloud3 = [[Cloud alloc]initWithName:@"cloud3"
                                ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cloud3.png"]]
                                inScene:self];
    cloud3.speed = -8.0;
    cloud1.view.frame = CGRectMake(20, 15, 100, 100);
    cloud2.view.frame = CGRectMake(150, 3, 80, 80);
    cloud3.view.frame = CGRectMake(260, 7, 90, 90);
    [self addSprites:cloud1];
    [self addSprites:cloud2];
    [self addSprites:cloud3];
    
}
-(void) addLight {
    light1 = [[Light alloc]initWithName:@"light1"
                                ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"light1.png"]]
                                inScene:self];
    light1.speed = marioRunSpeed-15.0;
    light2 = [[Light alloc]initWithName:@"light2"
                                ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"light1.png"]]
                                inScene:self];
    light2.speed = marioRunSpeed-15.0;
    light3 = [[Light alloc]initWithName:@"light3"
                                ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"light1.png"]]
                                inScene:self];
    light3.speed = marioRunSpeed-15.0;
    light1.view.frame = CGRectMake(200, 150, 100,400 );
    light2.view.frame = CGRectMake(100, 200, 100,400 );
    light3.view.frame = CGRectMake(0, 220, 100,400 );
    
    [self addSprites:light1];
    [self addSprites:light2];
    [self addSprites:light3];
    
}

-(void ) gameloop {
    [self moveCityBackAtSpeed:marioRunSpeed];
    for (Sprite *sprite in self.sprites.allValues) {
        [sprite animate];
    }
}
-(void) moveCityBackAtSpeed:(CGFloat) speed {
    city1.view.center =CGPointMake(city1.view.center.x -speed, city1.view.center.y);
    city2.view.center =CGPointMake(city2.view.center.x -speed, city2.view.center.y);
    if (city1.view.frame.origin.x +citySize.width <0.0) {
        city1.view.frame = CGRectMake(city2.view.frame.origin.x+citySize.width, city1.view.frame.origin.y, citySize.width, citySize.height);
    }
    if (city2.view.frame.origin.x +citySize.width <0.0) {
        city2.view.frame = CGRectMake(city1.view.frame.origin.x+citySize.width, city2.view.frame.origin.y, citySize.width, citySize.height);
    }
}
@end
