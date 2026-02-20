📘 Day 23 – Git Branching & Working with GitHub
🧩 Task 1: Understanding Branches
1️⃣ What is a branch in Git?

A branch in Git is a separate line of development.
It allows you to work on:

New features

Bug fixes

Experiments

without affecting the main codebase.
This helps in developing and testing safely.

2️⃣ Why do we use branches instead of committing everything to main?

We use branches because:

It keeps the main branch stable

Multiple developers can work on different features in parallel

It allows safe testing before merging into the main branch

Mistakes in one branch do not affect other branches

Branches improve teamwork and reduce the risk of breaking production code.

3️⃣ What is HEAD in Git?

HEAD is a pointer that refers to:

The current branch

The latest commit you are working on

It tells Git where you are in the project history.

Example:
If you are on branch feature-login, then HEAD points to feature-login.

4️⃣ What happens to your files when you switch branches?

When you switch branches:

Git updates your working directory to match the selected branch

Files may change, appear, or disappear depending on the commits in that branch

Uncommitted changes may block switching if they conflict with another branch

This ensures that each branch shows only its own version of the project.

✅ Summary

Branches allow parallel development

HEAD shows your current position in Git history

Switching branches updates your project files automatically

Branching makes Git safe, powerful, and collaborative
