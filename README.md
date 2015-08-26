# CFDynamicLabel
实现在有限label上 动态显示所有文字
===========================
效果如下:

![image](https://github.com/yuchuanfeng/CFDynamicLabel/blob/master/001.gif)

### 思路
### (1)创建一个view 作为所有内容的父控件, 并且添加到上面一个 label, 作为显示文字的载体

    UILabel* contentLabel = [[UILabel alloc] init];
    [contentLabel sizeToFit];
   contentLabel.backgroundColor = [UIColor clearColor];
    _contentLabel = contentLabel;
    [self addSubview:self.contentLabel];

### (2)给内容view的layer添加一个mask层, 并且设置其范围为整个view的bounds, 这样就让超出view的内容不会显示出来
    CAShapeLayer* maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.mask = maskLayer;

### (3)给label添加动画
    CAKeyframeAnimation* keyFrame = [CAKeyframeAnimation animation];
    keyFrame.keyPath = @"transform.translation.x";
    keyFrame.values = @[@(0), @(-space), @(0)];
    keyFrame.repeatCount = NSIntegerMax;
    keyFrame.duration = self.speed * self.contentLabel.text.length;
    keyFrame.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithControlPoints:0 :0 :0.5 :0.5]];
    keyFrame.delegate = self;
    
    [self.contentLabel.layer addAnimation:keyFrame forKey:nil];
