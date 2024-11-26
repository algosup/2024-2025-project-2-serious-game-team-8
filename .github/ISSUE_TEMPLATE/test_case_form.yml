name: Test Case Form
description: Declares a test case (form variant).
title: "[TESTING] TEST_NAME"
labels: [test]
assignees: [mathiskakal]
projects: [algosup/45]
body:

  - type: input
    id: testcase-title
    attributes:
      label: Test Case Title
      description: A brief title of what the test is.
      placeholder: e.g., Code Security Check
    validations:
      required: true

  - type: dropdown
    id: test-status
    attributes:
      label: Test Status
      options:
        - Pending
        - Failed
        - Blocked
        - Passed
      default: 0
    validations:
      required: true


  - type: textarea
    id: test-description
    attributes:
      label: Test Description
      description: Describe what the test will do in simple terms.
      placeholder: This test will read through all the code to find known vulnerability issues from a third-party database.
    validations:
      required: true

  - type: dropdown
    id: test-execution
    attributes:
      label: Test Execution
      description: Specify if is to be run automatically or manually
      options:
        - Automatic
        - Manual
        - Both

  - type: textarea
    id: objective
    attributes:
      label: Objective
      description: Describe why the test is relevant.
      placeholder: The goal of this test is to ensure the product meets security requirements.
    validations:
      required: true

  - type: dropdown
    id: test-environment
    attributes:
      label: Test Environment
      description: Pick the predefined environment from which the test should be run from.
      options:
        - School PC (Lenovo - Windows)
        - School MacOS (MacBook Air M3 - MacOS)
        - Testing server (Lenovo IdeaPad Slim)
        - Other
      default: 0
    validations:
      required: true

  - type: textarea
    id: dependencies
    attributes:
      label: Dependencies
      description: Describe the elements the test(s) depend on.
      placeholder: GCC version 12.3.0, Python version 3.11 etc.
    validations:
      required: true

  - type: textarea
    id: preconditions
    attributes:
      label: Preconditions
      description: Any requirements or conditions that must be met before performing the test.
      placeholder: The board must be flashed with the latest software and/or reset prior to test execution, etc.
    validations:
      required: true

  - type: textarea
    id: post-conditions
    attributes:
      label: Post-conditions
      description: Describe the expected state of the system after the test was executed, regardless of whether it failed or passed.
      placeholder: After test execution, the test bed should close and the computer should be back to initial state...
    validations:
      required: true

  - type: textarea
    id: test-data
    attributes:
      label: Test Data
      description: Describe the data required as an input for the test.
      placeholder: The test will automatically pull the latest code from the dev branch...
    validations:
      required: true

  - type: textarea
    id: steps
    attributes:
      label: Steps
      description: "You may use the markdown table template below to lay out the different steps of the test."
      placeholder: "1. Login to the application\n2. Navigate to the settings page\n3. ..."
    validations:
      required: true

  - type: markdown
    attributes:
      value: |
        <details><summary><ins><em>Click to show template</em></ins></summary><br>
        
        \| Step ID \| Step Description \| Step Date \| Expected Results \| Actual Results \| Pass / Fail \| Add. Notes\|
        \|--------\|--------\|--------\|--------\|--------\|--------\|--------\|
        \| O \| Cell \| Cell \| Cell \| Cell \| Cell \| Cell \|
        \| 1 \| Cell \| Cell \| Cell \| Cell \| Cell \| Cell \|
        \| 2 \| Cell \| Cell \| Cell \| Cell \| Cell \| Cell \|
        
        </details>

  - type: textarea
    id: notes
    attributes:
      label: Notes
      description: Any additional comments or observations.
      placeholder: I noticed the test execution briefly interrupted the connection to the internet...
    validations:
      required: false
