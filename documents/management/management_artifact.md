# 2024 - 2025 Project-2 Serious Game Team-8 - Management Artifacts

This document aims to centralize all the management artifact links and resources listed below:

- [Tasks & Schedule](#tasks--schedule)
- [RACI Matrix](#raci-matrix)
- [Risks & Assumptions](#risks--assumptions)
- [Key Performance Indicators](#key-performance-indicators)
  - [Definition of our KPIs](#definition-of-our-kpis)
    - [Documents](#documents)
    - [Design](#design)
    - [Game](#game)
    - [Test](#test)
    - [Pitch](#pitch)
    - [Human Resources](#human-resources)
    - [Mood](#mood)
  - [Link to the project's KPIs](#link-to-the-projects-kpis)
  - [Link to the forms](#link-to-the-forms)
- [Weekly Reports](#weekly-reports)
<!-- - [Post Mortem Analysis](#post-mortem-analysis) -->
<!-- - [Addendum](#addendum) -->
  <!-- - [Differences Between Gantt Chart and Actual Schedule](#differences-between-gantt-chart-and-actual-schedule) -->

## Tasks & Schedule

You can view the breakdown of all the tasks we've identified for the duration of the project by following [this link](https://docs.google.com/spreadsheets/d/1YawyIgXylS97_ymcw2Y4kwv85DKmZqUtg69qEnfmWP8/edit?gid=0#gid=0).

This document has been created using Google Docs to keep track of the different tasks for both team members and the client.

## RACI Matrix

The RACI matrix of this project is as follows, considering the [Project Charter](./project_charter.md):

| Name                      | Project Manager | Program Manager | Technical Leader | Software Engineer | Quality Assurance | Technical Writer | Client & Stakeholder |
| ------------------------- | --------------- | --------------- | ---------------- | ----------------- | ----------------- | ---------------- | -------------------- |
| Project kick-off          | I               | I               | I                | I                 | I                 | I                | A/I                  |
| Project charter           | R               | I               | I                | /                 | I                 | I                | A/C                  |
| Schedule creation         | R               | I               | I                | I                 | I                 | I                | I/C                  |
| Functional specifications | A               | R               | I                | I                 | I                 | I                | C                    |
| Technical specifications  | A               | C               | R                | I                 | I                 | I                | C                    |
| Coding process            | A               | C               | C                | R                 | I                 | I                | I                    |
| Testing planification     | A               | /               | C                | C                 | R                 | /                | C                    |
| Usage instructions        | I               | C               | I                | C                 | /                 | R                | A/C                  |

Legend:

| Letter | Full Name   | Description                                     |
| ------ | ----------- | ----------------------------------------------- |
| R      | Responsible | Executes the task or activity                   |
| A      | Accountable | Ultimately answerable for the task's completion |
| C      | Consulted   | Provides input and/or advice on the task        |
| I      | Informed    | Kept updated on progress and decisions          |
| /      | /           | No interaction with this role for this task     |

## Risks & Assumptions

| ID  | Description                                                                              | Consequence                                                               | Impact   | Likelihood | Mitigation/Avoidance                                            |
| --- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | -------- | ---------- | --------------------------------------------------------------- |
| 1   | We might forget a key point in our solution or misinterpret a requirement                | It would impact the time of production to remove or refine them           | High     | Medium     | Regular communications about what's being done with the client. |
| 2   | We might create a game that seems fun to us, but which is not in fact                    | The game would be pointless and we should start from scratch again        | High     | Low        | Regular testing with non-team-member testers.                   |
| 3   | We might start something too big to complete in the time allocated to this project       | The project will end incomplete, or the team would need to work overtime a lot | High     | Medium     | Start small and scale up iteratively.                           |
| 4   | We could fall in love with our product even though it is not completing requirements     | It would result in an off-topic game that is useless                     | High     | Low        | Don't hesitate to pivot if needed.                              |
| 5   | Team member leaving                                                                      | Tasks left to the remaining members without any assignee                  | High     | Unlikely   | Sharing the tasks among the remaining team members.             |

## Key Performance Indicators

### Definition of our KPIs

To keep track of the project's advancement, KPIs have been defined. These KPIs are listed below in their respective categories, along with the reasoning behind each.

#### <ins>Documents</ins>

This section contains the following KPIs:

- **Functional Specifications**
- **Technical Specifications**
- **Test Plan**
- **User Manual**

The following formula measures the progress of these documents:

$$\text{percentage} = \left(\frac{\text{current number of sections}} {\text{total number of sections}}\right)\times{100}$$

Where:

- **current_number_of_sections**: The number of sections that are completely done.
- **total_number_of_sections**: The number of predefined sections in the document's outline, which may evolve.

#### <ins>Design</ins>

This section includes:

- **One-Sheet Design**
- **Assets Spritesheets**

The percentage progress for these KPIs is calculated using this formula:

$$\text{percentage} = \left(\frac{\text{current number of assets designed}} {\text{total number of assets}}\right)\times{100}$$

Where:

- **current_number_of_assets_designed**: The number of assets that have been designed.
- **total_number_of_assets**: The total number of assets planned to be designed during the project analysis.

#### <ins>Game</ins>

This section tracks the following KPIs:

- **First Prototype**
- **Second Prototype**
- **Final Product**

Each of these KPIs is based on sub-tasks and will use user feedback to be calculated:

$$\text{percentage} = \left(\frac{{\text{current number of game mechanics + user feedback adaptation}}} {\text{total game mechanics predefined}}\right)\times{100}$$

Where:

- **current_number_of_game_mechanics**: The number of game mechanics that are fully implemented.
- **user_feedback_adaptation**: Feedback adaptations we get during the test phases between each prototype or product.
- **total_game_mechanics_predefined**: The total number of game mechanics predefined during project analysis and design.

#### <ins>Test</ins>

This section contains only one KPI:

- **Test Cases**

The percentage progress is defined as follows:

$$\text{percentage} = \left(\frac{\text{number of tests performed}} {\text{total number of test cases}}\right)\times{100}$$

Where:

- **number_of_tests_performed**: The number of test cases performed.
- **total_number_of_test_cases**: The total number of test cases predefined.

#### <ins>Pitch</ins>

Only one KPI is included in this section:

- **Pitch Deck**

The percentage of completion is calculated using this formula:

$$\text{percentage} = \left(\frac{\text{current number of slides}} {\text{total number of slides}}\right)\times{100}$$

Where:

- **current_number_of_slides**: The number of slides currently designed in the Pitch Deck.
- **total_number_of_slides**: The number of slides the Pitch Deck should contain in the end.

#### <ins>Human Resources</ins>

The following KPIs are tracked in this section:

- **Overtime**
- **Unjustified Absence**

These KPIs are calculated only over 30 minutes each.

The overtime is tracked according to a [Google Form](#link-to-the-forms).

#### <ins>Mood</ins>

The mood percentage is calculated from the average of a 10-point personal grade. Each team member responds to a survey every week and gives their feelings about the week.

This method allows an accurate way of tracking the motivation and overall mood during the project.

You can find the responses [here](#link-to-the-forms).

### Link to the Project's KPIs

You can see our project's KPIs, which were explained above, by following [this link](https://docs.google.com/spreadsheets/d/1BWe4K6mLUlL6vSzulc70gr5wj0btL7bMgGRO0_gixqE/edit?usp=sharing).

### Link to the Forms

This section gathers all the forms used for the KPIs.

- [Team 8 Satisfaction Week 1](https://docs.google.com/spreadsheets/d/11JtrnA0_N300-CjYwOXmeK_fnCse6ndy-enLrrQBak8/edit?usp=sharing)
- [Team 8 Satisfaction Week 2](https://docs.google.com/spreadsheets/d/1ML4Arv1vPYiqL4hArGwEtkQfFV4OiY-ZppNbpNLqtWs/edit?usp=sharing)
<!-- - [Team 8 Satisfaction Week 3]() -->
<!-- - [Team 8 Satisfaction Week 4]() -->
<!-- - [Team 8 Satisfaction Week 5]() -->
<!-- - [Team 8 Satisfaction Week 6]() -->
<!-- - [Team 8 Satisfaction Week 7]() -->

The following link is used as a cumulative file for the seven weeks:

- [Team 8 Satisfaction Cumulative](https://docs.google.com/spreadsheets/d/1DWyQurWkC8jboxM_5IE4B2zKmjL-0ZCbOPENQtW2KXI/edit?usp=sharing)

## Weekly Reports

The weekly reports folder can be found by following [this link](/documents/management/weekly_reports/).

You can access each of them directly by following the links below:

- [Access Report for Week 1](/documents/management/weekly_reports/weekly_report_week1.md)
- [Access Report for Week 2](/documents/management/weekly_reports/weekly_report_week2.md)
<!-- - [Access Report for Week 3](/documents/management/weekly_reports/weekly_report_week3.md) -->
<!-- - [Access Report for Week 4](/documents/management/weekly_reports/weekly_report_week4.md) -->
<!-- - [Access Report for Week 5](/documents/management/weekly_reports/weekly_report_week5.md) -->
<!-- - [Access Report for Week 6](/documents/management/weekly_reports/weekly_report_week6.md) -->
<!-- - [Access Report for Week 7](/documents/management/weekly_reports/weekly_report_week7.md) -->

You can also access all the reports in one file using the link below:

- [Access Cumulative File for All 7 Weeks](/documents/management/weekly_reports/weekly_reports_cumulative.md)

<!-- ## Post Mortem Analysis -->

<!-- You can refer to our Post Mortem Analysis to have a retrospective of our project following [this link](./post_mortem.md). -->

<!-- ## Addendum -->

<!-- ### Differences Between Gantt Chart and Actual Schedule -->

<!-- The project schedule deviated significantly from the initial Gantt Chart, reflecting substantial differences in both the timeline and the expected prototype of "Adopte Un Candidat." This section aims to explain the discrepancies between the planned and actual schedules.

Learning Dart and Flutter took longer than anticipated, delaying the development phase from the start. As mentioned in the [Post Mortem Analysis](./post_mortem.md), we should have spent more time mastering the language before diving into the project. This would have prevented many of the issues and incompatibilities discovered later, which forced us to rework several features towards the end.

As the project manager, I underestimated the time required to develop each page and its related features. This miscalculation could not be mitigated by overtime if our software engineer worked alone. Consequently, to ensure a functional prototype, we had to reorganize our efforts. Our QA and Technical Writer continued with their tasks, only seeking assistance when necessary. We also solely focused on the job seeker side rather than the company one, preferring quality over quantity.

Overall, although our progress was not as far along as planned, future projects should account more accurately for the software engineer's learning curve and the actual effort needed to create each page. -->