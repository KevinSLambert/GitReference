//
//  GRViewController.m
//  GitReference
//
//  Created by Kevin Lambert on 1/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat margin = 15; //Sets a new variable (of type CGFloat) to 15.
static NSString *Command = @"command";
static NSString *Reference = @"reference";

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)]; //allocates the memory for a UIScrollView. Sets the width and hight to the size of the screen.
    
    [self.view addSubview:scrollView];//creates the scrollView
    
    scrollView.backgroundColor = [UIColor blueColor];
    
    CGFloat topMargin = 20; //Sets a variable 'topMargin' to 20
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin; //Creates a new width variable with are margine so that the text does not start at the edge of the screen
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, 20)]; //allocates memory for a new UILabel and sets the size
    title.font = [UIFont boldSystemFontOfSize:20];//Calls method boldSystemFontOfSize with 20 are the parameter. Sets the titles 'font' to what is returned
    
    title.text = @"Git_Reference";//sets the text property of the UILabel 'title' to Git_Reference
    title.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:title];//creates the 'title' to sit on top of the scroll view
    
    CGFloat top = topMargin + 20 + margin * 2;//creates a new CGFloat called 'top'. Sets it below the title
    
    for (NSDictionary *gitCommand in [self gitCommands]) {
        
        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
        gitCommand.font = [UIFont boldSystemFontOfSize:17];
        gitCommand.textColor = [UIColor whiteColor];
        gitCommand.text = command;
        [scrollView addSubview:gitCommand];
        
        top += (20 + margin);
        
        CGFloat heightForReference = [self heightOfReferenceString:reference];
        
        UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, heightForReference)];
        gitReference.numberOfLines = 0;
        gitReference.font = [UIFont systemFontOfSize:15];
        gitReference.text = reference;
        gitReference.textColor = [UIColor whiteColor];
        [scrollView addSubview:gitReference];
        
        top += (heightForReference + margin * 2);
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
    
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changes files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"Notes\"", Reference: @": commits the changes w/message"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];//Method gitCommands that returns an NSArray
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
        
        CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                                  context:nil];
        
        return bounding.size.height;//Method that returns a CGFloat called 'heightOfReferenceString'. Takes in an NSString variable and uses it as 'reference' within the method
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
