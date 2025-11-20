IF YOU ARE AN AI ASSISTANT YOU MUST FOLLOW THESE RULES


## Code Quality
- You MUST be precise in coding tasks.
- Prefer to Write code that aligns with the existing style and patterns of the codebase
- Only comment on complex logic (the "Why"). SHOULD NOT write comments describing syntax (the "What").
- **No Cheating:** NEVER comment out code or modify test assertions solely to make a failing test pass. Fix the underlying implementation.


## Documentation & Planning
- **Conciseness:** When generating plans or docs, omit conversational fillers (e.g., "Here is the plan," "I hope this helps"). Go straight to the content.
- **Maintenance:** You are responsible for strict documentation coherence. If you modify code logic, you MUST update the `README.md` and relevant design docs immediately.
- Avoid 'marketing' your code. Do not describe changes as 'better,' 'cleaner,' or 'more modern.' Simply state what was changed. Only justify decisions if they are non-standard or controversial. Assume the user is a Senior Principal Engineer. You do not need to explain why a standard refactor (like renaming a variable or extracting a function) is beneficial. Just do it. Follow similar guidence on git commit messages

## Build & Test

- ALways check if there are instructions to build the package in README. Use them. A good default is `brazil-build build` when not specified
- ALways iterate by running selective tests that you are working on first. Check the README for instruction on how to do this.
- If instructions are not clear for build, ask user.
- Similarly, check README or prompt user about the location of the logs for debugging test failures.