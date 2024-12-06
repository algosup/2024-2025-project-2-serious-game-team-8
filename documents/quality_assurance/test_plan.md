
<div align="right"><h6>Document Owner: Mathis KAKAL</h6></div>

---

<div align="center"><h1>Test Plan</h1></div>


<details><summary><em><ins>Click to expand table of content...</ins></em></summary>

- [1 - Introduction](#1---introduction)
    - [1.1 - Purpose](#11---purpose)  
  - [1.2 - Product Overview](#12---product-overview)  
    - [1.2.1 - Customer/Business Requirements](#121---customerbusiness-requirements)  
    - [1.2.2 - Functional and Technical Specifications](#122---functional-and-technical-specifications)  
      - [1.2.2.1 - Game Structure and Mechanics](#1221---game-structure-and-mechanics)  
      - [1.2.2.2 - Educational Focus](#1222---educational-focus)  
      - [1.2.2.3 - Card-Based Gameplay](#1223---card-based-gameplay)  
      - [1.2.2.4 - Digital Application Features](#1224---digital-application-features)  
      - [1.2.2.5 - Game Levels and Narrative](#1225---game-levels-and-narrative)  
      - [1.2.2.6 - Integration of Cards and App](#1226---integration-of-cards-and-app)  
      - [1.2.2.7 - Performance Metrics and Player Feedback](#1227---performance-metrics-and-player-feedback)  
      - [1.2.2.8 - Design and Accessibility](#1228---design-and-accessibility)  
      - [1.2.2.9 - Technical and Environmental Constraints](#1229---technical-and-environmental-constraints)  
      - [1.2.2.10 - Future Scalability](#12210---future-scalability)  
  - [1.3 - Testing Areas](#13---testing-areas)  
    - [1.3.1 - Overview](#131---overview)  
    - [1.3.2 - Detailed (Project Scope)](#132---detailed-project-scope)  
  - [1.4 - Success Criteria](#14---success-criteria)  
  - [1.5 - Identified Risks & Mitigations](#15---identified-risks--mitigations)
- [2 - Tooling](#2---tooling)  
  - [2.1 - Methodology](#21---methodology)  
    - [2.1.1 - Bug Resolution process (Corrective QA)](#211---bug-resolution-process-corrective-qa)  
    - [2.1.2 - Test Creation and Execution (Proactive Quality Improvement)](#212---test-creation-and-execution-proactive-quality-improvement)
  - [2.2 - GitHub Issues](#22---github-issues)  
    - [2.2.1 - Issue Templates](#221---issue-templates)  
      - [2.2.1.1 - Overview](#2211---overview)  
      - [2.2.1.2 - Detailed](#2212---detailed)  
  - [2.3 - GitHub Project](#23---github-project)  
    - [2.3.1 - Issue Attributes](#231---issue-attributes)  
    - [2.3.2 - Insights](#232---insights)  
      - [2.3.2.1 - Issues by priority across iterations](#2321---issues-by-priority-across-iterations)  
      - [2.3.2.2 - Test Sizes Across Assignees](#2322---test-sizes-across-assignees)  
      - [2.3.2.3 - Issues by Status and Severity](#2323---issues-by-status-and-severity)  
      - [2.3.2.4 - Test Execution Progress By Iteration](#2324---test-execution-progress-by-iteration)  
      - [2.3.2.5 - Labels by Iteration](#2325---labels-by-iteration)  
      - [2.3.2.6 - Severity Distribution per Milestone](#2326---severity-distribution-per-milestone)  
      - [2.3.2.7 - Issue Completion Rate by Iteration](#2327---issue-completion-rate-by-iteration)  
      - [2.3.2.8 - Status by Assignees](#2328---status-by-assignees)  
      - [2.3.2.9 - Priority by Severity](#2329---priority-by-severity)  
      - [2.3.2.10 - Issue Count by Iteration and Milestone](#23210---issue-count-by-iteration-and-milestone)  
      - [2.3.2.11 - Test Size Trend Over Time](#23211---test-size-trend-over-time)
- [3 - Strategy](#3---strategy)  
  - [3.1 - Testing Approaches](#31---testing-approaches)  
    - [3.1.1 - Integration Testing](#311---integration-testing)  
    - [3.1.2 - Functional Testing](#312---functional-testing)  
    - [3.1.3 - Internal Playtesting](#313---internal-playtesting)  
    - [3.1.4 - Regression Testing](#314---regression-testing)  
    - [3.1.5 - End-to-End Testing](#315---end-to-end-testing)  
    - [3.1.6 - Usability and Accessibility Testing](#316---usability-and-accessibility-testing)  
    - [3.1.7 - Performance Testing](#317---performance-testing)  
  - [3.2 - Testing Schedule](#32---testing-schedule)  
    - [3.2.1 - Week 5: Validation and Early Integration](#321---week-5-validation-and-early-integration)  
    - [3.2.2 - Week 6: Release Preparation and Final QA](#322---week-6-release-preparation-and-final-qa)  
    - [3.2.3 - Week 7: Presentation and Demo Preparation](#323---week-7-presentation-and-demo-preparation)

</details>

---

# 1 - Introduction

---

## 1.1 - Purpose

The test plan is a strategic document that outlines the approach, scope and schedule of testing activities. It should provide stakeholders and collaborators alike with a comprehensive framework to ensure the software meets its requirements and functions as intended.

## 1.2 - Product Overview
### 1.2.1 - Customer/Business Requirements

*In order to meet the Customer and Business Requirements, our team, EkoLock, must produce a serious game that adheres to the following principles.*

 - **Educational Focus**: The game must prioritize education on climate change topics. The primary goal is to teach players challenging and meaningful concepts, such as the greenhouse effect, carbon footprints, or the impact of lifestyle choices on the environment.

 - **Target Audience**: The target audience must be clearly defined, such as middle school students, urban adults in Europe, or policymakers in developing countries, and the game content should be tailored to their needs and learning levels.

 - **Serious Game Design**: The game must integrate its educational goals seamlessly into engaging and fun gameplay. It should not merely entertain but leverage gaming techniques to make complex topics accessible and enjoyable.

 - **Polished and Bug-Free**: The final deliverable must be a small, polished game created in GODOT 4.3. It should be as feature-complete and bug-free as possible, adhering to high standards of game design and development.

 - **Theme**: The overarching theme is climate Change, with subtopics (e.g., nuclear energy, rising temperatures, transportation options, wildfires) and genres (e.g., strategy, card games, platformers) open for the development team to decide.

 - **Continuous Testing**: Rigorous testing must be a fundamental part of the development process to ensure the game meets quality expectations.

> [!TIP]  
You may read [the management reports](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/tree/3add43b3f611172f90a27cf675fb493f85c54f56/documents/management) to get a better idea of the process of refining the idea and defining the scope of the project with the stakeholders.  

### 1.2.2 - Functional and Technical Specifications

> The vision is to educate players about climate change by embedding factual knowledge in a gamified, adventure-driven environment. The game aims to challenge misconceptions and deepen players’ understanding of environmental issues while keeping the experience enjoyable and interactive.  

 - *Extract from the Functional Specifications.*

Here are the main features of the game, as laid out in the functional specifications:

#### 1.2.2.1 - Game Structure and Mechanics

 - The game combines physical cards and a digital app for a hybrid experience.

 - Players solve puzzles, interact with cards, and progress through a narrative-driven escape-room style game.

 - Gameplay involves card combinations, machine puzzles, location exploration, and hints.

 - A timer creates urgency, with penalties for mistakes.

#### 1.2.2.2 - Educational Focus

 - The game must teach players about climate change, addressing misconceptions and providing factual knowledge.

 - Educational objectives are embedded within the puzzles, narrative, and gameplay mechanics.

#### 1.2.2.3 - Card-Based Gameplay

 - Physical cards have distinct types (Action Cards, Machines, Locations, Penalties) to guide gameplay.

 - Card interactions include:
    - **Combination Mechanic**: Adding card numbers to determine outcomes.
    - **Machine Interaction**: Solving app-based puzzles triggered by specific cards.

- Cards are marked with unique alphanumeric codes for app integration.

#### 1.2.2.4 Digital Application Features

 - The app manages:
    - **Code entry** for unlocking puzzles or progressing in the story.
    - **Machine puzzles** requiring player interaction, such as dragging, tilting, or entering codes.
    - **Hint system**, which offers progressive clues with time penalties for use.
    - **Timer functionality** to track game progress and enforce urgency.
    - **End-game metrics and ranking** to evaluate player performance based on time, penalties, and mistakes.

#### 1.2.2.5 - Game Levels and Narrative

 - The game includes a tutorial for onboarding players, introducing mechanics, and ensuring understanding.

 - Three main levels (e.g., chemical lab, biology lab, energy lab) are designed to challenge players and progressively deepen the narrative.

 - Levels feature unique themes and increasing puzzle complexity to maintain engagement.

#### 1.2.2.6 - Integration of Cards and App

 - The app validates unique alphanumeric codes on the cards to trigger actions like unlocking puzzles or advancing the story.

 - Cards reference other cards and app content, enabling dynamic storytelling and puzzle progression.

#### 1.2.2.7 - Performance Metrics and Player Feedback

 - The game tracks key performance metrics, including:
    - Time spent
    - Penalties incurred
    - Hints used
    - Incorrect code submissions

 - Players receive a star-based ranking at the end of the game, reflecting their performance and mistakes.

#### 1.2.2.8 - Design and Accessibility

 - The game supports both physical and digital components to reduce screen time for young players.

 - It is accessible on Android (5.0+) and iOS (14+) devices, with a focus on low technical requirements, in order to focus on the gameplay more.

 - Cards and app visuals are designed for clarity and consistency, creating a sense of immersion.

#### 1.2.2.9 - Technical and Environmental Constraints

 - App loading times must be under 5 seconds.

 - The executable size of the app must not exceed 50MB.

 - Cards are printed on sustainable materials to minimize environmental impact.

#### 1.2.2.10 - Future Scalability

 - GateKeeper is only the first chapter of a series of three games, therefore, the game framework must allow for future expansion.

 - Future updates may include more complex mechanics or additional educational themes.

## 1.3 - Testing Areas

*From the previously mentioned requirements and specifications, we can anticipate that the Quality Assurance will extend to multiple aspects of the project, as shown below:*

### 1.3.1 - Overview

![image](https://github.com/user-attachments/assets/7abfd7ac-ff3b-4635-8e47-d674c4b551c7)

The project contains several testing areas which fall under three broad categories:

 - **Team Management QA**: The goal of this section is to ensure that all the processes surrounding the creation of the solution are fluid and that the level of reporting is sufficient to detect and solve problems as quickly as possible. This includes reviews of key management documents such as the Project Charter, Management Artefacts (including risk and anticipation documentation), Weekly Reports, and KPI evaluations to ensure alignment and efficiency.
    
 - **Program Management QA**: This section focuses on ensuring that the foundational aspects of the project are well-defined, feasible, and aligned with the overall vision. It involves reviewing Functional Specifications, Technical Specifications, Visual Design, and Sound Design. Additionally, a Game Lens Review ensures that the game design achieves its educational and objective while adhering to established standards.

 - **Program Development QA:** The focus here is on the implementation phase of the project, ensuring that both physical and digital components function seamlessly. This includes detailed testing of the Physical Cards to validate usability, clarity, and integration with the app, as well as rigorous testing of the Game App to ensure smooth gameplay, robust mechanics, and minimal bugs.

### 1.3.2 - Detailed (Project Scope)

*The following table presents the subjects being tested in this project, those categories will be used to designate which part of the game is being discussed. This system is mostly used for naming issues.*

| **Category** | **Description** |
|---|---|
| **DOCS** | Tests in this category focus on validating the clarity, consistency, and completeness of documentation, ensuring all written materials support the development and user experience effectively. |
| **MOCKUPS** | These tests evaluate the visual and functional fidelity of design mockups, ensuring they align with user expectations and the overall game concept before integration. |
| **AUDIO** | Audio tests ensure sound effects and music are clear, synchronized with gameplay, and enhance the immersive experience without causing distractions. |
| **CARDS** | Tests in this category verify the design, functionality, and integration of physical cards, ensuring they align with game mechanics and provide seamless interaction with the app. |
| **GAME** | Game tests assess the core mechanics, performance, and user experience of the app and hybrid gameplay, ensuring smooth and engaging functionality across all features. |

> [!IMPORTANT]  
> The unit testing of the game is not part of the QA's responsibility  

## 1.4 - Success Criteria

*In conformity with the product's requirements and specifications, below are the criteria that we will attempt to monitor closely throughout the project, as they are important parameters for the improvement of our product.*

| **Category** | **Success Criteria** |
|---|---|
| **Educational Impact** | **Knowledge Retention:** Players demonstrate increased knowledge through pre- and post-game surveys or quizzes. |
| | **Engagement with Educational Content:** Track if players complete educational portions without skipping or rushing. |
| **User Engagement** | **Completion Rates:** Percentage of users who finish the game or specific levels. |
| | **Revisit Rates:** Players return to play the game multiple times, indicating interest or perceived value. |
| | **Average Session Duration:** Monitor how long players spend actively engaged with the game per session. |
| | **User Feedback:** Positive reviews or survey results on enjoyment, learning, and usability during playtesting. |
| **Gameplay Functionality** | **Bug-Free Performance:** The game operates without crashes or major bugs during play. |
| | **Balanced Difficulty:** Challenges are neither too easy nor too difficult, maintaining engagement without frustration. |
| **Usability and Accessibility** | **Ease of Use:** Players find the game intuitive and easy to navigate, as confirmed by usability testing. |
| | **Accessibility Features:** Accommodates a diverse audience, including players with disabilities. |
| **Technical Performance** | **Load Times:** Levels and menus load within acceptable time limits (5 seconds). |
| | **Device Compatibility:** Game works smoothly on all target devices without noticeable performance drops. |
| **Alignment with Design Goals** | **Theme Consistency:** Visual and audio design consistently reinforce educational and narrative themes. |
| | **Educational Integration:** Educational elements feel naturally integrated into the gameplay. |
| **Testing Metrics** | **Pass Rate:** Percentage of test cases passed without critical or high-severity issues. |
| **Team Feedback** | **Stakeholder Approval:** Teachers, mentors, or peers agree the game meets educational and entertainment goals. |
| | **Developer Insights:** Development team finds QA feedback actionable and aligned with objectives. |
| **Scalability and Future-Proofing** | **Ease of Updates:** Game structure allows for future content additions or fixes without extensive rework. |
| | **Expandability:** New levels, scenarios, or mechanics can be seamlessly added in future extensions. |

## 1.5 - Identified Risks & Mitigations

> [!NOTE]
> This is an extension if the "risks & mitigation" outlined in the Project Management Artefacts.

| **Risk** | **Description** | **Mitigation** |
|---|---|---|
| **Scope Creep** | Uncontrolled expansion of project scope, leading to delays. | We will clearly define and document the project scope in the Project Charter. We will revisit the scope regularly during QA reviews and align with stakeholders frequently to validate priorities and prevent deviations. |
| **Unrealistic Deadlines** | Tight timelines causing rushed development and testing phases. | We will integrate QA testing phases into the project timeline with clear milestones. We will ensure sufficient time is allocated for regression and exploratory testing as part of the Test Plan. We will provide consistent progress updates through Weekly Reports. |
| **Inadequate Resource Allocation** | Insufficient time, tools, or personnel hindering development or debugging. | We will assess resources regularly in Management Artefacts Reviews and advocate for necessary tools, such as automated testing software. We will prioritize critical features and bugs using severity levels in GitHub issue templates. |
| **Poor Communication** | Miscommunication leading to missed requirements or misunderstandings. | We will use QA reviews (e.g., Functional Specifications) to ensure clear and consistent documentation. We will document bugs, feedback, and progress systematically on GitHub. |
| **Low Stakeholder Engagement** | Limited input from stakeholders leading to misaligned deliverables. | We will involve stakeholders in early playtesting and review cycles. We will track stakeholder priorities and satisfaction through KPI Reviews. We will collect structured feedback after major testing milestones to stay aligned with their expectations. |
| **Lack of Testing Coverage** | Critical bugs or broken features slipping into the final product. | We will create a comprehensive Test Plan covering functional, non-functional, and regression tests. We will use a mix of manual and automated testing. We will categorize issues by priority (P0-P3) and severity (Critical to Trivial) to focus QA resources. |
| **Unclear Success Metrics** | Difficulty in assessing whether the game meets its goals. | We will define success criteria, such as educational impact and gameplay functionality, clearly in the QA Test Plan. We will track metrics like completion rates, user feedback, bug closure rates, and stakeholder approval. We will use end-game rankings to measure success. |
| **Inadequate Risk Management** | Failure to anticipate and address risks disrupting development. | We will continuously review Risk Management Artefacts to identify and rank new risks. We will include mitigation plans for high-impact risks in QA documentation and monitor them dynamically using Test Execution Reports. |
| **Team Burnout** | Overworking team members, reducing productivity and morale. | We will advocate for realistic deadlines and distribute workload evenly during QA planning. We will identify signs of burnout through Weekly Reports and schedule buffer time for unexpected delays in the Test Plan. |
| **Compatibility and Integration Issues** | Poor integration between physical cards and the app, leading to a subpar user experience. | We will test app-card integration thoroughly during QA phases. We will include usability testing with real players and document workflows and edge cases in the Technical Specifications Review to ensure seamless functionality. |

---

# 2 - Tooling

---

## 2.1 - Methodology

The Quality Assurance engineer's work typically falls into two broad categories:

 - **Corrective Quality Assurance**: Resolving identified issues and verifying fixes to ensure the game functions as expected.

 - **Proactive Quality Improvement**: Establishing testing standards, conducting scheduled tests, and implementing processes to minimize future defects and enhance the overall quality of the product.

*Here are two of the main processes that represent those categories:*

### 2.1.1 - Bug Resolution process (Corrective QA)

![image](https://github.com/user-attachments/assets/0e25620d-5e85-4992-9abf-646ab286a624)

### 2.1.2 - Test Creation and Execution (Proactive Quality Improvement)

![image](https://github.com/user-attachments/assets/5a089221-2f2f-4935-8a7d-5c12b887b2af)

## 2.2 - GitHub Issues

Our QA workflow is designed to be fully integrated into GitHub Issues, making it the central hub for all quality assurance activities.

From identifying and tracking bugs to developing structured templates for reviews and discussions on feature development, every step of the QA process is documented and managed within GitHub.

This approach ensures transparency, allows for better collaboration, and provides a single source of truth for both the QA team and developers.

By leveraging GitHub's organizational tools, such as labels, milestones, and issue linking, we maintain a streamlined and efficient workflow that supports continuous feedback and improvement throughout the development cycle.

### 2.2.1 - Issue Templates

Issue templates are there to streamline the process of creating, documenting, and addressing various QA tasks and development needs.

They provide a standardized structure for reporting bugs, reviewing designs, tracking test cases, and gathering feedback, ensuring consistency and clarity across all team interactions.

These templates allow contributors to focus on the content rather than the format, improving the efficiency and accuracy of communication.

By categorizing and labeling issues with predefined templates, we enhance traceability, prioritize tasks effectively, allowing for better collaboration between QA, developers, and stakeholders.

#### 2.2.1.1 - Overview

*You may access them by using the following links:*

| Test Subject | Link to Issue Template |
|---|---|
| App Mockup Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=design%2C+quality-assurance%2C+UI%2FUX&projects=&template=app_design_review_template.md&title=%5BMOCKUPS%5D+App+Mockup+Review+%23) |
| Beta Tester Feedback Form | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=mathiskakal&labels=feedback%2Cbeta-testing&projects=algosup%2F45&template=beta_tester_feedback_form.yml&title=%5BFEEDBACK%5D+Beta+Test+Feedback) |
| Bug Report Form | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=mathiskakal&labels=bug&projects=algosup%2F45&template=bug_report_template.yml&title=%5BBUG%5D+INSERT_BUG_NAME) |
| Game Card Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=design%2C+quality-assurance&projects=&template=card_design_review_template.md&title=%5BCARDS%5D+Game+Card+Review+%23) |
| Functional Specifications Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=documentation&projects=&template=functional_specifications_review_template.md&title=%5BDOCS%5D+Functional+Specifications+Review+%23) |
| KPI Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=documentation&projects=&template=kpi_review_template.md&title=%5BDOCS%5D+KPI+Review+%23) |
| Management Artefacts Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=documentation&projects=&template=management_artefacts_review_template.md&title=%5BDOCS%5D+Management+Artefacts+Review+%23) |
| Document Suggestion | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=documentation&projects=&template=md_doc_review_template.md&title=%5BDOCS%5D+DOCUMENT_NAME) |
| Project Charter Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=documentation&projects=&template=project_charter_review_template.md&title=%5BDOCS%5D+Project+Charter+Review+%23) |
| Sound Design Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=design%2C+audio%2C+quality-assurance&projects=&template=sound_design_review_template.md&title=%5BAUDIO%5D+Sound+Design+Review+%23) |
| Technical Specifications Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=documentation&projects=&template=technical_specifications_review_template.md&title=%5BDOCS%5D+Technical+Specifications+Review+%23) |
| Test Case Form | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=mathiskakal&labels=test&projects=algosup%2F45&template=test_case_form.yml&title=%5BTESTING%5D+TEST_NAME) |
| Weekly Report Review | [Link To Issue Template](https://github.com/algosup/2024-2025-project-2-serious-game-team-8/issues/new?assignees=&labels=documentation&projects=&template=weekly_report_review_template.md&title=%5BDOCS%5D+Weekly+Report+Review+%23) |

#### 2.2.1.2 - Detailed

*In order to streamline the reviewing process, and thanks to our past experience, we have built up a library of Issue Templates that correspond to each area of testing.*

<details>
<summary><ins>App Mockup Review Template</ins></summary><br/>

This template is used to evaluate the mockups of the app interface before they are integrated into the game. It ensures that the design aligns with user experience principles, meets accessibility requirements, and adheres to the project’s visual and thematic guidelines.

</details>

<details>

<summary><ins>Beta Tester Feedback Form:</ins></summary><br/>

This template is designed for gathering feedback from beta testers who experience the game. It focuses on user impressions, gameplay mechanics, educational value, and overall usability to identify areas for improvement based on real-world user experience

</details>

<details>
<summary><ins>Bug Report Form: </ins></summary><br/>

This template is essential for documenting bugs discovered during testing or gameplay. It captures critical information, such as reproduction steps, severity, and the environment in which the issue occurred, to help developers resolve issues efficiently.

</details>

<details>
<summary><ins>Game Card Review Template:</ins></summary><br/>

This template is used to evaluate the design, functionality, and clarity of the physical cards used in the game. It ensures the cards are consistent with the gameplay mechanics, visually appealing, and align with the game's educational and thematic goals.

</details>

<details>
<summary><ins>Functional Specifications Review Template:</ins></summary><br/>

This template is used to review the functional specifications document, which outlines the features and behavior of the game. It ensures the specifications are clear, complete, and feasible for development while addressing any ambiguities or inconsistencies.

</details>

<details>
<summary><ins>KPI Review Template:</ins></summary><br/>

This template focuses on evaluating the Key Performance Indicators (KPIs) defined for the project. It ensures that the KPIs align with the project’s objectives, are measurable, and provide meaningful insights into the game's progress and success.

</details>

<details>
<summary><ins>Management Artefacts Review Template:</ins></summary><br/>

This template is used to review management-related documents, such as risk assessments, task tracking, and progress reports. It ensures these artifacts are well-organized, accurate, and support efficient project management.

</details>

<details>
<summary><ins>Document Suggestion:</ins></summary><br/>

This template allows team members to propose improvements or additions to any project documentation. It ensures that suggestions are recorded systematically and evaluated for their impact on the project.

</details>

<details>
<summary><ins>Project Charter Review Template:</ins></summary><br/>

This template is used to assess the project charter, which defines the project's scope, objectives, and key stakeholders. It ensures the charter is clear, comprehensive, and provides a strong foundation for the team to work from.

</details>

<details>
<summary><ins>Sound Design Review Template:</ins></summary><br/>

This template evaluates the sound effects and music used in the game. It ensures the audio aligns with the game’s theme, enhances the user experience, and meets quality standards without causing distraction or annoyance.

</details>

<details>
<summary><ins>Technical Specifications Review Template</ins></summary><br/>

This template is used to review the technical specifications document, which outlines the architecture, tools, and technical requirements for the game. It ensures the specifications are accurate, realistic, and aligned with the functional requirements.

</details>

<details>
<summary><ins>Test Case Form:</ins></summary><br/>

This template is designed for documenting individual test cases. It includes details about the test objectives, steps, expected outcomes, and actual results, providing a structured approach to ensure thorough testing coverage.

</details>

<details>
<summary><ins>Weekly Report Review Template:</ins></summary><br/>

Weekly Report Review Template: This template is used to review weekly progress reports submitted by the team. It ensures the reports accurately reflect completed tasks, challenges, and plans for the upcoming week, thus helping with transparency and accountability.

</details>



## 2.3 - GitHub Project

Once the issues have been created, they end up in a database called "GitHub Projects", which allows us to have a more advanced and customisable view of all the current tasks and reports of the project.

Unlike Issues, which can be created by any collaborator, the process of "Triaging" issues, which involves categorising, prioritising and managing issues is generally reserved to the Quality Assurance team member.

This process adds additional metadata on top of the existing issues to help strategically solving them.

<!-- <CLICK HERE to explore the project dashboard (in a centered button)> -->

### 2.3.1 - Issue Attributes

*In order to successfully read the database, you will need to understand the following attributes which are used to describe the Issues.*

<!-- <WRAP EACH  OF THOSE IN THEIR OWN DETAILS ???  > -->

<details>
<summary><ins>Status</ins></summary><br/>

*This field indicates the status of an issue which is fundamental for tracking any progress.*

| **Status** | **Description** |
|---|---|
| **Triage** | Triage is where the testing journey begins. |
| **Backlog** | This is actively being worked on. Test has been planned, but is waiting on additional dependencies. |
| **Waiting/Blocked** | Same as backlog, waiting on external input to be able to test. |
| **Todo** | All test dependencies are available, ready to run. |
| **In Progress** | Test is being performed. |
| **In Review** | Test has been performed, need to tear down, and get the test results. |
| **Done** | Test is fully complete. |
</details>

<details>
<summary><ins>Priority</ins></summary><br/>

*This field indicates the perceived priority of a task, which depends on multiple factors which evolve throughout the project, the main one being the product's functional and technical requirements.*

| **Priority** | **Description** |
|---|---|
| **P0** | P0 designates the utmost priority. The P0 features are critical features for the product. (Also known as must-haves) |
| **P1** | P1 designates the second most important priority. The P1 features are important for the product. (Also known as should-haves) |
| **P2** | P2 designates the third most important priority. The P2 features are nice-to-have features for the product. (Also known as could-haves) |
| **P3** | P3 designates the least important priority. The P3 features are optional features for the product. (Also known as would-haves) |
</details>

<details>
<summary><ins>Iteration</ins></summary><br/>

*Iteration is the phase of the project the issue belongs to. Example: It doesn't make sense to plan the review of the physical cards on week 2, since they don't exist yet. This is not the same as the actual start/end dates, which can reveal delays or anticipations.*

| **Iteration** | **Dates** |
|---|---|
| **Week 2/7** | Nov 11 - Nov 15 |
| **Week 3/7** | Nov 18 - Nov 22 |
| **Week 4/7** | Nov 25 - Nov 29 |
| **Week 5/7** | Dec 02 - Dec 06 |
| **Week 6/7** | Dec 09 - Dec 13 |
| **Week 7/7** | Dec 16 - Dec 19 |
</details>

<details>
<summary><ins>Test Size</ins></summary><br/>

*This field indicates the time a test is supposed to take which helps with planning and prioritising.*

| **Test Size** | **Description** |
|---|---|
| **XS** | Very minor task that requires little effort. **Effort:** Typically a few minutes. |
| **S** | Small tasks that are straightforward and don't require significant research or complex implementation. **Effort:** Typically under an hour. |
| **M** | Tasks that involve a moderate level of effort and might require some research and planning. **Effort:** Typically several hours or so. |
| **L** | Larger tasks that are complex and require considerable time to complete. **Effort:** Typically a day of work or a little more. |
| **XL** | Very large tasks that are highly complex, possibly requiring coordination across different parts of the project or among multiple teams. **Effort:** Typically several days of work or more; should probably be broken down. |
</details>

<details>
<summary><ins>Start Date</ins></summary><br/><br/>

*This field allows the QA to input the start date of the test for later reference. This doesn't have to be the same as the planned iteration.*
</details>

<details>
<summary><ins>End Date</ins></summary><br/>

*This field allows the QA to input the end of the test for later reference. This doesn't have to be the same as the planned iteration.*
</details>

<details>
<summary><ins>Severity</ins></summary><br/>

*This field is only used for bug reports, in order to help prioritise them.*

| **Severity** | **Description** |
|---|---|
| **Critical** | Causes crashes, loss of data, severe memory leak, or any issue that necessitates immediate action to prevent irreparable damage. |
| **High** | Significantly affects application performance or functionality, potentially leading to a substantial problem if not addressed. |
| **Medium** | Affects functionality or performance but has a workaround; not immediately damaging but should be fixed. |
| **Low** | A minor problem or an issue that has little effect on functionality or performance. |
| **Trivial** | Very minor issues that do not affect functionality or performance, such as cosmetic issues not noticed by most users. |
</details>

<details>
<summary><ins>Execution</ins></summary><br/>

*This field indicates how the tests are run, to help identify bottlenecks and to help prioritise.*

| **Execution Type** | **Description** |
|---|---|
| **Manual** | Test executed manually. |
| **Semi-automatic** | Test executed through GitHub Actions and reported/reviewed manually. |
</details>


### 2.3.2 - Insights

Those attributes will allow us to gain valuable insights which can take the form of multiple graphs, each serving a particular purpose.
You can access those by clicking [this link](https://github.com/orgs/algosup/projects/45/insights).

#### 2.3.2.1 - Issues by priority across iterations

![image](https://github.com/user-attachments/assets/40f6e772-d747-4ef1-8d34-f373f9214a0d)

Understand the distribution of high-priority (P0, P1) issues across iterations. Ensure critical issues are addressed earlier in the development cycle.

💭 *Questions it may help answer:*
> Are we addressing critical (P0, P1) issues early enough in the development process?  

> Is the priority distribution aligned with our planned focus for each iteration?  

#### 2.3.2.2 - Test Sizes Across Assignees

![image](https://github.com/user-attachments/assets/d3b9eb3b-9ee4-4ce5-8337-86fa6a32e491)

Visualize workload distribution among team members by task complexity (e.g., XS, S, M, L, XL). Helps balance workloads.

💭 *Questions it may help answer:*
> Is the workload evenly distributed among team members?  

> Who is handling the majority of complex (L, XL) tests?  

> Are certain team members overwhelmed with too many tasks of varying sizes?  

#### 2.3.2.3 - Issues by Status and Severity

![image](https://github.com/user-attachments/assets/2b0e6250-e3ae-43b1-932b-0b959eaab8fa)

Monitor the current state of issues, segmented by their severity (Critical, High, Medium). Ensures critical issues are progressing.

💭 *Questions it may help answer:*
> How many critical issues are still unresolved?  

> Are severe issues progressing as expected through the workflow? 

> Are lower-severity issues getting stuck in the pipeline?  

#### 2.3.2.4 - Test Execution Progress By Iteration

![image](https://github.com/user-attachments/assets/c992b324-6835-49e7-8405-27c97af11db2)

Track how many tests are being executed manually versus semi-automatically over time. Helps identify automation opportunities.

💭 *Questions it may help answer:*
> How many tests are being run manually versus semi-automatically in each iteration?  

> Are we increasing automation over time, as planned? 

> Which iterations had the highest manual testing workload?  

#### 2.3.2.5 - Labels by Iteration

![image](https://github.com/user-attachments/assets/00dc3eba-ea54-4ff3-9010-9c41a4817ca3)

Analyze how different labels (e.g., "Bug", "Feedback", "Design Review") trend across iterations. Helps focus QA efforts on specific areas.

💭 *Questions it may help answer:*
> Which types of tasks (e.g., Bug fixes, Feedback, Design Reviews) are most frequent in each iteration?

> Are there specific categories (labels) that need more focus in upcoming iterations?  

> Is the distribution of labeled tasks consistent with the iteration's goals?  

#### 2.3.2.6 - Severity Distribution per Milestone

![image](https://github.com/user-attachments/assets/a96fa6ae-b4b1-4c2c-8276-2ab52751d64c)

Compare the severity of issues tied to different milestones. Ensures major milestones have fewer critical issues left unresolved.

💭 *Questions it may help answer:*
> Do major milestones still have unresolved critical or high-severity issues? 

> Are we leaving too many medium or low-severity issues unresolved for later milestones?  

> Are we effectively addressing severe issues before they cascade into later milestones?  

#### 2.3.2.7 - Issue Completion Rate by Iteration

![image](https://github.com/user-attachments/assets/d9da00c0-e0ac-4ffb-8b00-478dd96bac67)

Track how quickly issues are being completed over time. Ensures teams are keeping up with the planned iterations.

💭 *Questions it may help answer:*
> How quickly are issues being resolved in each iteration?  

> Are we keeping up with the planned iteration timeline?  

> Is there a trend of increasing or decreasing completion rates over time? 

#### 2.3.2.8 - Status by Assignees

![image](https://github.com/user-attachments/assets/e718ffe3-ec55-43e2-9b97-4c82f774be2b)

Monitor individual progress by tracking how many issues each team member has in different statuses (e.g., In Progress, Done, Blocked).

💭 *Questions it may help answer:*
> Who is regularly getting stuck in specific statuses (e.g., In Progress, Blocked)?  

> Who is completing the most issues (Done status)?  

> Are there patterns in status progression across assignees that need attention?

#### 2.3.2.9 - Priority by Severity

![image](https://github.com/user-attachments/assets/dbed29da-da29-4bb8-92f9-3a4a7f9ada12)

Highlight correlations between priority and severity. Ensures high-priority tasks align with high-severity issues.

💭 *Questions it may help answer:*
> Are the highest-priority issues aligned with the most severe problems? 

> Are there any misalignments where low-priority tasks have high severity or vice versa?  

> Are we focusing resources on the issues that are both high-priority and high-severity?

#### 2.3.2.10 - Issue Count by Iteration and Milestone

![image](https://github.com/user-attachments/assets/3e3d87a7-d092-4869-b4ad-05ef2b5fe16b)

Understand how issues are distributed across iterations and milestones. Helps identify bottlenecks or overburdened milestones.

💭 *Questions it may help answer:*
> How many issues are tied to each milestone, and are there bottlenecks? 

> Are iterations progressing as planned, or are certain milestones overloaded with tasks? 

> Are issues being distributed fairly across milestones and iterations?

#### 2.3.2.11 - Test Size Trend Over Time

![image](https://github.com/user-attachments/assets/aaa1c2e6-3ded-4b72-9ea5-32fa6733ce62)

See if the complexity of tests (size) is growing or decreasing over iterations, which can inform planning and resource allocation.

💭 *Questions it may help answer:*
> Is the overall complexity of tests increasing or decreasing as the project progresses?  

> Are we creating more small and manageable tests, or are larger, more complex tests dominating?  

> Do trends in test sizes align with project phases (e.g., simpler tests early, more complex tests later)?

---

# 3 - Strategy

---

The Introduction and tooling part of the document are more or less the transcription of weeks 1-4 of the project.

This part, named "strategy" will highlight all the QA activities performed and to be performed now that all the foundation for continuous improvement has been laid.

This part will therefore focus on weeks 5-7 of the project, which are the three final weeks.

## 3.1 - Testing Approaches

*Here the main test types identified, with an example for each of them for better understanding:*

### 3.1.1 - Integration Testing

*Ensures that individual components or modules of the software work together seamlessly as a combined system.*

<!-- <LINK to actual issue that does this> -->

<details>
<summary><ins>Example:</ins></summary><br/>

**Test Objective:**
 - Verify that entering a correct code into the puzzle lock displays a success screen and updates the game state to progress the narrative.

**Test Setup:**
 - Ensure the app is installed and running on a test device.
 - Have a valid puzzle code ready (one that is expected to unlock the puzzle).
 - Confirm that any required back-end services or scripts are operational and properly connected to the app.

**Test Steps:**
 - Launch the app and navigate to the puzzle lock screen.
 - Enter the known correct code into the lock’s input field.
 - Confirm that the app recognizes the code as correct and displays the success screen.
 - Observe the transition to the next segment of the narrative or the unlocking of a new level, as defined by the game’s logic.

**Expected Results:**
 - The success screen appears immediately after the correct code is entered.
 - The game’s narrative or progression updates accordingly, enabling access to the next puzzle, level, or story segment.

**Pass/Fail Criteria:**
 - **Pass:** The correct code input triggers the success screen and updates the game’s state, allowing the player to progress.
 - **Fail:** The app does not display the success screen, does not update the game state, or otherwise fails to respond correctly to the entered code.

</details>



### 3.1.2 - Functional Testing

*Checks that the software’s features operate according to the specified requirements, producing correct and expected results.*

<!-- <LINK to actual issue that does this> -->

<details>
<summary><ins>Example:</ins></summary><br/>

**Test Objective:**
 - Ensure that the hint system provides progressively revealing hints without skipping essential learning content.

**Test Setup:**
 - App running on a stable device environment.
 - A game scenario loaded where the player is stuck on a puzzle and the hint button is accessible.

**Test Steps:**
 - Interact with the puzzle without solving it to trigger the hint need.
 - Press the hint button and record the first hint displayed.
 - Press the hint button again and check that the second hint is more revealing than the first.
 - Press the hint button a final time and verify that the solution or a near-complete hint is provided without bypassing the educational explanation.

**Expected Results:**
 - The first hint provides a subtle nudge, the second is more direct, and the third is almost a full solution explanation.
 - No educational content is skipped—players understand why this is the solution, not just what the solution is.

**Pass/Fail Criteria:**
 - **Pass:** Hints appear in the correct order, maintain educational integrity, and help solve the puzzle.
 - **Fail:** Hints are not provided in order, are too vague or too revealing too soon, or skip the educational aspects entirely.

</details>

### 3.1.3 - Internal Playtesting

*Involves team members or internal stakeholders playing through the game to gather feedback on usability, enjoyment, and overall quality before external testing.*

<!-- <LINK to KONSTANTINOS' Feedback> -->

<details>
<summary><ins>Example:</ins></summary><br/>

**Test Objective:**
 - Gather qualitative feedback on game flow, narrative engagement, and educational clarity from the internal team.

**Test Setup:**
 - Invite 2-3 team members (not involved in direct feature development) to play through a selected portion of the game.
 - Provide them with physical cards and a testing device.

**Test Steps:**
 - Observe as the playtesters start from the game’s introduction and progress through the first puzzle-based scenario.
 - Take notes on points of confusion, level of difficulty, perceived educational value, and overall enjoyment.
 - After the session, interview the playtesters for their immediate reactions and suggestions.

**Expected Results:**
 - Playtesters can navigate the game without guidance.
 - They report that the educational content is understandable and integrated naturally into the gameplay.
 - Any confusion or frustration points are identified for future improvement.

**Pass/Fail Criteria:**
 - **Pass:** No major blockers; testers understand the educational aims and find the game enjoyable.
 - **Fail:** Testers frequently get stuck, misunderstand key concepts, or find the game unengaging.

</details>

### 3.1.4 - Regression Testing

*Retests previously verified functionality after updates or fixes to ensure that no new defects were introduced and previous issues remain resolved.*

<!-- <LINK to actual issue that does this> -->

<details>
<summary><ins>Example:</ins></summary><br/>

**Test Objective:**
 - Ensure that previously fixed bugs (e.g., puzzle timer glitches) have not reappeared after adding new features or updates.

**Test Setup:**
 - Have a bug tracking list with issues marked as resolved in a prior build.
 - Use the updated game build where new features have been integrated.

**Test Steps:**
 - Revisit the exact scenario where the bug previously occurred (e.g., start the puzzle and let the timer run down to zero).
 - Perform the actions that originally triggered the issue (inputting an incorrect code multiple times).
 - Verify that the previously observed error does not occur again.

**Expected Results:**
 - The bug does not reoccur.
 - All related functionalities still work correctly.

**Pass/Fail Criteria:**
 - **Pass:** No recurrence of the bug, and the affected functionalities remain stable.
 - **Fail:** The same or a similar bug reemerges or introduces new errors in related features.

</details>

### 3.1.5 - End-to-End Testing

*Validates the entire application workflow from start to finish, confirming that all integrated parts work correctly together to produce the intended user experience.*

<!-- <LINK to actual issue that does this> -->

<details>
<summary><ins>Example:</ins></summary><br/>

**Test Objective:**
 - Confirm that a player can start from the introduction, learn about climate change concepts, solve puzzles, use physical cards, progress through levels, and reach the end of the game with correct scoring and feedback.

**Test Setup:**
 - A complete build of the game that includes the intro, multiple puzzles, hint systems, and all final features.
 - A full set of physical cards.

**Test Steps:**
 - Start the game from the main menu and follow the narrative prompts.
 - Interact with physical cards as instructed, scanning them to unlock puzzles.
 - Use hints if needed and solve all required puzzles.
 - Reach the final level, complete it, and observe the final score and educational metrics.

**Expected Results:**
 - A seamless journey from start to end, with no blockers, missing content, or technical errors.
    The final scoring system accurately reflects player performance.

**Pass/Fail Criteria:**
 - **Pass:** The player can complete the entire game flow without issues, and the educational objectives are met at the conclusion.
 - **Fail:** Any major obstacle prevents progress, or essential educational content is missing or inaccessible.

</details>

### 3.1.6 - Usability and Accessibility Testing

*Evaluates the software’s ease of use and its ability to accommodate users with various abilities, ensuring that the interface, controls, and content are clear, navigable, and inclusive.*

<!-- <LINK to actual issue that does this> -->

<details>
<summary><ins>Example:</ins></summary><br/>

**Test Objective:**
 - Ensure the game remains understandable and navigable for players with color vision deficiencies by simulating various types of color blindness using the [Daltonize Me®](https://apps.apple.com/us/app/daltonize-me-camera/id936535542)Daltonize Me tool.

**Test Setup:**
 - Install and run the Daltonize Me app (or similar color-blindness simulation tool) on a device.
 - Launch the game on a test device and connect it to Daltonize Me so the tool can simulate different color blindness conditions.
 - Identify at least one game puzzle or UI element that relies heavily on color differentiation.

**Test Steps:**
 - Use Daltonize Me to simulate different types of color blindness (e.g., protanopia, deuteranopia, tritanopia).
 - Navigate the main menus while viewing through each simulated condition, noting if buttons, icons, and text remain distinguishable and usable.
 - Attempt to complete at least one puzzle that relies on color-coded elements while each color blindness simulation is active.
 - Confirm that alternative cues (e.g., shapes, patterns, labels, or audio hints) are present and sufficient for identifying crucial elements.
 - Document any elements that become indistinguishable under simulated color vision deficiencies.

**Expected Results:**
 - All critical UI components (e.g., buttons, indicators, text) remain visually discernible or have alternative identifiers such as patterns or labels.
 - Puzzles that rely on color have non-color-based cues that allow players under simulated color blindness conditions to proceed without confusion.

**Pass/Fail Criteria:**
 - **Pass:** Players can navigate menus and complete the color-dependent puzzle using alternative cues without confusion, even when simulating various color blindness conditions.
 - **Fail:** Key elements or puzzles become too difficult or impossible to interpret under color blindness simulations, indicating insufficient alternative cues.

</details>

### 3.1.7 - Performance Testing

*Measures how the application responds under normal and peak conditions, assessing speed, stability, and resource usage to ensure a smooth user experience.*

<!-- <LINK to actual issue that does this> -->

<details>
<summary><ins>Example:</ins></summary><br/>

**Test Objective:**
 - Validate that the game loads within acceptable time limits (e.g., under 5 seconds), runs smoothly on target devices, and maintains stable frame rates and memory usage.

**Test Setup:**
 - Use different target devices (various smartphone models) representing the minimum, recommended, and high-end specs.
 - Install performance monitoring tools to measure load times, CPU usage, and memory consumption.

**Test Steps:**
 - Launch the app and measure the time from tapping the icon to the main menu fully loading.
 - Start a new game, progress through at least one puzzle, and track frame rates, memory usage, and responsiveness.
 - Switch between different app features (e.g., puzzle screens, hint menu, inventory of scanned cards) and note any lag or slowdown.

**Expected Results:**
 - The app consistently loads within 5 seconds.
 - Gameplay remains responsive, with no noticeable frame drops or crashes.
 - Memory usage stays within acceptable limits, and device temperatures remain stable.

**Pass/Fail Criteria:**
 - **Pass:** All performance metrics meet or exceed the defined thresholds.
 - **Fail:** Excessive load times, frame rate drops, or unstable performance prevent a smooth player experience.

</details>

## 3.2 - Testing Schedule

### 3.2.1 - Week 5: Validation and Early Integration

| **Aspect** | **Details** |
|---|---|
| **Focus** | Complete integration of all components (physical cards, app features, educational content) and ensure they work seamlessly together. |
| **Key Activities** | Conduct integration testing to validate the interaction between physical cards and the app. |
| | Perform functional testing for all critical app features, including puzzles, hint systems, and timer functionality. |
| | Execute internal playtesting sessions to identify and resolve issues related to educational impact, game mechanics, and user engagement. |
| | Start regression testing for previously resolved issues to ensure no new bugs have been introduced. |
| **Deliverables** | Integration test report highlighting key findings and resolutions. |
| | Updated bug tracker with priorities for Week 6. |

### 3.2.2 - Week 6: Release Preparation and Final QA

| **Aspect** | **Details** |
|---|---|
| **Focus** | Polish the product, finalize testing, and ensure the game is ready for release by the end of the week. |
| **Key Activities** | Perform end-to-end testing to validate the entire gameplay experience, simulating a player journey from start to finish. |
| | Conduct usability and accessibility testing to ensure the game is intuitive and meets the needs of diverse users. |
| | Execute performance testing to confirm app loading times, compatibility across devices, and smooth operation. |
| | Validate success criteria, including educational impact, engagement metrics, and alignment with the theme. |
| | Prepare the release build, addressing all critical and high-severity bugs. |
| | Conduct a final playtesting session with external testers to gather release-critical feedback. |
| **Deliverables** | Release-ready build of the game, with all known issues documented. |
| | Comprehensive QA report summarizing testing results and addressed issues. |

### 3.2.3 - Week 7: Presentation and Demo Preparation

| **Aspect** | **Details** |
|---|---|
| **Focus** | Create an engaging presentation and polish the game for a seamless live demo. |
| **Key Activities** | Develop presentation materials, including slides that outline the project’s goals, challenges, and achievements. |
| | Conduct oral training sessions to ensure team members are confident and articulate during the presentation. |
| | Add cosmetic enhancements to the game, such as improved visuals, animations, and sound effects, to make the demo more engaging. |
| | Perform dry runs of the live demo to identify and address potential technical or narrative issues. |
| **Deliverables** | Finalized presentation slides and talking points if necessary. |
| | Polished game demo build with added cosmetic enhancements. |
| | Rehearsal feedback and adjustments for a smooth live demo. |
