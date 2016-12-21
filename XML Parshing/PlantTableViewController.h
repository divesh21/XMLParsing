//
//  PlantTableViewController.h
//  XML Parshing
//
//  Created by student14 on 14/12/16.
//  Copyright © 2016 Felix-ITs-Divesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plant.h"
@interface PlantTableViewController : UITableViewController<NSXMLParserDelegate>

@property(nonatomic,retain) NSMutableArray * plantArray;
@property(nonatomic,retain) NSXMLParser *saxparser;
@property(nonatomic,retain) NSMutableString *commonName;
@property Plant *p;


@end
