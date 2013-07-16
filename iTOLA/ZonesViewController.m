//
//  ZonesViewController.m
//  iTOLA
//
//  Created by Isaac Gonzalvez on 25/04/13.
//  Copyright (c) 2013 Isaac Gonzalvez. All rights reserved.
//

#import "ZonesViewController.h"
#import "NSDictionary+MutableDeepCopy.h"



@interface ZonesViewController ()


@end

@implementation ZonesViewController

@synthesize names;
@synthesize keys;
@synthesize table;
@synthesize search;
@synthesize allNames;
@synthesize isSearching;

#pragma mark-
#pragma mark Custom Methods


//Este metodo es llamada cada vez que una busqueda es cancelada o el termino de busqueda cambia. Crea una mutable copy de allNames y lo asinga a names, y entonces refresca las key array para que incluya todas las letras del alfabeto.
- (void)resetSearch {
    self.names = [self.allNames mutableDeepCopy];
    NSMutableArray *keyArray = [[NSMutableArray alloc]init];
    [keyArray addObject:UITableViewIndexSearch];
    [keyArray addObjectsFromArray:[[self.allNames allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    self.keys = keyArray;
    
}

//este metodo es el motor de la busqueda. Indicamos al sistema que a medida que detecta secciones que quedan vacias por el resultado de busqueda que las apile en un array para depsues eliminar esas secciones junto a las key ya que no es seguro hacerlo durante la bisqueda. Una vez hemos hecho un loop por toda la table indicamos al sistema que elimine todas las key que no han tenido coincidencia y si una seccion se ha quedado sin keys que la elimine tambien. Finalmente hacemos reloadData

- (void)handleSearchForTerm:(NSString *)searchTerm {
    NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
    [self resetSearch];
    
    //Recargamos el array con las key
    for (NSString *key in self.keys) {
        NSMutableArray *array = [names valueForKey:key];
        NSMutableArray *toRemove = [[NSMutableArray alloc]init];
        for (NSString *name in array) {
            if ([name rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location == NSNotFound)
                [toRemove addObject:name];
        }
        if ([array count] == [toRemove count]) [sectionsToRemove addObject:key];
        [array removeObjectsInArray:toRemove];
    }
    [self.keys removeObjectsInArray:sectionsToRemove];
    [table reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zones" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.allNames = dict;
    
    [self resetSearch];
    [table reloadData];
    
    // con el offSet lo que estamos haciendo es indicar que al abrir la aplicacion la visualizacion se situe 44 pixeles por debajo, ocltando la barra de busqueda, que se vera si el usuario se desplaza hacia arriba.
    [table setContentOffset:CGPointMake(0.0, 44.00) animated:NO];
    

}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-

#pragma marl Table View Data Source Methods

//Indicamos el numero de secciones que tendra la tabla (en este caso 1 por cada letra del abecedario

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return ([keys count] > 0) ? [keys count] : 1;
}

//indicamos el numero de celdas que tendra por seccion

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([keys count] == 0)
        return 0;
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}

//Hacemos el print de los datos en las celdas

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
   
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];

    
    static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SectionsTableIdentifier];
    }
    
    cell.textLabel.text = [nameSection objectAtIndex:row] ;
    return cell;
    
}

//permite poner un nombre opcional al header de las diferentes secciones, en este caso nos quedamos con los valores del propio plist

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([keys count] == 0)
        return nil;
    NSString *key = [keys objectAtIndex:section];
    if (key == UITableViewIndexSearch)
        return nil;
    return key;
}

//añadimos el indice a la interfaz de usuario

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (isSearching)
        return nil;
    return keys;
}



#pragma mark -
#pragma mark Table View Delegate Methods

//estamos indicamos que cuando el teclado de busqueda este en pantella, si el usuario toca una row que se oculte el teclado. Y nos deje la tabla intacta

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [search resignFirstResponder];
    isSearching = NO;
    search.text = @"";
    [tableView reloadData];
    return indexPath;
}

#pragma mark -
#pragma mark Search Bar Delegate Methods

//con este metodo estamos indicando que cuando el usuario clicke en buscar se inicie el motor de busqueda que hemos definido anteriormente
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    isSearching = NO;
    NSString *searchTerm = [searchBar text];
    [self handleSearchForTerm:searchTerm];
    [searchBar resignFirstResponder];
}

//este metodo sirve para implementar la live search, que nos va mostrando los resultados a mediada que el usario escribe en la search bar

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchTerm {
    if ([searchTerm length] == 0) {
        [self resetSearch];
        [table reloadData];
        return;
    }
    [self handleSearchForTerm:searchTerm];
}

//este metodo sirve para que cuando el usuario clicke en cancelar busqueda vaciemos la barra de busqueda y recargemos la table view para que nos muestre todos los datos intactos
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar   {
    isSearching = NO; //indicamos que el valor de isSearching es no
    search.text = @"";
    [self resetSearch];
    [table reloadData];
    [searchBar resignFirstResponder];
}

//indicamos que si se activa la search bar el valor de isSearching es YES

- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar  {
    isSearching = YES;
    [table reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSString *key = [keys objectAtIndex:index];
    if (key == UITableViewIndexSearch) {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    } else return index;
}
 

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [search resignFirstResponder];
}






@end
