# Create different BLoCs

A new Flutter project.

## Getting Started

This project is a counter project using BlocBuilder & BlocListener & BlocConsumer

In "bloc_builder_listener_view" file, I used BlocBuilder & BlocListener

## Widgets Used:
  - Scaffold
      - AppBar to add title and a button to toggle app theme
      - body
          - Column to put widgets vertically
              - Row to put widgets horizontally
                  - GlobalButton to add " + " and " - " buttons and create "CounterIncrement" & "CounterDecrement" events
                  - BlocListener to view a message in a SnackBar when counter value reaches 10
                      - BlocBuilder to view the new counter value if it changes
                          - CounterValueText to view the counter value
              - GlobalButton to go to the next page and connect it with "CounterBloc" using BlocProvider

The second page which exists in "bloc_consumer_view" file uses BlocConsumer

## Widgets Used:
  - Scaffold
      - AppBar to show the title of the page
      - body
          - Center to centeralize widgets
              - Row to put widgets horizontally
                  - GlobalButton to add " + " and " - " buttons
                  - BlocConsumer to view a message in a SnackBar when counter value reaches 10 and view the new counter value if it changes
                      - CounterValueText to view the counter value
                        
## Note that
- In "counter_bloc" file, the logic of increment and decrement exists by emitting states in certain events
- In "counter_state" file, all the states needed exist
- In "counter_event" file, "CounterIncrement" & "CounterDecrement" events are added
- In "theme_bloc" file, toggle theme logic is added by emitting states in "ToggleMode" event
- In "theme_state" file, dark and light states are added
- In "theme_event" file, "ToggleMode" event is added
- In "main" file, I used BlocProvider to connect the counter page with "CounterBloc" and connect the whole app to "ThemeBloc"
- In "main" file, light and dark themes are defined from "theme.dart" file
- In "main" file, a BlocBuilder is used to toggle the whole app theme when theme state changes
