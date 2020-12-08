Assignment
================

* Course Title: __Distributed Systems Programming__
* Course Code: **DSP620S**
* Assessment: Second Assignment
* Released on: 24/11/2020
* Due Date: 17/12/2020

# Problem

The purpose of this project is to design and implement **VoTo**, a __voting exercise__ tool for organisations. A voting exercise could be about individuals within an organisation vying for an elected position, or a measure (e.g., regulation) being considered or both. It should have a ballot description (candidates and position or measures or both), the profile of a legitimate voter, the voting period and the deadline for the result/outcome.

Members of an organisation that can take part in a voting exercise must be registered voters. All information about registered voters should be persisted in the system. If need be (e.g., new members joining the organisation), a voter registration campaign could be organised prior to the starting date of the voting exercise.

During the voting exercise, all cast ballots are verified against the voter registration file. All fraudulent ballots are kept in a temporary store called **rejects**, with an explanation for the rejection. Once the deadline is reached no more ballot can be cast, and the computation of the results begins. We expect the computation to be smart enough to project a winner whenever possible even though all the ballots have not been tallied yet. If the results of the voting exercise are disputeed, each individual ballot (including the rejects) is scrutinised and the computation run anew. If not, the voting exercise is archived with the results and the rejects. The archive could then be consulted at a later stage for various reasons (e.g., understanding the voting trends within the organisation).

Your task is to:
1. design **VoTo** following a micro-service architectural style (You will justify your problem decomposition into services);
2. design and implement an API gateway using graphql as your API query language;
3. deploy and configure Kafka for all communication in the system (services and API gateway);
4. deploy the services using containerisation and orchestration (Docker and Kubernetes).


# Submission Instructions

* This assignment is to be completed by groups of *at most* four (04) students each.
* For each group, a repository should be created either on [Github](https://github.com) or [Gitlab](https://about.gitlab.com). The URL of the repositiory should be communicated by Friday, December 04 2020, with all group members (student number, name and mode of study) set up as contributors.
* The submission date is Thursday, December 17 2020, midnight. Please note that *commits* after that deadline will not be accepted. Therefore, a submission will be assessed based on the clone of the repository at the deadline.
* Any group that fails to submit on time will be awarded the mark 0.
* Although this is a group project, each member will receive a mark that reflects his/her contribution to the project. More particularly, if a student's username does not appear in the commit log of the group repository, that student will be assumed not to have contributed to the project and thus be awarded the mark 0.
* Each group is expected to present its project after the submission deadline.
* There should be no assumption about the execution environment of your code. It could be run using a specific framework or on the command line.
* In the case of plagiarism (groups copying from each other or submissions copied from the Internet), all submissions involved will be awarded the mark 0, and each student will receive a warning.

# Evaluation criteria

The following criteria will be followed to assess each submission

* Problem decomposition into services
* API gateway design and implementation with graphql integration
* Implementation of the services and their deployment with containerisation and orchestration
