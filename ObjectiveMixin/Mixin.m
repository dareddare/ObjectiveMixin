//
//  Mixin.m
//  ObjectiveMixin
//
//  Created by Vladimir Mitrovic on 24/02/2011.
//  Copyright 2011 Vladimir Mitrovic. All rights reserved.
//

#import "Mixin.h"
#import <objc/runtime.h>


@implementation Mixin

+ (void) from:(Class)sourceClass into:(Class)destinationClass
{
	// Mixin methods
	unsigned int methodCount = 0;
	Method* methodList = class_copyMethodList(sourceClass, &methodCount);
	
	for (int i = 0; i < methodCount; i++) {
		Method m = methodList[i];
		SEL name = method_getName(m);
		IMP imp = method_getImplementation(m);
		const char* types = method_getTypeEncoding(m);
		class_replaceMethod(destinationClass, name, imp, types);
	}
}

@end