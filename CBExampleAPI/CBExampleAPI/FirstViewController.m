//
//  FirstViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "FirstViewController.h"

#import "ArrayViewController.h"
#import "AttributedStringViewController.h"

@interface FirstViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrayFoundation;

@property (strong, nonatomic) UITableView *tbFoundationList;

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    NSLog(@"\n%@\n%@", NSStringFromClass([FirstViewController class]), self.view);
    
    if (!_tbFoundationList)
    {
        /*
        self.arrayFoundation = @[@"FoundationErrors.h", @"NSArray.h", @"NSAttributedString.h", @"NSAutoreleasePool.h", @"NSBundle.h", @"NSByteCountFormatter.h", @"NSByteOrder.h", @"NSCache.h", @"NSCalendar.h", @"NSCharacterSet.h", @"NSCoder.h", @"NSComparisonPredicate.h", @"NSCompoundPredicate.h", @"NSData.h", @"NSDate.h", @"NSDateFormatter.h", @"NSDecimal.h", @"NSDecimalNumber.h", @"NSDictionary.h", @"NSEnumerator.h", @"NSError.h", @"NSException.h", @"NSExpression.h", @"NSFileCoordinator.h", @"NSFileHandle.h", @"NSFileManager.h", @"NSFilePresenter.h", @"NSFileVersion.h", @"NSFileWrapper.h", @"NSFormatter.h", @"NSHashTable.h", @"NSHTTPCookie.h", @"NSHTTPCookieStorage.h", @"NSIndexPath.h", @"NSIndexSet.h", @"NSInvocation.h", @"NSJSONSerialization.h", @"NSKeyedArchiver.h", @"NSKeyValueCoding.h", @"NSKeyValueObserving.h", @"NSLinguisticTagger.h", @"NSLocale.h", @"NSLock.h", @"NSMapTable.h", @"NSMetadata.h", @"NSMetadataAttributes.h", @"NSMethodSignature.h", @"NSNetServices.h", @"NSNotification.h", @"NSNotificationQueue.h", @"NSNull.h", @"NSNumberFormatter.h"];
         */
        
//        NSArray *arr = @[@{@"ClassName": @"FoundationErrors.h", @"IsNextLevel": @"0"}];
        
        self.arrayFoundation = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"FoundationFramework.plist" ofType:nil]];
        
        CGFloat originY = 0;
        CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
        CGFloat tabHeight = self.tabBarController.tabBar.frame.size.height;
        CGFloat height = 0;
        if (KIsIOS7)
        {
            navHeight = 0;
            tabHeight = 0;
            height = 20;
        }
        
        _tbFoundationList = [[UITableView alloc] init];
        _tbFoundationList.frame = CGRectMake(0, originY, KAppWidth, KAppHeight-originY-navHeight-tabHeight+height);
        [self.view addSubview:_tbFoundationList];
        
        _tbFoundationList.dataSource = self;
        _tbFoundationList.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayFoundation.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = nil;
    
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    NSInteger row = indexPath.row+1;
    NSDictionary *dict = [self.arrayFoundation objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d.%@", row, [dict objectForKey:@"ClassName"]];
    
    NSNumber *isLevel2 = [dict objectForKey:@"IsLevel2"];
    if ([isLevel2 boolValue])
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    /*
    BOOL isSingular = indexPath.row % 2;
    if (isSingular)
    {
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.backgroundColor = [UIColor whiteColor];
//        cell.backgroundColor = [UIColor whiteColor];
//        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = [UIColor blackColor];
//        cell.backgroundColor = [UIColor blackColor];
//        cell.contentView.backgroundColor = [UIColor blackColor];
    }
    */
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger row = indexPath.row+1;
    
    if (2 == row)
    {
        ArrayViewController *arrayVC = [[ArrayViewController alloc] initWithNibName:@"ArrayViewController" bundle:nil];
        arrayVC.title = @"ArrayViewController";
        [self.navigationController pushViewController:arrayVC animated:YES];
    }
    else if (3 == row)
    {
        AttributedStringViewController *attributedStringVC = [[AttributedStringViewController alloc] initWithNibName:@"AttributedStringViewController" bundle:nil];
        attributedStringVC.title = @"AttributedStringViewController";
        [self.navigationController pushViewController:attributedStringVC animated:YES];
    }
    
}

@end
