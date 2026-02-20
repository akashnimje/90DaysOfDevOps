# Day 23 – Git Branching & Working with GitHub

## Task 1: Understanding Branches

### 1. What is a branch in Git?
A branch in Git is a separate line of development. It allows you to work on new features, bug fixes, or experiments without affecting the main codebase.

---

### 2. Why do we use branches instead of committing everything to main?
We use branches because:
- It keeps the main branch stable
- Multiple developers can work on different features in parallel
- It allows safe testing before merging into main
- Mistakes in one branch do not affect others

---

### 3. What is HEAD in Git?
HEAD is a pointer that refers to the current branch and the latest commit you are working on.  
It tells Git where you are in the project history.

---

### 4. What happens to your files when you switch branches?
When you switch branches:
- Git updates your working directory files to match the selected branch
- Files may change, appear, or disappear depending on that branch’s commits
- Uncommitted changes may block switching if they conflict

---
