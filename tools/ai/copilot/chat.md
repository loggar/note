# Copilot chat

## Command

| Command     | Description                                                  | Usage                                                                                                                |
| ----------- | ------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| `/explain`  | Get code explanations                                        | Open file with code or highlight code you want explained and type:<br>`/explain what is the fetchPrediction method?` |
| `/fix`      | Receive a proposed fix for the problems in the selected code | Highlight problematic code and type:<br>`/fix propose a fix for the problems in fetchAirports route`                 |
| `/tests`    | Generate unit tests for selected code                        | Open file with code or highlight code you want tests for and type:<br>`/tests`                                       |
| `/help`     | Get help on using Copilot Chat                               | Type:<br>`/help what can you do?`                                                                                    |
| `/doc`      | Add a documentation comment                                  | Highlight code and type:<br>`/doc`<br>You can also press CMD+I in your editor and type `/doc` inline                 |
| `/generate` | Generate code to answer your question                        | Type:<br>`/generate code that validates a phone number`                                                              |
| `/optimize` | Analyze and improve running time of the selected code        | Highlight code and type:<br>`/optimize fetchPrediction method`                                                       |
| `/new`      | Scaffold code for a new workspace                            | Type:<br>`/new create a new django app`                                                                              |
| `/simplify` | Simplify the selected code                                   | Highlight code and type:<br>`/simplify`                                                                              |

## Refactoring with mentioning file names

Hash (`#`) filename and prompt:

```
#file: a.go
Offer suggestions to simplify the code
Refactor the nested conditions
Refactor the error handling code
```
