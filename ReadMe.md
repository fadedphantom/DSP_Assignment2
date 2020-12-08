# Assignment 2
Voto Voting Application

# Problem

The purpose of this project is to design and implement **VoTo**, a __voting exercise__ tool for organisations. A voting exercise could be about individuals within an organisation vying for an elected position, or a measure (e.g., regulation) being considered or both. It should have a ballot description (candidates and position or measures or both), the profile of a legitimate voter, the voting period and the deadline for the result/outcome.

Members of an organisation that can take part in a voting exercise must be registered voters. All information about registered voters should be persisted in the system. If need be (e.g., new members joining the organisation), a voter registration campaign could be organised prior to the starting date of the voting exercise.

During the voting exercise, all cast ballots are verified against the voter registration file. All fraudulent ballots are kept in a temporary store called **rejects**, with an explanation for the rejection. Once the deadline is reached no more ballot can be cast, and the computation of the results begins. We expect the computation to be smart enough to project a winner whenever possible even though all the ballots have not been tallied yet. If the results of the voting exercise are disputeed, each individual ballot (including the rejects) is scrutinised and the computation run anew. If not, the voting exercise is archived with the results and the rejects. The archive could then be consulted at a later stage for various reasons (e.g., understanding the voting trends within the organisation).

Your task is to:
1. design **VoTo** following a micro-service architectural style (You will justify your problem decomposition into services);
2. design and implement an API gateway using graphql as your API query language;
3. deploy and configure Kafka for all communication in the system (services and API gateway);
4. deploy the services using containerisation and orchestration (Docker and Kubernetes).