*** Keywords ***
Generate username
    ${curent_time}=  Get current date  result_format=%d%m%Y%H%M
    Set test variable  ${username}  user${curent_time}

Generate budget name
    ${curent_time}=  Get current date  result_format=%d%m%Y%H%M
    Set test variable  ${budget_name}  budget${curent_time}

Open browser and login
    Open Browser  ${home_page}  ${BROWSER}
    Maximize browser window
    Login user  ${username}  ${pass}
    Check if user is logged in

Login user
    [Arguments]  ${username}  ${password}
    wait until element is visible  ${login_button}
    Input text  ${username_field}  ${username}
    Input text  ${password_field}  ${password}
    Click button  ${login_button}

Check if user is logged in
    Wait until element is visible  ${logout_button}

Logout and close browser
    Logout user
    Check if user is logged out
    Close Browser

Logout user
    Click button  ${logout_button}

Check if user is logged out
    Wait until element is not visible  ${logout_button}

Sign up
    [Arguments]  ${username}  ${password}  ${repeat_password}
    wait until element is visible  ${signup_button}
    Click element  ${signup_button}
    wait until element is visible  ${signup_username_field}
    Input text  ${signup_username_field}  ${username}
    Input text  ${signup_password_field}  ${password}
    Input text  ${signup_password_repeat_field}  ${repeat_password}
    Click button  ${signup_submit_button}

Add budget
    [Arguments]  ${budget_name}
    Wait until element is visible  ${budget_name_input_field}
    Input text  ${budget_name_input_field}  ${budget_name}
    Wait until element is visible  ${create_budget_btn}
    Click element  ${create_budget_btn}
    wait until element contains  ${first_budget_on_the_list}  ${budget_name}

Delete budget
    Click element  ${delete_first_budget_btn}
    wait until element is not visible  ${first_budget_on_the_list}

View the budget
    Click element  ${first_budget_on_the_list}
    Wait until element is visible  ${entry_name_field}

Add entry
    [Arguments]  ${name}  ${category}  ${amount}
    Input text  ${entry_name_field}  ${name}
    Select From List By Value  ${entry_category_list}  ${category}
    IF  ${amount}<0
        ${amount}=  Evaluate  -1 * ${amount}
        Input text  ${entry_amount_field}  ${amount}
    ELSE
        Input text  ${entry_amount_field}  ${amount}
    END
    Click element  ${add_entry_btn}

Choose minus
    Click element  ${plus_minus_amount_entry}
    Wait Until Page Contains Element  ${minus}

Choose plus
    Click element  ${plus_minus_amount_entry}
    Wait Until Page Contains Element  ${plus}

Remove entry
    [Arguments]  ${entry_number}
    Click element  //*[@id="root"]/main/div[${entry_number}]/div[2]/button

Go to the main page
    Click element  ${back_button}
    Wait Until Page Contains  My Budgets

Go to statistics
    Click element  ${link_statistics}
    Wait Until Page Contains  Statistics

Total income should be equal
    [Arguments]  ${expected_value}
    Wait until element is visible  ${total_income}
    Element Text Should Be  ${total_income}  ${expected_value}

Total expense should be equal
    [Arguments]  ${expected_value}
    Wait until element is visible  ${total_expense}
    Element Text Should Be  ${total_expense}  ${expected_value}

Transport income on graph should be
    [Arguments]  ${expected_amount}
    Sleep  2s
    ${transport_income_on_graph}=  Execute Javascript  return document.querySelectorAll('tspan')[7].childNodes[0].nodeValue
    Should be equal as numbers  ${transport_income_on_graph}  ${expected_amount}

Home income on graph should be
    [Arguments]  ${expected_amount}
    Sleep  2s
    ${home_income_on_graph}=  Execute Javascript  return document.querySelectorAll('tspan')[5].childNodes[0].nodeValue
    Should be equal as numbers  ${home_income_on_graph}  ${expected_amount}

Food income on graph should be
    [Arguments]  ${expected_amount}
    Sleep  2s
    ${food_income_on_graph}=  Execute Javascript  return document.querySelectorAll('tspan')[6].childNodes[0].nodeValue
    Should be equal as numbers  ${food_income_on_graph}  ${expected_amount}

Entertainment income on graph should be
    [Arguments]  ${expected_amount}
    Sleep  2s
    ${entertainment_income_on_graph}=  Execute Javascript  return document.querySelectorAll('tspan')[8].childNodes[0].nodeValue
    Should be equal as numbers  ${entertainment_income_on_graph}  ${expected_amount}

Other income on graph should be
    [Arguments]  ${expected_amount}
    Sleep  2s
    ${other_income_on_graph}=  Execute Javascript  return document.querySelectorAll('tspan')[9].childNodes[0].nodeValue
    Should be equal as numbers  ${other_income_on_graph}  ${expected_amount}

Health expense on graph should be
    [Arguments]  ${expected_amount}
    Sleep  2s
    ${health_expense_on_graph}=  Execute Javascript  return document.querySelectorAll('tspan')[10].childNodes[0].nodeValue
    Should be equal as numbers  ${health_expense_on_graph}  ${expected_amount}