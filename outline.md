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


## [Git basics puzzles](03-puzzles.md)


## Branches

Commands:

*   `git branch <name>`

*   `git checkout <branch>`

*   `git branch -vv`

*   `git log <branch1> <branch2>`

*   `git log --graph --decorate --all`

Vocabulary:

*   **head** - The most recent commit in a branch.

    The name of a branch can be used anywhere a `git` command asks for a `<commit>`.
    It means the head of that branch.

*   **branch pointer** - The SHA of the head of the branch,
    often stored in `.git/refs/heads/<branch>`.
    A branch is not much more than this one SHA!

*   **`HEAD`** - Alias for "the current branch". Stored in `.git/HEAD`.
    `git checkout <branch>` changes this.

*   **reference** - A name for a commit. These are stored under
    `.git/refs`. This includes branches and tags.

*   **detached HEAD** - Situation where there is no "current branch", and `.git/HEAD`
    points to a commit by its SHA. New commits are not added to any branch.
    Not as scary as it sounds.


## Branches puzzles

    (Vocabulary: amend, parent, patch, diff)

## Pushing and pulling

Vocabulary:

*   **clone** - A copy of a repository.

*   **remote** - Another repository related to yours.

    Each Git repository contains a list of other repositories and their
    locations; these are called remotes.

*   **push** - Send your commits to a remote.

*   **pull** - Get commits from a remote AND rebase/merge your work with
    those commits.

*   **fetch** - Get commits from a remote (without rebasing/merging).

*   **`origin`** - `git clone` automatically creates a remote with this name.
    It refers to the repository from which your new repository was cloned.

    There is nothing special about this remote except it's the one Git
    creates for you.

*   **remote-tracking branch** - A branch in your repository that
    represents the last known state of a branch in a remote repository.

    A remote-tracking branch's branch pointer is updated
    automatically each time you fetch from a remote. Stored in
    `.git/refs/remotes/<remote>/<branch>`.

    For example, `origin/master` always points to whatever the `master`
    branch in `origin` pointed to the last time we fetched; this
    branch pointer is stored in `.git/refs/remotes/origin/master`.

*   **upstream branch** - TODO. Each branch can have one.

*   **origin/master** - Most common name of a remote-tracking branch,
    since both the remote `origin` and the branch `master` are created
    by default.

*   **ahead** - One branch is "ahead of" another if it contains commits
    that the other does not.

*   **behind** - If branch A is "ahead of" branch B, then branch B is "behind"
    branch A.

    Note that it is possible for a branch to be *both* ahead of *and* behind
    another branch: each branch may contain commits that the other does not.


## Pushing and pulling puzzles

*   **revert**, **backout** - Undo changes by creating a new commit reversing
    a previous commit or commits. See `git revert`.


## Merging and rebasing

*   **merge** - Incorporate changes from one branch into another.

*   **merge tool** - A program to help with the user manually merge files
    when Git can't do it automatically.  See `git mergetool`.

*   **rebase** - TODO.

*   **conflict** - A situation where changes in two branches affect the
    same region of the same file, so that Git can't merge the two
    branches automatically.

*   **abort** - Discard the results of a merge or rebase that had
    conflicts, abandoning MERGE_HEAD and leaving the branch pointer
    unchanged. See `git merge --abort`.


## Merging and rebasing final exam

...

## The object store

*   **SHA** - Unique id for an object; a hash of the object's contents.

*   **blob** - An object representing the content of a file: just bytes.

*   **tree** - An object that's a snapshot of a directory. Implemented as
    filename-SHA pairs.

*   **tag** - An object that's just a named commit.

*   **hash** - TODO

*   **object** - TODO

    (Vocabulary: content-addressable, commit-like, tree-like)
