//
//  NSDictionary+MutableDeepCopy.m
//  iTOLA
//
//  Created by Isaac Gonzalvez on 25/04/13.
//  Copyright (c) 2013 Isaac Gonzalvez. All rights reserved.
//

#import "NSDictionary+MutableDeepCopy.h"

@implementation NSDictionary (MutableDeepCopy)


//Este metodo crea un nuevo mutable dictionary y crea un loop a traves de todas las keys del dicionario origianl, haciendo copias mutables de cada array que encuentra. Ya que este metodo es parte de NSDictionary, cualquier referencia al self es una referencia al dicionario que este metodo esta llamando. Este metodo en primer lugar intenta hacer una deepmutablecopy, y si el objeto no responde intenta crear una mutablecopy. Si el objeto no responde a la mutablecopy intenta volver a hacer una copua para asegurarse de que todos los objetos contenidos en el diccionario son copiados. De esta manera si tenemos un diccionaro que contiene dicionarios, estos tambien tienen una deepcopy
- (NSMutableDictionary *)mutableDeepCopy {
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    NSArray *keys = [self allKeys];
    for (id key in keys) { //esto se llama fast enumeration y sirve para deplazarnos a traves de una coleccion en forma de loop.
        id oneValue = [self valueForKey:key];
        id oneCopy = nil;
        
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
            oneCopy = [oneValue mutableDeepCopy];
        else if ([oneValue respondsToSelector:@selector(mutableCopy)])
            oneCopy = [oneValue mutableCopy];
        if (oneCopy == nil)
            oneCopy = [oneValue copy];
        [returnDict setValue:oneCopy forKey:key];
    }
    return returnDict;
}



@end
