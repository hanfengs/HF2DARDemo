//
//  Scene.m
//  2DARdemo
//
//  Created by hanfeng on 2017/11/10.
//  Copyright © 2017年 hanfeng. All rights reserved.
//

#import "Scene.h"

@interface Scene()

@property (nonatomic, strong) SKLabelNode *quxue;
@property (nonatomic, strong) SKLabelNode *numberOfQu;
@property (nonatomic, assign) NSInteger count;

@end

@implementation Scene

- (instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        _quxue = [SKLabelNode labelNodeWithText:@"小趣"];
        _numberOfQu = [SKLabelNode labelNodeWithText:@"0"];
        _count = 0;
    }
    return self;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    self.quxue.fontSize = 20;
    self.quxue.fontName = @"DevanagariSangamMN-Bold";
    self.quxue.color = [UIColor whiteColor];
    self.quxue.position = CGPointMake(30, 45);
    //CGPointMake([UIScreen mainScreen].bounds.size.width - 60, 20);
    [self addChild:self.quxue];
    
    self.numberOfQu.fontSize = 25;
    self.numberOfQu.fontName = @"DevanagariSangamMN-Bold";
    self.numberOfQu.color = [UIColor whiteColor];
    self.numberOfQu.position = CGPointMake(30, 20);
    [self addChild:self.numberOfQu];
}

- (void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
    
    self.numberOfQu.text = [NSString stringWithFormat:@"%ld",(long)self.count];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.view isKindOfClass:[ARSKView class]]) {
        return;
    }
    
    ARSKView *sceneView = (ARSKView *)self.view;
    ARFrame *currentFrame = [sceneView.session currentFrame];
    
    // Create anchor using the camera's current position
    //通过摄像头当前的位置，创建锚点
    if (currentFrame) {
        
        // Create a transform with a translation of 0.2 meters in front of the camera
        matrix_float4x4 translation = matrix_identity_float4x4;
        translation.columns[3].z = -2;
        matrix_float4x4 transform = matrix_multiply(currentFrame.camera.transform, translation);
        
        // Add a new anchor to the session
        // 在会话上 Session上 添加一个锚点
        ARAnchor *anchor = [[ARAnchor alloc] initWithTransform:transform];
        [sceneView.session addAnchor:anchor];
        self.count += 1;
    }
}

@end
