# 2024 - 2025 Project-2 Serious Game Team-8 - Management Artifacts

This document aims to centralize all the management artifact links and resources listed below:

- [Tasks \& schedule](#tasks--schedule)
- [RACI Matrix](#raci-matrix)
- [Risks \& Assumptions](#risks--assumptions)
- [Key Performance Indicators](#key-performance-indicators)
  - [Definition of our KPIs](#definition-of-our-kpis)
    - [Documents](#documents)
    - [Design](#design)
    - [Game](#game)
    - [Test](#test)
    - [Pitch](#pitch)
    - [Human Ressources](#human-ressources)
    - [Mood](#mood)
  - [Link to the project's KPIs](#link-to-the-projects-kpis)
  - [Link to the forms](#link-to-the-forms)
- [Weekly reports](#weekly-reports)
<!-- - [Post Mortem Analysis](#post-mortem-analysis) -->
<!-- - [Addendum](#addendum) -->
  <!-- - [Differences Between Gantt Chart and Actual Schedule](#differences-between-gantt-chart-and-actual-schedule) -->

## Tasks & schedule

You can view the breakdown of all the tasks we've identified for the duration of the project following [this link](https://docs.google.com/spreadsheets/d/1YawyIgXylS97_ymcw2Y4kwv85DKmZqUtg69qEnfmWP8/edit?gid=0#gid=0).

This document has been created using Google Docs in order to keep tracks of the different tasks, for both team members and the client.

## RACI Matrix

The RACI matrix of this project is as follows considering the [Project Charter](./project_charter.md):

| Name                      | Project Manager | Program Manager | Technical Leader | Software engineer | Quality assurance | Technical Writer | Client | Stakeholders |
| ------------------------- | --------------- | --------------- | ---------------- | ----------------- | ----------------- | ---------------- | ------ | ------------ |
| Project kick-off          | I               | I               | I                | I                 | I                 | I                | A      | I            |
| Project charter           | R               | I               | I                | /                 | I                 | I                | A      | C            |
| Schedule creation         | R               | I               | I                | I                 | I                 | I                | I      | C            |
| Functional specifications | A               | R               | I                | I                 | I                 | I                | C      | C            |
| Technical specifications  | A               | C               | R                | I                 | I                 | I                | /      | C            |
| Coding process            | A               | C               | C                | R                 | I                 | I                | I      | I            |
| Testing planification     | A               | /               | C                | C                 | R                 | /                | /      | C            |
| Usage instructions        | I               | C               | I                | C                 | /                 | R                | A      | C            |

Legend:

| Letter | Full name   | Description                                     |
| ------ | ----------- | ----------------------------------------------- |
| R      | Responsible | Executes the task or activity                   |
| A      | Accountant  | Ultimately answerable for the task's completion |
| C      | Consulted   | Provides input and/or advice on the task        |
| I      | Informed    | Kept updated on progress and decisions          |
| /      | /           | No interaction with this role for this task     |

## Risks & Assumptions

| ID  | Description                                                                              | Consequence                                                               | Impact   | Likelihood | Mitigation/Avoidance                                            |
| --- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | -------- | ---------- | --------------------------------------------------------------- |
| 1   | We might forget a key point in our solution or misinterpret a requirement                | It would impact the time of production to remove or refien them           | High     | Medium     | Regular communications about what's being done with the client. |
| 2   | We might create a game that seems fun to us, but who is not in fact                      | The game would be pointless and we should start from scratch again        | High     | Low        | Regular testing with non-team-members tester.                   |
| 3   | We might starting something to big to complete in the time allocated to this project     | The project will end uncomplete or the team should work in overtime a lot | High     | Medium     | Start small and scale up iteratively.                           |
| 4   | We could fall in love with our product even though it is one not completing requirements | It would give an off-topic game which is useless                          | High     | Low        | Don't hesitate to pivot if needed.                              |
| 5   | Team member leaving                                                                      | Tasks left to the remaining members without any assignee                  | High     | Unlikely   | Sharing the tasks among the remaining team members.             |

## Key Performance Indicators

### Definition of our KPIs

To keep tracks of the project advancement, KPIs have been defined. These KPIs are defined below in there respective categories. Their way of calculations are put in addition with them.

#### Documents

This section contains the following KPIs:

- **Functional specifications**
- **Technical specifications**
- **Test Plan**
- **User Manual**

The following formula measure the progress of these documents:

$$\text{percentage} = (\frac{\text{current number of sections}} {\text{total number of sections}})\times{100}$$

Where:

- **current_number_of_sections**: The number of sections that are completely done.
- **total_number_of_sections**: The number of predefined sections in the document's outline, which may evolve.

#### Design

This section includes:

- **One-Sheet Design**
- **Assets Spritesheets**

The percentage progress for these KPIs is calculated using this formula:

$$\text{percentage} = (\frac{\text{current number of assets designed}} {\text{total number of assets}})\times{100}$$

Where:

- **current_number_of_assets_designed**: The number of assets that have been designed.
- **total_number_of_assets**: The total number of assets planned to be designed during the project analysis.

#### Game

This section tracks the following KPIs:

- **First Prototype**
- **Second Prototype**
- **Final Product**

Each of those KPIs are based on sub-task and will use Users feedback to be calculated:

$$\text{percentage} = (\frac{({\text{current number of game mechanics + user feedback adaptation}})} {\text{total game mechanics predifined}})\times{100}$$

Where:

- **current_number_of_game_mechanics**: The number of game mechanics that are fully implemented.
- **user_feedback_adaptation**: Feedback adaptations we get during the test phases between each prototype or product.
- **total_game_mechanics_predifined**: The total number of game mechanics predefined during project analysis and design.

#### Test

This section contains only one KPI:

- **Test Cases**

The percentage progress would be defined as such:

$$\text{percentage} = (\frac{\text{current number of test cases}} {\text{total number of test cases}})\times{100}$$

Where:

- **current_number_of_text_cases**: The number of test cases currently written.
- **total_number_of_test_cases**: The total number of test cases predifined.

#### Pitch

Only one KPI is included in this section:

- **Pitch Deck**

The percentage of completion would be calculated using this formula:

$$\text{percentage} = (\frac{\text{current number of slides}} {\text{total number of slides}})\times{100}$$

Where: 

- **current_number_of_slides**: The number of slides currently designed in the Pitch Deck.
- **total_number_of_slides**: The number of slides the Pitch Deck should contain in the end.

#### Human Ressources

The following KPIs are tracked in this section:

- **Overtime**
- **Injustified Absence**

These KPIs are calculated only over 30 minutes each.

The overtime are tracked according to a [Google form](#link-to-the-forms).

#### Mood

The mood percentage is calculated from the average of a 10 personal grade. Each team members respond to a survey every weeks and they have to give their feelings over the week.

This method allows an accurate way of tracking the motivation and global mood during the project.

You can find the responses [here](#link-to-the-forms).

### Link to the project's KPIs

You can see our project's KPIs which were explained above following [this link](https://docs.google.com/spreadsheets/d/1BWe4K6mLUlL6vSzulc70gr5wj0btL7bMgGRO0_gixqE/edit?usp=sharing).

### Link to the forms

This section is here to gather all the forms used for the KPIs.

  - [Team 8 Satisfaction Week 1](https://docs.google.com/spreadsheets/d/11JtrnA0_N300-CjYwOXmeK_fnCse6ndy-enLrrQBak8/edit?usp=sharing)
  <!-- - [Team 8 Satisfaction Week 2]() -->
  <!-- - [Team 8 Satisfaction Week 3]() -->
  <!-- - [Team 8 Satisfaction Week 4]() -->
  <!-- - [Team 8 Satisfaction Week 5]() -->
  <!-- - [Team 8 Satisfaction Week 6]() -->
  <!-- - [Team 8 Satisfaction Week 7]() -->

The following link is used as a cumulative for the seven weeks:

  - [Team 8 Satisfaction Cumulative](https://docs.google.com/spreadsheets/d/1XuxYtWgcUpnG3XmunEh33R46xmMi0EG3kv1voRpgjVk/edit?usp=sharing)

## Weekly reports

The weekly reports folder can be found following [this link](/documents/management/weekly_reports/).

You can access each of them directly by following the links just below:

- [Access Report for Week 1](/documents/management/weekly_reports/weekly_report_week1.md)
<!-- - [Access Report for Week 2](/documents/management/weekly_reports/weekly_report_week2.md) -->
<!-- - [Access Report for Week 3](/documents/management/weekly_reports/weekly_report_week3.md) -->
<!-- - [Access Report for Week 4](/documents/management/weekly_reports/weekly_report_week4.md) -->
<!-- - [Access Report for Week 5](/documents/management/weekly_reports/weekly_report_week5.md) -->
<!-- - [Access Report for Week 6](/documents/management/weekly_reports/weekly_report_week6.md) -->
<!-- - [Access Report for Week 7](/documents/management/weekly_reports/weekly_report_week7.md) -->

You can also access all the reports in one file using the link below:

- [Access Cumulative file for all 7 weeks](/documents/management/weekly_reports/weekly_reports_cumulative.md)

<!-- ## Post Mortem Analysis -->

<!-- You can refer to our Post Mortem Analysis to have a retrospective of our project following [this link](./post_mortem.md) -->

<!-- ## Addendum -->

<!-- ### Differences Between Gantt Chart and Actual Schedule -->

<!-- The project schedule deviated significantly from the initial Gantt Chart, reflecting substantial differences in both the timeline and the expected prototype of "Adopte Un Candidat." This section aims to explain the discrepancies between the planned and actual schedules.

Learning Dart and Flutter took longer than anticipated, delaying the development phase from the start. As mentioned in the [Post Mortem Analysis](./post_mortem.md), we should have spent more time mastering the language before diving into the project. This would have prevented many of the issues and incompatibilities discovered later, which forced us to rework several features towards the end.

As the project manager, I underestimated the time required to develop each page and its related features. This miscalculation could not be mitigated by overtime if our software engineer worked alone. Consequently, to ensure a functional prototype, we had to reorganize our efforts. Our QA and Technical Writer continued with their tasks, only seeking assistance when necessary. We also solely focused on the job seeker side rather than the company one, preferring quality rather than quantity.

Overall, although our progress was not as far along as planned, future projects should account more accurately for the software engineer's learning curve and the actual effort needed to create each page. -->