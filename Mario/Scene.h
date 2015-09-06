//
//  Scene.h
//  Mario
//
//  Created by techmaster on 9/6/15.
//  Copyright (c) 2015 techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sprite.h"
@class Sprite; //Foreward class declaration
@interface Scene : UIViewController
@property(nonatomic, strong)NSMutableDictionary *sprites;
@property(nonatomic, assign) CGSize size;
-(void) addSprites:(Sprite *)sprite;
-(void) removeSprites:(Sprite *)sprite;
-(void) removeSpriteByName:(NSString*) spriteName;
@end
