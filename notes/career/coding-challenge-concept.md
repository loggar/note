# How to tackle a coding challenge

ref) https://www.codementor.io/npostolovski/9-essential-tips-on-how-to-tackle-a-coding-challenge-argfuyqz9

## Read the instructions very carefully

Most coding challenges will be accompanied by written instructions. Slow down and carefully read through these instructions several times to make sure you understand them. It'd be a shame to write great code but solve the wrong challenge or miss a key requirement because you rushed through the instructions. Even if you feel like you've solved the problem before, or know the exact algorithm required to do so, this particular challenge may have some subtle but important differences.

It can be useful to rewrite the instructions as a to-do list for how you will meet each requirement of the coding challenge. This not only ensures you've understood and are meeting the requirements, but will provide a useful road-map as you work on each piece of the challenge.

## Sketch out a plan

It's easy to leap straight into a coding challenge and make things up as you go along. However, a bit of time spent sketching out the main pieces of your program and how they will fit together can help you spot issues sooner, or avoid coding yourself into a corner. Your program will most likely deviate from this initial outline, but working through a prospective architecture for your app upfront can help save time and lead to a better overall solution.

## Make it simple to run and include a great Readme

I've seen many applicants disadvantaged because their program isn't straight-forward to run or they haven't provided good documentation to go along with it. A good reviewer will spend some time trying to get your program to run even without supplied documentation, even if it doesn't work the first time. But they will only spend so long, and each extra minute spent debugging will lead to frustration that may be the difference between a positive and negative review. You need to ensure that whoever reviews your code will have a smooth experience getting it running.

You shouldn't assume that the person reviewing your code challenge will have the same languages and libraries installed on their machine as is required by your solution, let alone the same versions of them. You should assume that the person reviewing your code could be using a different operating system, may have none of the dependencies installed, and will be accessing your program via their text editor or IDE of choice, whether that's Emacs or Eclipse.

For this reason, make sure to organize your program in a way that adheres to conventions for projects in your language of choice. Secondly, include a simple Readme that outlines all of the dependencies required to run your program, and their versions. Write the installation steps as if they're being completed on a machine with nothing previously installed. It will take a little bit more time, but whoever is reviewing your code will appreciate it.

Coding challenges can be tough, and you may also have a limited time-frame in which to complete the challenge. You may feel like there are flaws in your solution, or things you didn't get to. A Readme is a great place to acknowledge these and explain what you would like to have done differently. Acknowledging flaws in your design shows maturity, and that you care about code quality.

## Drive out your solution with tests

If test-driven development or automated tests were mentioned in the job ad for the position you're applying for, this almost guarantees that some level of testing will be expected in your solution.

If you've never done test-driven development, now would be a good time to pause work on your coding challenge and brush up on your unit testing skills. While failing to write test for your coding challenge may not disqualify you for a role out of hand, testing will almost always be viewed positively by your reviewer. The presence and quality of tests wrapped around a solution is often the deciding factor in whether to progress a candidate.

If you're under a tight deadline with your coding challenge, it may feel like you don't have time to write tests. Or you might think that you can solve the challenge and then tests later if you have the time. I would argue that though tests might mean you go a little slower at first, they'll lead to a better, more robust solution and help avoid painting yourself into a corner further down the track.

## Focus on the test input, then handle edge cases (exceptional cases)

Most coding challenges will come with test input to verify that the solution works. However, this test input rarely covers all possible edge cases. How does your app react when the value passed in doesn't match the format of the test input, or is null? The ideal solution will handle not only the test input, but also gracefully handle edge cases.

That being said, I've seen developers spend so long on handling potential edge cases that their solution fails to robustly handle the test input. This choice might be driven by a fear that these edge cases are hidden gotchas that, if not properly handled, will be used to invalidate the solution. Usually this isn't the case. Instead, edge cases should be seen as an opportunity to gain bonus points if you handle them correctly. They shouldn't come at the expense of handing the provided test input. Write a great solution for the given test input, then handle edge cases afterward, if you have the time.

## Make it readable

The code for your solution is going to be read by another software developer, out of context, most likely without you there to explain your code and your choices. For this reason it is crucial that your code is easy to read and follow. Here are some tips that will make it easier for your reviewer to understand exactly what your code is doing, and why:

