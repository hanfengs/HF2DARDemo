//
//  boyNode.m
//  2DARdemo
//
//  Created by hanfeng on 2017/11/23.
//  Copyright © 2017年 hanfeng. All rights reserved.
//

#import "boyNode.h"

@interface boyNode()

@property (strong, nonatomic) SKAction * walk;
@property (strong, nonatomic) SKAction * walkForever;

@end

@implementation boyNode

- (instancetype)init{
    if (self = [super init]) {
        

        SKTexture *boy1 = [SKTexture textureWithImageNamed:@"role_1_run_5_0001"];
        SKTexture *boy2 = [SKTexture textureWithImageNamed:@"role_1_run_5_0002"];
        SKTexture *boy3 = [SKTexture textureWithImageNamed:@"role_1_run_5_0003"];
        SKTexture *boy4 = [SKTexture textureWithImageNamed:@"role_1_run_5_0004"];
        SKTexture *boy5 = [SKTexture textureWithImageNamed:@"role_1_run_5_0005"];
        SKTexture *boy6 = [SKTexture textureWithImageNamed:@"role_1_run_5_0006"];
        
        
//        self.walk = [SKAction animateWithTextures:@[boy1, boy2, boy3, boy4, boy5, boy6] timePerFrame:0.1];
//        self.walkForever = [SKAction repeatActionForever:self.walk];
        
        self = [boyNode spriteNodeWithTexture:boy1];
        [self setTexture:boy1];
        
        
        SKTextureAtlas *boyAtlas = [SKTextureAtlas atlasNamed:@"role_1_run_5.atlas"];
        
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSInteger i = 0; i < boyAtlas.textureNames.count; i++) {
            NSString *name = [NSString stringWithFormat:@"role_1_run_5_%04ld", i + 1];
            SKTexture *boy = [SKTexture textureWithImageNamed:name];
            [arrM addObject:boy];
            
        }
        self.walk = [SKAction animateWithTextures:arrM.copy timePerFrame:0.1];
        self.walkForever = [SKAction repeatActionForever:self.walk];
        
        [self runAction:self.walkForever withKey:@"walkForever"];
        
        
    }
    return self;
}
@end
