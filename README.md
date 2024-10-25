# CSEN268 - Assignment 3
## Summary
This is my submission for Assignment 3, where I've recreated the Book Club App as shown in Figma (https://www.figma.com/design/wcYRRRfWaIBVJa26BAqnqg/HW3---Instructions?node-id=0-1&node-type=canvas&t=tWPyq4G8WkuLpQJY-0). The app's main page consists of a horizontally scrollable list of books, sorted alphabetically by author name. There are two filters above this list: one for sorting by author and the other for sorting by title. Additionally, when a book is clicked on, a page with its details is shown, which also has a back button to redirect back to the list view.

## Cloning the Repository
The repository is public, and can be obtained through:
```
git clone https://github.com/madsysharma/CSEN268-Assignment3.git
```

## Getting Started
First, the following packages need to be installed: flutter_lorem, flutter_bloc and equatable. The command for doing so is:

```
flutter pub add <package_name>
```

Then run the following command to update packages:
```
flutter pub upgrade --major-versions
```

Additionally, the bloc extension needs to be installed in VSCode. 
In case there's any mismatch with the gradle version installed on your system, go to android/gradle/wrapper/gradle-wrapper.properties and change the version accordingly in the following line:

```
distributionUrl=https\://services.gradle.org/distributions/gradle-8.3-all.zip
```
The images used to represent the book covers are located in the assets subdirectory of the root folder, and are accounted for in the pubspec.yaml file under the assets section.

It is recommended to start the Android emulator with cold boot, and then run the main.dart file.

## About the Application
### Classes Used
The lists for book titles, authors and cover images are initialized in lib/services/mock.dart. 
The two widgets created and used extensively in this application include BookCard (which is just a simple card displaying only the book cover) and CustomAppBar (which changes according to which screen you're in. For example, the book list screen's app bar consists of a menu as the leading item and the user account/profile as the trailing item, whereas the book details screen has a back button as the leading item instead since we have to go back to the list screen from there).
In the folder lib/models, a Book class is used to keep track of a book's information (title, author, description - which is generated with the flutter_lorem package - and image URL).
To conveniently manage application states, the Bloc design pattern is used, as seen in the lib/pages/bloc subdirectory. The main events being tracked are SortAuthorEvent, SortTitleEvent and SelectBookEvent (corresponding to sorting the book list by author, sorting by title and selecting a book to see its details respectively). There are four states the application can be in, which are BookAppAuthor, BookAppTitle, BookAppWaiting and BookAppDetails (which correspond to displaying the sorted book list by author, displaying the sorted list by title, a circular progress indicator being shown while the data is being sorted & loaded, and displaying the details of a selected book).
The two main screens are Book List and Book Details, and routing is done through Material Page Route.
