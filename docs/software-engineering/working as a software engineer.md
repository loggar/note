# Working as a Software Engineer

## Good Industry Code

Good industry code has the following properties, in that order:

- **Readable**, because code is read and maintained more often than it is written. The intent of the code must be clear to other developers years after you’ve written it.
- **Defensive**, as in following best practices of defensive coding. Defensive coding is a topic all on its own, but the gist of it is: You have to ensure that improper use of classes and methods you’ve written won’t lead to your code crashing the software.
- **Optimized**, which is last on this list because most of the time, you won’t really need to worry about it. That doesn’t mean you should write bad code that does something in O(n³) when a linear solution exists. But developers are generally eager to try and over-optimize when there’s no need for it, often at the detriment of the readability and defensibility of the code. You should always be able to prove that a certain optimization that sacrifices those properties is actually needed.

## You Won’t be Doing Much Coding

It may come as a surprise, but most of the time you won’t be writing new code, but instead, you’ll be:

- Debugging
- Reading existing code
- In meetings or writing emails
- Researching what to do so you don’t write code

## Debugging and Reading Code

- **You’ll need a lot more than debugging using print statements.** All widely-used languages and tech stacks have a variety of powerful tools. Learn to use them as they’ll make debugging a breeze and save you countless hours.
- **Understand the code base.** Most tech stacks have some sort of code graph generation tools that will help you understand the structure of the code base. Enterprise IDEs generally have that functionality built in. You can also explore the code using tools such as ReSharper, grep or Sourcegraph.
- **Understand the product.** You’ll be surprised how many developers don’t know how the software is supposed to work before they try to “fix” it. Just read the documentation.

## Organize Your Thoughts

Since a lot of your time will be spent in communication, research and multi-tasking, you need some tools to help keep everything in order.

- **TODO lists / Tasking:** Your company should already have tasking software of some kind, but it helps to have a personal system as well. Use post-it notes or software like Trello or Todoist.
- **Notes:** Always take notes in meetings, work to improve existing documentation and create a personal knowledge base. Use Evernote, OneNote, or a notebook, like in the olden days. It might seem like overkill, but you’ll be thanking yourself a year later when you’re revisiting that obscure build process which took you 3 days to figure out the first time. I’ve never met a good Software Engineer who didn’t take extensive notes.
- **Charts/Visualizations:** Humans are visual creatures and creating charts of processes and architectures will help you and others understand complex topics. Diagrams are particularly useful when communicating with non-technical colleagues. Use Lucidchart, Visio or a plain whiteboard.

## Know When to Use Libraries

Short answer: Almost all the time.

Long answer: 99% of the time, you shouldn’t reinvent the wheel. In most Software Engineering positions, implementing a particular kind of sort is a complete waste of time. That doesn’t mean you shouldn’t know how the algorithms and data structures you use work, since that will help you decide what to use and when.

In order to be an efficient Software Engineer, you need to understand the libraries that you have at your disposal. The standard libraries of most popular languages are extremely useful and are larger than what you’d expect. In addition, the code base might also utilize additional, specialized libraries. Read their documentation and know when to use them.

You should also not be afraid to suggest additional libraries if they will save time. However, you need to ensure that you pick a good library for industry use. A good library is:

- **Open source**, so you can verify the quality of code yourself and potentially fix bugs that are critical to your application.
- **Licensed under a permissive license such as MIT and BS**D, so your company doesn’t run into any issues by using it. Be careful with GPL, lest you open source your entire code base by accident.
- **Mature**, i.e. it has been out for some time and has a rich set of features.
- **Maintained**, with new releases coming out often.
- **Used by other companies or projects**, which acts as a stamp of approval and ensures it has industry support for continued maintenance.

# Continuous Improvement

In addition to learning the skills that will make you better at your day-to-day job, you’ll also need to continuously improve your skills and learn new ones, in order to create new career opportunities for yourself.

The opportunities to learn are many and a lot of them are quite affordable:

- **Online Courses:** The opportunity to learn from the best professors in the field in a flexible format shouldn’t be missed. Check out Coursera, Udacity, and edX (among many) for courses that can supplement your existing skills.
- **Online Master’s Degrees:** A recent trend among top-ranked universities, online Master’s Degrees are a flexible way to continue your formal education. They are also generally less expensive thank on-campus degrees, with most programs costing ~$10,000 for the entire degree. Georgia Tech, UT, and UC San Diego are some of the universities offering such degrees. I personally recommend Georgia Tech’s Online Master’s which I graduated from this year.
- **Blogs:** Blogs are an important part of the developer community (no surprise here, as you’re reading one right now). Blogs such as Coding Horror, Joel on Software, or even more humorous websites such as The Daily WTF can give you a good idea of what and what not to do as a Software Engineer. Browsing Medium, r/programming, HackerNews or other feeds will also lead you to good articles and blogs.
- **Conferences:** Last, but not least, conferences are an amazing learning opportunity and you should definitely take advantage of your company’s training budget by going to them. A very incomplete list of good conferences to check out (alongside their topic): GOTO; (General), Strange Loop (General), PyCon (Python), CPPCon (C++), DEF CON (Security), Fluent (Web dev). All of these also have videos of (most) talks on YouTube so you will be able to learn something even if you can’t attend!