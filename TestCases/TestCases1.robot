*** Settings ***
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot

Test Setup  Open Flipkart URL through browser
Test Teardown  Close the browser

*** Test Cases ***
User should be able to log in and clear the contents in the cart
    Log into flipkart using phone number and password2
    Clear the contents in the cart
    Move to Home Page
    Search for specific product2
    Filter with reviews for 4 star and above
    Click on the desired product2
    Enter pincode to enable add to cart button

User should be able to verify the content in the cart
    Log into flipkart using phone number and password1
    Navigate to home screen and verify product in cart
    Move to Home Page