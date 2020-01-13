# Quran Flutter
 Quran made with Flutter

If you want to contribute, fill [it up](https://sadmansamee.typeform.com/to/Df9lQG), see [design](docs/design/design.md) then refer to [Trello board](https://trello.com/b/JKZ9ZyGI/quran) for planning and task list and

![](docs/plan/quran.png)
 
## Why this project is important? 

[Ayat](https://quran.ksu.edu.sa/ayat/?l=en) is a Quran project from King Saud University, it has the following platforms: iOS, Android, Mac, Windows, Web, Linux. so users have a similar experience on all the platforms, but unfortunately, this project is deprecated.

The reason that is important 

1. Those who memorize Quran wants to have similar actual Mushaf experience, as an example [Quran for Android](https://play.google.com/store/apps/details?id=com.quran.labs.androidquran&hl=en) or [Quran for iOS](https://apps.apple.com/us/app/quran-by-quran-com-%D9%82%D8%B1%D8%A2%D9%86/id1118663303) have different highly modified Quran image than actual Madina mushaf which is crucial for a memorizer to have similar look and feel for visual memorization purpose, or other alternatives aren't available across the platforms. 
2. A person might want to switch platforms and revise their Quran reading on another platform.
3. All the current projects are different in their own ways and have different codebase thus keep maintaining and adding new features is difficult.
4. After deprecating of Ayat there is no similar solution that works well on all the platforms with similar experience.


My proposal: Develop a Quran project with [Flutter](https://flutter.dev/), with Flutter it is possible to have a single codebase for all the platforms with similar experience while having single Codebase will make it easier to maintain and keep developing. I'm looking for more contributors.  

## Contribution Guide lines

* Go to [Trello board](https://trello.com/b/JKZ9ZyGI/quran) and have a look on tasks list
* Assign youself a task that you think are appropiate to do
* Clone this repo and create branch from **dev** branch and branch name should be same as task name/ID
* After completing task create pull request to merge with ***dev*** branch.


## Coding guide lines

* This project uses [Flutter Bloc](https://bloclibrary.dev) as state management, every single feature must follow this state managemnt.
* [SOLID principals](https://medium.com/flutter-community/s-o-l-i-d-the-first-5-principles-of-object-oriented-design-with-dart-f31d62135b7e) must not be broken.
* For project and coding structure, styles first go through this repo's codes first, your coding styles and structure has to be matched with this project's coding styles and structures.
* Any kind of anti-patterns must not be implemented or design pattern must not be broken.
