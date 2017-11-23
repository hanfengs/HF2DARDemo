//
//  Scene.m
//  2DARdemo
//
//  Created by hanfeng on 2017/11/10.
//  Copyright © 2017年 hanfeng. All rights reserved.
//

#import "Scene.h"

@interface Scene()

@end

@implementation Scene

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
}

- (void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
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
    }
}

@end
