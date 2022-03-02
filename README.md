# qa-webapp-tests

This repository contains automated test of the [qa-webapp](https://github.com/datasapiens/qa-webapp)

I chose Robotframework for testing purpose. Robotframework is based on python and uses selenium.

Requirements:
* Python 3.8
* robotframework library
  ```bash
    pip install robotframework
    ```
* robotframework-seleniumlibrary library
  ```bash
    pip install robotframework-seleniumlibrary
    ```
  
You can use docker to run tests in container:
```bash
    docker run \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/tests:/opt/robotframework/tests:Z \
    -e BROWSER=firefox \
    -e ROBOT_OPTIONS="--variable home_page:HERE_SHOULD_BE_ADDRESS_OF_THE_PAGE" \
    --platform linux/amd64 \
    ppodgorsek/robot-framework:latest
   ```

Covered cases:
* Login and logout

* Create a budget
    
* Delete budget
    
* Add entry to the budget
    
* Delete entry from the budget

* Check statistics
    
Structure of the project:
Directory _tests_ contains keywords, variables and test cases.
File _test_cases.robot_ contains test cases, _keywords.robot_ contains keywords user in test cases and _variables.robot_ contains variables used in cases and keywords.
Kyewords and variables may be moved to separated directories. 
Keywords may be also split to spearated files based on related pages. The same with variables.
