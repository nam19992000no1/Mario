//
//  Cloud.m
//  Mario
//
//  Created by techmaster on 9/6/15.
//  Copyright (c) 2015 techmaster. All rights reserved.
//

#import "Cloud.h"

@implementation Cloud
-(void) animate {
    self.view.center = CGPointMake(self.view.center.x +self.speed, self.view.center.y);
    if (self.view.frame.origin.x +self.view.bounds.size.width <0) {
        self.view.center = CGPointMake(self.scene.size.width +self.view.bounds.size.width *0.5, self.view.center.y);
    }
}
@end
