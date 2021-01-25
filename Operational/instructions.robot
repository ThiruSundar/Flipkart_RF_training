*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot

*** Keywords ***
Open Flipkart URL through browser
    Open Browser  ${url}  ${brows}  #opens the browser 
    Maximize Browser Window  #Maximize the browser
    sleep  2s
    Verify WebPage title  ${Expected_homePage}   #calls the function verify webpage title

Log into flipkart using phone number and password1
    Input Text  xpath=//input[@type='text' and @class='_2IX_2- VJZDxU']  ${username1}   #enters text to the text feild
    Input Password  xpath=//input[@type='password']  ${password1}    #enters the password to the text feild
    Click Element   xpath=//button[@type='submit' and @class='_2KpZ6l _2HKlqd _3AWRsL']   #clicks the login button
    sleep  2s

Clear the contents in the cart
    Click Element  ${home_screen_cart}   #clicks on the home screen cart
    sleep  2s
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${cart_empty}
    Run Keyword If    '${present}'=='False'    Remove from Cart  #runs the function remove from cart if a product is present in the cart

Remove from Cart    
    Wait Until Element Is Visible  ${expeted_product}  #wait untils the expected product appears fails if not 
    Click Element  ${remove_button}   #clicks on the remove button
    sleep  2s
    Click Element  ${confirm_remove}  #confirms the remove button

Move to Home Page
    Wait Until Element Is Visible  ${home_button}   #waits for the home button
    Click Element  ${home_button}   #clicks on the flipkart icon to navigate to home page

Navigate to Category "Electronics"
    sleep  2s
    Mouse Over  ${Electronics}    #hovers the mouse to electronics
    sleep  2s
    Scroll Element Into View  ${smart_wearables}  
    Click Element  ${smart_wearables}     #clicks on smart watches

Choose Product
    sleep  5s
    Click Element  ${view_all}    #clicks on view all products button
    sleep  5s
    Click Element  ${product}    #selects the product

Enter pincode to enable add to cart button
    sleep  5s
    Switch Window  NEW    #switches to new window if present
    sleep  5s    
    Press Keys  ${pincode}  ${Expected_pincode}  #enter the pincode in the text feild
    Click Element  ${check_button_pincode}  #checks the pincode
    sleep  5s
    Click Element  ${add_to_cart}    #Add to cart
    
Search for specific product2
    Input Text  ${search}  apple watch    #search for a product in the search bar 
    Click Element  ${search_button}    #clicks the search icon

Click on the desired product2
    Wait Until Element Is Visible  ${product2}    #wait until the product is visible 
    Click Element  ${product2}    #clicks the product

Navigate to home screen and verify product in cart
    Click Element  ${home_button}  #clicks on the flipkart icon to navigate to home page 
    sleep  2s
    Click Element  ${home_screen_cart}    #clicks on the cart icon on the home page
    sleep  5s
    Verify if the added item is available in the cart  ${expeted_product}     #calls the function 

Verify if the added item is available in the cart
    [Arguments]  ${camera}
    Wait Until Page Contains Element  ${camera}   #wait until the argument is available
    Log to Console  ${camera}    #writes to console
    Log to Console  Pass you can party!!    #writes to console

Log into flipkart using phone number and password2
    Input Text  xpath=//input[@type='text' and @class='_2IX_2- VJZDxU']  ${username2}    #enters text to the text feild
    Input Password  xpath=//input[@type='password']  ${password2}    #enters the password to the text feild
    Click Element   xpath=//button[@type='submit' and @class='_2KpZ6l _2HKlqd _3AWRsL']    #clicks the login button
    sleep  2s

Verify WebPage title
    [Arguments]  ${title_name}    
    Wait Until Page Contains  ${title_name}    #wait until the argument is available
    Log to Console  ${title_name}    #writes to console
    Log to Console  Pass!!    #writes to console

Filter with reviews for 4 star and above
    Wait Until Element Is Visible  ${review}    #wait until the element is available 
    Click Element  ${review}    #Clicks on the 4 star review check box

Close the browser
    sleep  5s    
    Close Browser    #closes the browser