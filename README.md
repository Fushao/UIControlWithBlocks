UIControlWithBlocks
===================

Easier to use the subclass of UIControl via "Block".

How to use
-----------------------------------
###
    - (IBAction)testAlertView:(id)sender {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"UIAlertViewTest" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alertView cb_setBlock:^(NSInteger buttonIndex, NSString *buttonTitle) {
            NSLog(@"button index:%ld, button title:%@", (long)buttonIndex, buttonTitle);
         }];
        [alertView show];
    }

    - (IBAction)testActionSheet:(id)sender {
         UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destructive" otherButtonTitles:@"Other", nil];
        [actionSheet cb_setBlock:^(NSInteger buttonIndex, NSString *buttonTitle) {
            NSLog(@"button index:%ld, button title:%@", (long)buttonIndex, buttonTitle);
         }];
        [actionSheet showInView:self.view];
    }

    - (void)testButton
    {
        [_button cb_setBlock:^{
            NSLog(@"Button Clicked");
        }];
    }

    - (void)testSwitch
    {
        [_switchControl cb_setBlock:^(BOOL isOn) {
            NSLog(@"Switch is on:%@", isOn ? @"YES" : @"NO");
        }];
    }

    - (void)testTextField
    {
        [_textField cb_setBeginEditingBlock:^(NSString *text) {
            NSLog(@"Text field begin editing! %@", text);
        }];
        [_textField cb_setEndEditingBlock:^(NSString *text) {
            NSLog(@"Text field end editing! %@", text);
        }];
        [_textField cb_setTextChangedBlock:^(NSString *text) {
            NSLog(@"Text field text changed! %@", text);
        }];
    }
    
    - (void)testSlider
    {
        [_slider cb_setBlock:^(CGFloat progress) {
            NSLog(@"Slider value is:%f", progress);
        }];
    }
    
    - (void)testPageControl
    {
        [_pageControl cb_setBlock:^(NSUInteger currentPage, NSUInteger numberOfPages) {
            NSLog(@"current page:%lu, number of pages:%lu", (unsigned long)currentPage, (unsigned long)numberOfPages);
        }];
    }
    
    - (void)testStepper
    {
        [_stepper cb_setBlock:^(CGFloat value) {
            NSLog(@"stepper value is:%f", value);
        }];
    }
    
    - (void)testTextView
    {
        [_textView cb_setBeginEditingBlock:^(NSString *text) {
            NSLog(@"Text view begin editing! %@", text);
        }];
        [_textView cb_setEndEditingBlock:^(NSString *text) {
            NSLog(@"Text view end editing! %@", text);
        }];
        [_textView cb_setTextChangedBlock:^(NSString *text) {
            NSLog(@"Text view text changed! %@", text);
        }];
    }
    
    - (void)testSegmentedControl
    {
        [_segmentedControl cb_setBlock:^(NSUInteger selectedSegmentIndex, NSUInteger numberOfSegments) {
            NSLog(@"selected segment index:%lu, number of segments:%lu", (unsigned long)selectedSegmentIndex, (unsigned long      )numberOfSegments);
        }];
    }
