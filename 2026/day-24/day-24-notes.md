📘 Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

🔰 Introduction

In real software projects, developers:

work on different features in parallel

fix urgent bugs

update code frequently

collaborate with teams

So Git is not just:
add → commit → push

You must know:
✔ how to combine branches
✔ how to resolve conflicts
✔ how to move commits
✔ how to temporarily save work

This chapter covers the core professional Git workflows used in companies.



1️⃣ Fast-forward Merge vs Merge Commit
🔹 Fast-forward Merge

A fast-forward merge happens when:

the target branch has no new commits

Git only moves the pointer forward

Example:
git checkout main
git merge feature-login

Git just moves main to the latest commit of feature-login.

Real-life scenario:

You are working alone on a feature branch:

No one updated main

You finish your work

Merge is simple and clean

➡ Used in: solo work / short tasks

🔹 Merge Commit

A merge commit happens when:

both branches have new commits

Git creates a special merge commit

Example:
git checkout main
git merge feature-payment

Git creates:

Merge branch 'feature-payment' into main
Real-life scenario:

Developer A works on login
Developer B works on payment
Both update main

When merging:
Git must keep both histories

➡ Used in: team projects




2️⃣ Merge Conflicts

A merge conflict happens when:

two branches change the same line

Git cannot decide which one is correct

Example:

app.txt

Branch A:

API_URL = "dev-server"

Branch B:

API_URL = "prod-server"

Git conflict markers:

<<<<<<< HEAD
API_URL = "dev-server"
=======
API_URL = "prod-server"
>>>>>>> feature
Resolution steps:
# open file
nano app.txt

# choose correct version
git add app.txt
git commit
Real-life scenario:

Two developers modify the same function:

one adds validation

another changes logic
Git asks a human to decide.

➡ Conflict resolution is a daily job in teams




3️⃣ Rebase Feature Branch on Updated Main

Rebase = move your commits on top of another branch.

Instead of:

feature --- merge commit --- main

You get:

main → commit1 → commit2 → commit3
Command:
git checkout feature-branch
git rebase main
Real-life scenario:

You started feature work on Monday.
By Friday, main has 10 new commits.
Before creating PR:

git pull origin main
git rebase main

Now your code sits on top of latest company code.

➡ Used to keep history clean




4️⃣ Squash Merge vs Regular Merge
🔹 Squash Merge

Combines many commits into one commit

git merge --squash feature-ui
git commit -m "Add UI feature"

Before:

fix css  
fix button  
fix typo  
add feature

After:

Add UI feature
Real-life scenario:

During development:

many trial commits
But for main, company wants:
✔ 1 feature = 1 commit

🔹 Regular Merge

Keeps all commits:

git merge feature-ui

Keeps:

fix css  
fix button  
add feature
Real-life scenario:

Large project with audit trail:

every commit matters

debugging needs full history

➡ Used in: enterprise projects




5️⃣ Git Stash

Stash = temporary storage for uncommitted work.

Commands:
git stash
git stash list
git stash pop
Real-life scenario:

You are working on a feature.
Suddenly manager says:
❗ “Fix production bug now.”

But your code is half done.

git stash
git checkout hotfix

Fix bug → then return:

git checkout feature
git stash pop

➡ Like putting work into a locker.




6️⃣ Cherry Pick

Cherry-pick = copy one commit from one branch to another.

Command:
git cherry-pick <commit-id>
Real-life scenario:

Bug fix is done in dev branch:

Fix payment crash

But production should not get all dev changes.

So you do:

git checkout production
git cherry-pick 3fa92bc

Only that fix goes to production.

➡ Used for:
✔ hotfix
✔ emergency patch
✔ selective updates

✅ Summary (Professional View)
Feature	Purpose
Merge	Combine branches
Rebase	Linear history
Conflict resolution	Manual decision
Squash	Clean history
Stash	Temporary save
Cherry-pick	Selective commit copy

These are real company Git skills, not just academic topics.
