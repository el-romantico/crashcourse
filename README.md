# CrashCourse

[![Build Status](https://travis-ci.org/s2gatev/crashcourse.svg)](https://travis-ci.org/s2gatev/crashcourse)

Courses for the people.

## Idea
The main idea behind **CrashCourse** is the hypothesis that people want different courses on different locations at different time. The goal of the project is to connect the needs of the people that want to learn a specific topic with an appropriate "lector" that can organize a course on that topic in the specific location.

## Prerequisites
* Ruby 2.1
* Rails 4.1
* ImageMagick
* Elasticsearch

## Deployment (on OS X)
Execute the following commands in a shell:
```
elasticsearch # starts the elasticsearch service
bundle        # installs the dependencies
rake l        # creates the database, populates it and lifts the application
```

