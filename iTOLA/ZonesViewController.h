//
//  ZonesViewController.h
//  iTOLA
//
//  Created by Isaac Gonzalvez on 25/04/13.
//  Copyright (c) 2013 Isaac Gonzalvez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZonesViewController : UIViewController
 <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table; //apuntara a la tableview
@property (strong, nonatomic) IBOutlet UISearchBar *search; //apuntara a la searchbar
@property (strong, nonatomic) NSDictionary *allNames; //almacenara todos los datos
@property (strong, nonatomic) NSMutableDictionary *names; //almacenara los names que coincidan con la busqueda
@property (strong, nonatomic) NSMutableArray *keys; //almacenara los index values y section names
@property (assign, nonatomic) BOOL isSearching; //esta property variable rastrea el uso de la search bar

- (void)resetSearch;

- (void)handleSearchForTerm:(NSString *)searchTerm;

@end
