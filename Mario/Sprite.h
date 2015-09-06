//
//  Sprite.h
//  Mario
//
//  Created by techmaster on 9/6/15.
//  Copyright (c) 2015 techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Scene.h"
@class Scene; //Foreward class declaration

@interface Sprite : NSObject
@property ( nonatomic,strong) UIView *view;
@property (nonatomic,strong) NSString *name;
@property ( nonatomic,weak) Scene *scene;
-(instancetype) initWithName:(NSString*) name
                     ownView: (UIView*) view
                     inScene: (Scene*) scene;
-(void) animate;
@end
