# Overview

I've added some comments throughout the code when I felt like my implementation was inadequate (due to time constraints) or incomplete or to explain my thinking. One major hurdle I had was connecting to the specified DB at https://wheels-db.firebaseio.com/onboarding/applicants.json. I was continuously getting the error, permission denied. I don't have access to that database or I could've fixed the issue. To overcome the issue, I created my own database at https://samplewheels.firebaseio.com and have commmit in a separate branch.

The only 3rd-party framework I've used is SHSPhoneComponent for formatting a phone number. (Ofcourse, other than Firebase).

There will be many unused methods that are in the project, which are just boilerplate or part of the design pattern that I'm implementing. Also, there was some confusion regarding whether I should save the profile picture in the database or not since there wasn't a specified field name for it. One option could be to store in a storage bucket, another option which I've partinally implemented is to store it as a base64 string.

# Architecture

The app architecture can be called an MVVMC, Model-View-ViewModel-Coordinator architecture. The different layers used in the application are the Coordinators, Services, View Controllers, Helpers, Views and Models. The AppDelegate calls the AppCoordinator and then child coordinators which are instantiated in a tree-like fashion. Coordinators perform many of the functions that ViewControllers traditionally perform in an MVC architecture. This frees VCs to only focus on handling setting up and displaying views.  In this app, coordinators handle navigation and communication with remoteDataService. (One exception is handling the modal camera VC, this I haven't removed from the VC).

The app uses storyboards but more as a container for multiple NIBs which are inter-related. Navigation is handled by the coordinators and segues aren't used in the storyboard. Coordinators & VCs are connected via a delegate pattern to avoid high cohesion and retain cycles.

# Sign Up Form View Controller

Because the complexity of each UserProfile field didn't seem too much, I used a stack view to arrange them. In retrospect, a tableview might have been cleaner. I've added validation for each of the fields, currently that logic is inside the VC but elsewhere is probably a better place.

For the email & phone number fields, the screen moves up to accomodate the keyboard. This should be dynamic in terms of the distance, animation and if the screen even needs to move up if the field is still visible with keyboard presented.

Once a user clicks on submit and all the fields are validated, then a UserProfile object is created and sent to the coordinator.

# Sign Up Camera View Controller

This view controller is mostly pretty simple, it also handles the case of not having access to the camera in case of the simulator. The image isn't being saved in the database because I was unclear if this was part of the requirements.

# Sign Up Review View Controller

I used a tableview controller with 2 prototype cells for the text fields and the profile picture. Saving values should work but populating the data with results from the database isn't set up, though it is mimicked.
