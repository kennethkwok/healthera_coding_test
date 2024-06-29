# healthera_coding_test

###### Task - Use following given data and merge the response into another array of objects
Adherences / Remedies

The app presents a list of adherences grouped by remedy ID.

###### Summary of architecture + decisions
- Bloc for business logic and updating UI state
- GetIt for service locator
- Retrofit for networking layer

Basic unit tests have been added to cover Bloc and repository layers, however full extensive tests such as widget / integration tests were not written owing to time constraints.