//
//  SharedIndizes.h
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

#ifndef SharedIndizes_h
#define SharedIndizes_h

#ifdef __METAL_VERSION__
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#define NSInteger metal::int32_t
#else

#import <Foundation/Foundation.h>

#endif /* __METAL_VERSION__ */
#endif /* SharedIndizes_h */

typedef NS_ENUM(NSInteger, VertexAttributeIndizes)
{
    VertexAttributeIndizesPosition = 0,
    VertexAttributeIndizesNormal  = 1,
};
