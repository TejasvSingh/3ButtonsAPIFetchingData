ButtonFetchingData iOS App


Overview
ButtonFetchingData is an iOS app built in Swift using UIKit, demonstrating data fetching from APIs and displaying it in a structured way across multiple screens. The app uses the MVVM (Model-View-ViewModel) architecture and asynchronous networking to fetch users, cryptocurrency data, and people data.
The app consists of three main screens accessible via buttons:
1. Users Screen – Fetches and displays a list of users.
2. Crypto Screen – Fetches and displays cryptocurrency prices for Bitcoin and Ethereum.
3. People Screen – Fetches and displays a list of people.

Features
* Button-based Navigation between screens
* Network Layer to fetch data asynchronously from APIs
* MVVM Architecture for clear separation of concerns
* Dynamic UI with UITableView and custom cells
* Async/Await usage for modern Swift networking
* Safe decoding using Codable

Project Structure
1. Network Layer
* UsersNetworkManagerProtocol & UsersNetworkManager Handles all network requests:
    * getUsersDataFromServer(url:) -> [Users]
    * getCurrencyDataFromServer(url:) -> CryptoModel?
    * getPeopleDataFromServer(url:) -> [People]

2. ViewModels
Implements MVVM for each screen:
Users
* UsersViewModelProtocol and UsersViewModel
    * Fetches users data from the server
    * Provides number of users and access to each user
Crypto
* CryptoViewModelProtocol and CryptoViewModel
    * Fetches cryptocurrency prices asynchronously
    * Stores and provides access to the data
People
* PeopleViewModelProtocol and PeopleViewModel
    * Fetches people data from the server
    * Provides number of people and access to each person

3. Views / ViewControllers
Buttons Screen
* ButtonsVC – Main screen with three buttons:
    * Users Screen
    * Crypto Screen
    * People Screen
Users Screen
* UsersView
    * TableView displaying users
    * Uses UsersVCTableViewCell for custom cell layout
    * Binds data from UsersViewModel
Crypto Screen
* CryptoVC
    * Displays Bitcoin and Ethereum prices
    * Uses CryptoViewModel to fetch data
    * Updates UI asynchronously
People Screen
* PeopleVC
    * TableView displaying people
    * Uses PeopleVCTableViewCell for custom cell layout
    * Binds data from PeopleViewModel

4. Custom TableView Cells
* UsersVCTableViewCell – Displays user title and body
* PeopleVCTableViewCell – Displays person name and username

Dependencies
* UIKit – For building the UI
* Foundation – Networking and Codable decoding
* No external pods or packages required


Architecture

ButtonsVC
 ├─ UsersView -> UsersViewModel -> UsersNetworkManager -> Users API
 ├─ CryptoVC -> CryptoViewModel -> UsersNetworkManager -> Crypto API
 └─ PeopleVC -> PeopleViewModel -> UsersNetworkManager -> People API
* MVVM ensures that the ViewControllers handle only UI logic.
* The NetworkManager handles all API calls, making the app modular and testable.
* Async/Await is used for network calls to prevent blocking the main thread.

Notes
* The app currently prints debug messages for data fetching (print("checking this message")).
* TableView cells use auto layout and dynamic row heights.
* Labels are styled with system fonts and colors.
* Each ViewModel can be easily tested independently using a mock service.
