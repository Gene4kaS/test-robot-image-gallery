# User Portal robot framework test execution

The purpose of this document is to specify the procedures to execute the tests for verification of the User Portal test cases.
These procedures are meant to be applied to the pipeline assuming that the pipeline runner will be executed in a machine with access to the User Portal and Strapi webpages.

## Structure

The directory structure of the robot framework is shown below.

```md
userportal-robotframework
├── Robot-UserPortal                                        # UI test repository
│     ├── USERPORTAL-TestCases                              # Robot test suite implementation
│     │   ├── Resources
│     │   |     ├── robotConfigVariables.resource           # configuration variables of the test cases
│     │   |     ├── robotGuiVariables.resource              # GUI variables shared by the test cases
│     │   |     └── robotKeywords.resource                  # functions file that is generic and can be used in all test cases
│     │   └── TestSuites
│     │        ├── Test-AcountCreationPage.robot            # test case
│     │        ├── Test-FR-ACACT-00010.robot
│     │        ├── ...
│     │        └── Test-USERPORTAL-1154.robot
│     |
│     ├── Resources
│     │   ├── Common
│     │   |     ├── robotConfigVariables.resource           # configuration variables that can be used in all test cases
│     │   |     ├── robotGuiVariables.resource              # GUI variables that can be used in all test cases
│     │   |     └── robotKeywords.resource                  # functions file that is generic and can be used in all test cases
│     │   └── main.resource                                 # file with library imports that can be used in all test cases
│     |
│     └── Runners
│         ├── firefox-profile                               # firefox profile with default configuration
│         ├── geckodriver                                   # Firefox webdriver
│         ├── robot_suites_analysis.sh                      # script to analyse robot execution
│         ├── robot_suites_documentation_extraction.py      # script to extract the documentation from the test cases
│         └── run-individual.txt                            # file with the individual test cases commands
│   
├── JMeter-UserPortal                                       # PERF test repository
│     ├── USERPORTAL-TestCases                              # JMeter test suite implementation
│     │   ├── Resources
│     │   |     └── user-portal-users.csv                   # configuration variables of the test cases
│     │   └── TestSuites
│     │        ├── Test-USERPORTAL-319.jmx                  # test case
│     │        └── Test-USERPORTAL-320.jmx
│     |
│     └── Runners
│         ├── jmeter_analysis.sh                            # script to analyse robot execution
│         ├── run-USERPORTAL-319.sh                         # script to run the USERPORTAL-319 test case
│         └── run-USERPORTAL-320.sh                         # script to run the USERPORTAL-320 test case
│   
├── .gitlab-ci.yml                                    # gitlab-ci configuration file
│   
├── Dockerfile                                        # Dockerfile configuration file
│   
└── README.md
```

## How to run the Robot test cases locally

The test cases can be executed individually or as a suite and the corresponding outputs can be saved either to the default directory or to the specified directory.

Assuming that the test will be executed on the local machine, the following commands can be used:

**Executing the test cases individually**

```bash
cd Robot-UserPortal/Runners 
robot --outputdir <path to Report directory>/<test case id>.robot --logtitle <test case id> --reporttitle <test case id> <path to TestSuite>/<test case id>.robot

For example:
cd Robot-UserPortal/Runners
robot --outputdir ../Reports/ContentEditingScenario/Test-U-114 --logtitle Test-U-114 --reporttitle Test-U-114 ../ContentEditingScenario/TestSuites/Test-U-114.robot
```

This command will execute the *<test case id>* test case and the evidences (*i.e.* outputs) will be placed in the *<path to Report directory>* folder

*Note:* The *run-individual.txt* file on the Robot-UserPortal/Runners directory contains the individual commands to execute each test case.

**Executing the test cases as a group (*i.e.* execute all the tests for a specific functionality in one go)**

```bash
cd Robot-UserPortal/Runners
robot --outputdir <path to Reports directory> <path to TestSuite>

For example:
cd Robot-UserPortal/Runners
robot --outputdir ../Reports/USERPORTAL-TestCases ../USERPORTAL-TestCases/TestSuites
```

## How to run the extract documentation script

To extract the documentation from the test cases, the following script can be used:

```python
robot_suites_documentation_extration.py

For example:
cd Runners

python3 robot_suites_documentation_extration.py
```

