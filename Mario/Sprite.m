//
//  Sprite.m
//  Mario
//
//  Created by techmaster on 9/6/15.
//  Copyright (c) 2015 techmaster. All rights reserved.
//

#import "Sprite.h"

@implementation Sprite
-(instancetype) initWithName:(NSString*) name
                     ownView: (UIView*) view
                     inScene: (Scene*) scene {
    if (self = [super init]) {
        self.name = name;
        self.view = view;
        self.scene = scene;
    }
    return self;
}
-(void) animate{
    //do nothing
}
@end
