//
//  SNColorHeader.h
//  SNMODPCommonComponent
//
//  Created by 丁旭朋 on 2019/7/24.
//  Copyright © 2019 SNMODP. All rights reserved.
//

#ifndef SNColorHeader_h
#define SNColorHeader_h

#define SNColorRGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define SNColorWhitHex(string) [UIColor colorWithHexString:string]//16进制转化

#define colorDictionary [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SNColorPlist" ofType:@"plist"]]

#define TitleColor  [UIColor colorWithHexString:[colorDictionary objectForKey:@"TitleColor"]]

#define NavigationBackgroundColor  [UIColor colorWithHexString:[colorDictionary objectForKey:@"NavigationBackgroundColor"]]

#endif /* SNColorHeader_h */