The script can be executed for each scenario individually or for all suites in on go. The script is configured to search for all *.robot* files recursively in the Robot-UserPortal directory. However, it can be modified to use a specific folder by modifying the *path_robot_script* variable.
It is also possible to modify the reports directory and the names of the reports generated as shown below:

```python
# Variables
path_robot_script='../'
path_reports_folder='Reports/'
test_documentation = {}
report_file_documentation = "USERPORTAL-Testcases-documentation.json"
report_file_documentation_csv = "USERPORTAL-Testcases-documentation.csv"
flattened_data = []
```

BY default, the script will create a directory on the Reports folder called *Documentation* and will create two files with the documentation extracted:

- CSV file
- JSON file

To run the script, the following dependencies need to be installed/available on the machine:

- json: pip3 install json
- pandas: pip3 install pandas

## How to run the UI and PERF test cases on GitLab pipeline

The GitLab pipeline is configured to be executed only on demand by triggering its execution using the GitLab web interface.
The UI and PERF test cases can be executed together or individually. For that, the "TEST_TYPE" variable can be used. This variable accepts the following values:

- UI: Run only the Robot test cases
- PERF: Run only the JMeter test cases
- ALL: Run both Robot and JMeter test cases

```bash
  ...
  rules:
    - if: '$TEST_TYPE == "UI" || $TEST_TYPE == "ALL"'
  ...

  or

  ...
  rules:
    - if: '$TEST_TYPE == "PERF"|| $TEST_TYPE == "ALL"'
  ...
```

The test cases on these scenarios can be executed by suite or by tag. To allow that, a rule is configured on the gitlab-ci file for each stage and can be modified by changing the "TEST_ID" variable, for example:

```bash
  ...UI scenario
  if [ "$TEST_ID" == "ALL" ]; then
    ...
  else
    ...
  fi
  ...

  or

  ...PERF scenario
  if [[ "$TEST_ID" == "ALL" ]]; then
    ./run-USERPORTAL-319.sh
    ./run-USERPORTAL-320.sh
  else
    ./run-$TEST_ID.sh
  fi
  ...
```

Both variables - TEST_TYPE and TEST_ID - have the following default values. These values can be modified on the GitLab web interface before triggering the pipeline:

```bash
variables:
  TEST_TYPE: "UI"
  TEST_ID:  "SB3-2"
```

To trigger the pipeline execution, the following steps can be followed:

1. Access the GitLab  pipeline page <https://gitlab.eumetsat.int/user-portal/userportal-robotframework/-/pipelines>
2. Click on "Run pipeline" button and wait for the page to be loaded
3. Input the TEST_TYPE and TEST_ID variables with the desired value
4. Click on the "Run pipeline" button

Possible tags/suites to use:

- TEST_TYPE:
  - ALL
  - UI
  - PERF

- TEST_ID:
  - ALL
  - SB3-2
  - SB3
  - SB2
  - USERPORTAL-319
  - USERPORTAL-320

For example, to run the latest implementation the following pipelines execution should be triggered:

```bash
1st pipeline:
  TEST_TYPE: "PERF"
  TEST_ID:  "ALL"

2nd pipeline:
  TEST_TYPE: "UI"
  TEST_ID:  "SB3-2"
```

## List of users used on the test cases

|  | **User and required permissions** | **Credentials** | **Comment** |
| - | - | - | - |
| 1 | Critical user 1: User has the European Weather Cloud subscription with 1 available service and with 1 licence | <p> username: testcsw1 <p> First name: CSW <p> Second name: TEST <p> Subscription: European Weather Cloud <p> License: Meteosat < 1 hr latency for data usage Personal/Education/Research | |
| 2 | Critical user 2: User has the EUMETCast Africa subscription with 1 available service | <p> username: testcsw2 First name: Sub <p> Second name: Help <p> Subscription: EUMETCast Africa <p> License: No license was requested  | |
| 3 | Critical user 3: User has no subscriptions or licenses | <p> username: testcsw3 <p> First name: One <p> Second name: List <p> Subscription: No subscription requested <p> License: No license | |
| 4 | Critical user 4 : User has the EUMETCast Terrestrial subscription | <p> username: testcsw4 <p> First name: For <p> Second name: Test <p> Subscription: EUMETCast Terrestrial <p> License: No license requested | |
