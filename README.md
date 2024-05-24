## Project Purpose
The primary goal of this project is to understand and implement the VIPER (View-Interactor-Presenter-Entity-Router) design pattern. Through this project, the following objectives are targeted:
- Learn the VIPER design pattern: Understand the core principles and how to apply them effectively in a Swift-based iOS application.
- Unit Testing: Demonstrate how to unit test the VIPER modules.
- Snapshot Testing: Show how to implement snapshot tests to verify the UI appearance.

### Features

- Fetch random Todos from `https://jsonplaceholder.typicode.com/todos`.
- Display Todos in a list, sortable by alphabetical and numerical order.
- Unit testing for VIPER modules.
- Snapshot testing for UI validation.

### App Flow

<img src="https://github.com/hakanor/Swift-VIPER/assets/52280308/1607c94a-05ce-4b25-9b1a-9aa40a7ccefc" alt="coordinator_flow" style="width: 85%; height: auto">

### VIPER Architecture

- **View**: Displays what it is told to by the Presenter and relays user input back to the Presenter.
- **Interactor**: Contains the business logic as specified by a use case.
- **Presenter**: Contains view logic for preparing content for display (by the View) and for reacting to user input (by informing the Interactor).
- **Entity**: Contains basic model objects used by the Interactor.
- **Router**: Contains navigation logic for describing which screens are shown in which order.

### API Reference

- [JSONPlaceholder - Todos](https://jsonplaceholder.typicode.com/todos)
