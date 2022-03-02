*** Settings ***
Library          SeleniumLibrary
Library          DateTime
Resource  variables.robot
Resource  keywords.robot

Test Setup       Run Keywords  Sleep  5s
...    AND    Open Browser  ${home_page}  ${BROWSER}
...    AND    Generate username
...    AND    Sign up  ${username}  ${pass}  ${pass}
...    AND    wait until element is visible  ${login_button}
...    AND    Login user  ${username}  ${pass}
Test Teardown    Close Browser

*** Test Cases ***
001. Login and logout
    [Tags]  Login  Logout  Signup
    [Setup]  Run Keywords  Open Browser  ${home_page}  ${BROWSER}
    ...    AND    Generate username
    Sign up  ${username}  ${pass}  ${pass}
    wait until element is visible  ${login_button}
    Login user  ${username}  ${pass}
    Check if user is logged in
    Logout user
    Check if user is logged out
    [Teardown]  Close Browser

002. Create a budget
    [Tags]  Budget
    Generate budget name
    Wait until element is visible  ${budget_name_input_field}
    Input text  ${budget_name_input_field}  ${budget_name}
    Wait until element is visible  ${create_budget_btn}
    Click element  ${create_budget_btn}
    wait until element contains  ${first_budget_on_the_list}  ${budget_name}

003. Delete budget
    Generate budget name
    Add budget  ${budget_name}
    Delete budget

004. Add entry to the budget
    Generate budget name
    Add budget  ${budget_name}
    View the budget
    Add entry  name1  Home  1
    Add entry  name2  Health  -2.50
    Add entry  name3  Food  3.40
    ${count} =	Get Element Count	${added_entry}
    Should be equal as integers  ${count}  3

005. Delete entry from the budget
    Generate budget name
    Add budget  ${budget_name}
    View the budget
    Add entry  name1  Home  1
    Add entry  name2  Health  -2.50
    Add entry  name3  Food  3.40
    ${count} =	Get Element Count	${added_entry}
    Should be equal as integers  ${count}  3
    Remove entry  3
    ${count} =	Get Element Count	${added_entry}
    Should be equal as integers  ${count}  2
    Remove entry  2
    ${count} =	Get Element Count	${added_entry}
    Should be equal as integers  ${count}  1
    Remove entry  1
    ${count} =	Get Element Count	${added_entry}
    Should be equal as integers  ${count}  0

006. Check statistics
    Generate budget name
    Add budget  ${budget_name}
    View the budget
    Add entry  name1  Home  1
    Choose minus
    Add entry  name2  Health  -2.50
    Choose plus
    Add entry  name3  Food  3.40
    Add entry  name3  Transport  100
    Add entry  name3  Entertainment  0.134
    Add entry  name3  Other  30
    ${count} =	Get Element Count	${added_entry}
    Should be equal as integers  ${count}  6
    Go to statistics
    Total income should be equal  + 134.534
    Total expense should be equal  - 2.5
    Transport income on graph should be   100
    Home income on graph should be   1
    Food income on graph should be   3.40
    Entertainment income on graph should be   0.134
    Other income on graph should be   30
    Health expense on graph should be   2.50