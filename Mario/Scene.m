//
//  Scene.m
//  Mario
//
//  Created by techmaster on 9/6/15.
//  Copyright (c) 2015 techmaster. All rights reserved.
//

#import "Scene.h"


@implementation Scene
-(void) loadView {
    [super loadView];
    self.sprites= [NSMutableDictionary new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) addSprites:(Sprite *)sprite{
    [self.sprites setObject:sprite forKeyedSubscript:sprite.name];
    [self.view addSubview: sprite.view];
}
-(void) removeSprites:(Sprite *)sprite{
    [self.sprites removeObjectForKey:sprite.name];
    [sprite.view removeFromSuperview];
}
-(void) removeSpriteByName:(NSString *)sptireName{
    UIView* removeView = self.sprites[sptireName];
    [removeView removeFromSuperview];
    [self.sprites removeObjectForKey:sptireName];
}

@end
