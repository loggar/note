Thanks for meeting with us to complete the coding interview.  Great news! You performed well and we would like to progress you to the next stage.  During the next step, which is a technical interview, you will be asked to describe a project that you have worked on in detail, my advice is to talk about a project where you have had significant input that you can discuss in great technical detail.

There will also be a design exercise at the end of the interview.   Our scheduling team will be in touch soon.  In the meantime, I've posted the feedback from your interview below for your benefit.  Please be sure to brush up on any areas needed before your next interview.

Strengths:
- Got a quick understanding of the application, and the tasks required
- Asked correct questions when the task was unclear (i.e. "should I recover meta information if it's missing in DB, or just return 404"?)
- Looked up the docs of sqlite to find out what happens when the row was not found
- Almost got Chrome Node.js inspector working
- Suggested using hash for Etag/hashing

Areas for Improvement:
- The candidate was confused with the command syntax in the beginning, e.g. used `npm run` instead of `npm start`
- For "not found in DB" task: try/catch instead of `=== undefined`. Presented overcomplex approach even if he had more time to work
- Doesn't understand caching well: initially suggested to use public ids as `etags`, even though the binary might change without the change of this field
-Needed a hint for HTTP header case insensitivity

-------------------------------------------------------

I really appreciate that you took the time to consider us. I know there are a lot of companies out there that are hiring. I wanted to pass on the feedback just as soon as I had it, as I know your job-search is time sensitive. While we were really impressed with your ability to get things done at your current company, we have decided to move forward with someone else, whom we think would be the best fit for the job.  I've posted feedback below for your benefit:

Strengths::
- Has knowledge about pretty diverse parts: from SQL injections to CSRF
- Candidate's thorough approach is reasonable: he started learning the tool with its tests, updated the docs, used profiler and debugger.  High level understanding of what he was working with.
- Judgement about using shared storages for different services was good.

Areas for improvement:
- I didn’t hear anything from the candidate regarding work in the team.
- Database knowledge lacked depth: didn’t work with persistent storages before Redis. Also, we spent some time talking about the strategies to scale Redis with their model of data and the candidate didn’t have clear understanding why this would work or why it would not.
- He seems to be far from ops: when we decided to dig a bit deeper into performance issues with node.js and how the candidate would understand what part of the application is the bottleneck he mentioned monitoring and the ops team, but didn’t have experience solving performance issues in node.js

Again, I really appreciate your time meeting with us and would love to reinterview you in a year if you have been able to grow in these areas.