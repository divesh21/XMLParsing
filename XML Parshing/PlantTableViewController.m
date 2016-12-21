//
//  PlantTableViewController.m
//  XML Parshing
//
//  Created by student14 on 14/12/16.
//  Copyright © 2016 Felix-ITs-Divesh. All rights reserved.
//

#import "PlantTableViewController.h"
#import "Plant.h"
#import "CustomTableViewCell.h"

@interface PlantTableViewController ()

@end

@implementation PlantTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _plantArray =[[NSMutableArray alloc]init];
     [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    NSString *str=@"http://www.w3schools.com/xml/plant_catalog.xml";
    _saxparser=[[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:str]];
    
    _saxparser.delegate=self;
    [_saxparser parse];
    
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{

    if([elementName isEqualToString:@"PLANT"])
    {
        _p=[[Plant alloc]init];
    }
    
    if([elementName isEqualToString:@"COMMON"])
    {
        _commonName=[[NSMutableString alloc]init];
    }
    
    if([elementName isEqualToString:@"BOTANICAL"])
    {
        _commonName=[[NSMutableString alloc]init];
    }
    
    if([elementName isEqualToString:@"ZONE"])
    {
        _commonName=[[NSMutableString alloc]init];
    }
    
    
    if([elementName isEqualToString:@"LIGHT"])
    {
        _commonName=[[NSMutableString alloc]init];
    }
    
    
    if([elementName isEqualToString:@"PRICE"])
    {
        _commonName=[[NSMutableString alloc]init];
    }
    
    
    if([elementName isEqualToString:@"AVAILABILITY"])
    {
        _commonName=[[NSMutableString alloc]init];
    }
    
    
    
    
    

}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
 
    [_commonName appendString:string];

}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{

    if([elementName isEqualToString:@"COMMON"])
    {
        _p.commonname=_commonName;
    }
    
    if([elementName isEqualToString:@"BOTANICAL"])
    {
        _p.botanicalname=_commonName;
    }
    
    if([elementName isEqualToString:@"ZONE"])
    {
        _p.zone=_commonName;
    }
    
    if([elementName isEqualToString:@"LIGHT"])
    {
        _p.light=_commonName;
    }
    
    if([elementName isEqualToString:@"PRICE"])
    {
        _p.price=_commonName;
    }
    
    if([elementName isEqualToString:@"AVAILABILITY"])
    {
        _p.availability=_commonName;
    }
    
    if([elementName isEqualToString:@"PLANT"])
    {
    
        [_plantArray addObject:_p];
    
    }

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _plantArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Plant *temp =[_plantArray objectAtIndex:indexPath.row];
    
    cell.commonlbl.text=temp.commonname;
    cell.botanicalLbl.text=temp.botanicalname;
    cell.availailityLbl.text=temp.availability;
    cell.zoneLbl.text=temp.zone;
    cell.lightLbl.text=temp.light;
    cell.priceLbl.text=temp.price;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 132;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
