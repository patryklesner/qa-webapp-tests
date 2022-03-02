*** Variables ***
${home_page}
${BROWSER}  %{BROWSER}
${pass}  passtest1234
${login_button}  //button[text()="Log In"]
${username_field}  //input[@type="username"]
${password_field}  //input[@type="password"]
${logout_button}  //button[text()="Log Out"]
${signup_button}  //a[@href="/signup"]
${signup_username_field}  //input[@type="username"]
${signup_password_field}  //input[@type="password"]
${signup_password_repeat_field}  //*[@id="root"]/main/div[1]/div[3]/div/input
${signup_submit_button}  //button[text()="Sign Up"]
${budget_name_input_field}  //*[@id="root"]/main/div/div[1]/div/input
${create_budget_btn}  //*[@id="root"]/main/div/div[2]/button
${first_budget_on_the_list}  //*[@id="root"]/main/div[1]//h3
${second_budget_on_the_list}  //*[@id="root"]/main/div[2]//h3
${delete_first_budget_btn}  //*[@id="root"]/main/div[1]//button
${delete_second_budget_btn}  //*[@id="root"]/main/div[2]//button
${entry_name_field}  //*[@id="root"]/main/div/div[1]/div[1]/input
${entry_category_list}  //*[@id="root"]/main//div[1]/div[2]/select
${added_entry}  //*[@id="root"]/main/div/div[1]/h3
${back_button}  //*[@id="root"]/main/h1/button
${plus_minus_amount_entry}  //*[@id="root"]/main//div[2]/div[1]/button
${entry_amount_field}  //*[@id="root"]/main//div[2]/div[2]/input
${plus_minus_mode}  //*[@id="root"]/main//div[2]/div[2]/label
${add_entry_btn}  //*[@id="root"]/main//div[2]/div[2]/label/parent::div/parent::div/button
${link_statistics}  //*[@id="root"]/nav/ul/li[2]/a
${total_income}  //*[@id="root"]/main/div[1]/div[2]/div[1]
${total_expense}  //*[@id="root"]/main/div[1]/div[2]/div[2]
${transport_income_on_graph}  main > div:nth-child(3) > div > div.recharts-wrapper > svg > g:nth-child(2) > g.recharts-layer.recharts-pie-labels > g:nth-child(3) > text > tspan
${home_income_on_graph}  main > div:nth-child(3) > div > div.recharts-wrapper > svg > g:nth-child(2) > g.recharts-layer.recharts-pie-labels > g:nth-child(1) > text > tspan
${food_income_on_graph}  main > div:nth-child(3) > div > div.recharts-wrapper > svg > g:nth-child(2) > g.recharts-layer.recharts-pie-labels > g:nth-child(2) > text > tspan
${entertainment_income_on_graph}  main > div:nth-child(3) > div > div.recharts-wrapper > svg > g:nth-child(2) > g.recharts-layer.recharts-pie-labels > g:nth-child(4) > text > tspan
${other_income_on_graph}  main > div:nth-child(3) > div > div.recharts-wrapper > svg > g:nth-child(2) > g.recharts-layer.recharts-pie-labels > g:nth-child(5) > text > tspan
${health_expense_on_graph}  main > div:nth-child(3) > div > div.recharts-wrapper > svg > g:nth-child(3) > g.recharts-layer.recharts-pie-labels > g > text > tspan
${minus}  //*[@id="root"]/main//div[2]/div[1][@mode="1"]
${plus}  //*[@id="root"]/main//div[2]/div[1][@mode="0"]