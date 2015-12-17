# An expanded outline

## [Why use git?](01-why-git.md)

*   I don't know
*   not googleable
*   Difference 1: Branches
    *   what is a branch? a merge? why do we do them?
    *   git is different - accepts & embraces branching
    *   normal work = tiny branches
    *   one person vs. whole team
    *   rare vs. everyday
    *   scheduled flag day vs. parallel work
    *   bonus tools
*   Difference #2: Complete replicas
    *   traditional "cylinder in the sky"
    *   git: fully copy on disk, can work locally
    *   speed, robustness
    *   local branches
    *   the "D" in DVCS


## About this primer

*   no slides, whiteboard instead
*   short lectures, lots of exercises
*   Why are we learning so much?
    *   the thing about git: jargon - hard to learn anything by reading
    *   normal approach to learning doesn't work
    *   goal is not to become an expert today
    *   goal: teach you 2 things you need
        *   the vocabulary
        *   how to experiment


## [Git basics revisited](02-basics.md) - Building a picture of your repository

*   `git init` (draw the repo)
    *   **repository** - directory containing your source code, plus history.
        One git repository = one copy of a project.
    *   **working tree**, **working directory** - the main directory
        of the repository, where you work.  Everything outside of
        `.git/`.
*   `git status`
    *   **branch** - a named line of development, a series of commits
    *   **master** - the branch `git init` automatically creates for you
    *   **initial commit** - `git status` says this when there are no commits
*   `git add FILE`
    *   **index** - Imaginary copy of your working tree that contains
        the exact files that will be recorded if you commit.
    *   **stage**, **staging area** - The index.
*   `git status`
    *   **tracked** - In the index.
*   `git commit` - discuss `EDITOR`
*   `git status`
    *   **clean** - Unchanged since the last commit.
*   `git diff` and `git diff --staged`
    *   **cached** - Staged.

