# **Untitled Kingdom - iOS Recruitment Task**

# Intro

During your holiday, some significant client contacted us to do a project for him. He wanted a simple MVP for now, **but with a plan to grow**. Because there were no experienced developer available, Project Manager decided to start writing the app with a trainee — the results of their work you can find in this repository.

Now you are back, and asked to continue this project. Because the client is aware of the implementation state, he gives the green light to refactor the entire project. As he said at the beginning, the app will grow, so the base for it should be reliable.

Can you save this project? 💪

# Base rules

- **We expect the complete and consistent solution**

- When refactoring, please **keep the way how the app looks like from the user perspective** (excluding the changes we will ask you to do).

- All solutions that are present here are the result of the trainee work, no hidden motive here ;) **You can move any part you want, create new classes, change architecture, install libraries, etc.**

- So far, we are using the hardcoded JSON files instead of server responses. We want to keep it that way for now, but having in mind that it can change in the future.

- We want to **keep the 2 seconds delay for the requests** - to simulate slow connection problems :)

- Keeping a clean Git history will be additionally scored.

# Tasks

To wrap things up, what we want you to do is:

- **Refactor** - it's up to you how much you want to change. The project should be easy to maintain and develop.

- **Bugfixes:**

    - Details view is changing its background color after a small delay. The client wants it to be correct immediately when a user enters that screen

    - Details view should have a title displayed on the navigation bar. It should have a specific format: **the characters at the odd indexes should be lowercased, others - uppercased**. Examples: `ItEm123`, `My bEaTiFuL_ItEm`, etc.

    - The list and details views has 2 navigation bars visible at the same time. We want it to be a single one. The back button on the tab bar level should move user back to the initial screen. Tapping back on the details should move user to the tab bar level (list or collection).

    - Details view is always presenting the data for `ID == "1"`, no matter what did user selected

    - It seems that `TableViewController` is not deallocating after going back to the `StartViewController`


- **New features:**

    - We want another tab in the Tab Bar Controller, which displays the same data as on the `TableViewController`, but using `UICollectionView`. The screen should present the tiles with a proper background color and the item name centered in the cell. We want it to present 2 square tiles at the row.

    - The `TableViewController` should display the preview underneath the title. Ideally, the cell height should be adjusted to its content.

- **Tests:**

    - Please cover the networking layer with a unit tests (currently placed in `NetworkingManager`)
    - Please cover with tests some business logic classes too. No need to for 100% coverage in the project, but in the chosen classes, you should try to test possible scenarios.


# Good luck! 💪