* **Take care when naming classes, methods/functions, and variables.** Names are like documentation: they should describe what the thing does, or what it represents. For this reason, avoid single letter variable names. Choose a name that reminds the reader what is stored inside the variable.
* **Break it down.** Would you rather read a short paragraph made up of clear, concise sentences, or a wall of text full of dense sentences that seem to lead nowhere? Long and complex methods are like that wall of text you never want to read. Instead, break things up into smaller steps that combine to make a whole. The extra method refactoring technique is a powerful way to do this.
* **Use comments sparingly.** In an effort to make their program easy to understand. applicants often fill their coding challenges with comments. Sometimes there are more comments than code! While it's great to see an applicant trying to help the reviewer to understand the program, code that is easy to understand is always better than a comment. When you feel the urge to write a comment, stop to think, could I write this in such a clear way that a comment isn't even needed? If not, could you turn the comment into a well-chosen name for a class, method/function, or a variable so that it is self-documenting rather than needing an explanatory comment?
* **Be wary of code golf.** You're itching to compress your solution's central algorithm into a neat on-liner that would make even a veteran code-golfer nod with approval. Unfortunately. code cleverness and readability often have an inverse relationship. If your reviewer doesn't understand what your clever on-liner is doing, then its cleverness will be lost on them, and they'll be left confused.
* **Keep your main method as high level as possible.** In most cases, your solution will do its work by calling one final function or method that brings everything together. In Java, this is usually the 'main' method. This central method that ties everything together should be as high level as possible, meaning, it should not be doing any of the heavy lifting in your app. Instead, it should delegate out to the other pieces of your app designed to complete each step of the process. If your main method is longer than about 20 lines, it might be assuming responsibilities that belong elsewhere in your application.

## Follow the programing style of your language

It may sound obvious, but if you choose an object-oriented language, you should make sure to write object-oriented code. If you choose a function language, you should write code in a functional style. If you're not sure what the appropriate style is for your language, take some time to research it before you tackle your coding challenge.

If you're completing your challenge in an object-oriented language like Python or Ruby, the reviewer will want to see how you approach your solution in an OO way. For example, dew coding challenges will be small enough that you can write a good OO solution without at least four classes, and possibly more. They'll also want to see the single responsibility principle in action: the idea that each class in your application should have one job.

Many coding challenges include the following stages: parsing input, processing the input, and presenting output. Each of these stages will require at least one class to perform each job. The 'processing' stage may require several classes to handle the varying jobs involved in producing the output.

## It is OK to get help

Many coding challenges will hinge on a central algorithm common in computer science, for example, some variation of the knapsack problem. It's OK to research possible algorithms as you work on your coding challenge and choose the most appropriate one. What you definitely don't want to do is copy an algorithm that works but you don't understand. Instead, understand how the algorithm works, then implement it yourself.

If you need to bounce ideas off another developer, Code-mentor can help. While it would be cheating to get another developer to work on your solution, there is nothing wrong with discussing possible approaches with someone else. If you do get hired, this is something you'll be doing every day as a working developer.

## Carefully review and refactor your solution

Your coding challenge is finally finished. After hours or even days of grueling concentration, it might b extremely tempting to close your IDE, zip up your code, and mail it to your recruiter just to get it all over and done with, Resist the urge. Instead, take the time to refactor your solution, check it carefully for error, and go over the Readme again. A silly mistake left in your code like a redundant variable assignment or unused method or function can make the reviewer feel like you either don't understand how programming works, or you don't care about your code. Don't let any of these silly mistakes make it into your final submission.

## Be prepared for a code review and constructive criticism

What happens if your coding challenge solution is good enough to reach the next stage? In many cases, the next step will involve a review of your coding challenge. This could be anything from a discussion with your recruiter over the phone, to a paring interview where you're challenged to extend your solution to deal with new requirements. None of us write perfect code, and reviewer will almost always have some criticisms of your code. Don't be too afraid of this. In most cases, the reviewers want to see that you can take feedback on board and don't react too defensively. Remember, you are not your code.

## Regardless of the outcome, appreciate the experience

Even if you don't make it pass the coding challenge of the interview process, don't be too disheartened. Going through a coding challenge is a great way to hone your skills, and get feedback from professional software developers. Know that you're a better developer for having completed the challenge, and take what you learned to the next one.
