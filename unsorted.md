(unsorted items to put somewhere)


    git clone URL [DIR]
    git status
    .gitignore
    git diff
    git diff --cached
    git commit -a
    git rm FILE1 ...
    git rm -f FILE1 ...      # if staged changes are not saved in repo at all



## Exercises

(See `../git-primer`.)


### Basics

Clone a repository.
Make edits.
`git add` an edited file.
`git add` a new file.
`git commit`.
`git push`.


### Undo (or: beginning time travel)

(see `../git-primer/undo`)

*   Discussion after "undoing `git commit`":

    Really, `git reset` is a masterpiece of bad UI design.
    Check this out:

    `git reset [SHA] FILE` only touches the index.

    `git reset`, with no arguments at all, only touches the index.

    `git reset [--soft/--hard/--mixed/--keep] SHA`,
    with a SHA argument but no file arguments,
    changes the branch pointer.
    Some of the options have it touching the index and working tree too.

    I always consult the man page before using this flavor, because I
    can't remember what "soft" and "hard" mean. Could they possibly have
    used less informative words here?

*   `git push` - (another exercise not on the worksheet, for group discussion)

    Oops. Not only did you commit the work, you actually
    pushed it to the central repository. Now what?

    This is not as simple as other cases. *(prompt)* Why?

    Right, other users may already have pulled the bad commit.
    Once multiple users have a bad commit, it is pretty much permanent.

    So how do you recover? The best thing to do here is usually
    to push a new commit *reverting* the changes:

        git revert HEAD
        git push origin master

    (explain what `git revert` does)

    But what if you just pushed a file containing a secret, like a password?
    Change the password.
    Because that file is now in the history.

    Suppose you accidentally committed a database of patient records.
    It's confidential information and it absolutely has to be stripped
    out of the repository.

    This is when you send email and get help from an expert.

    *(prompt)* Why is this hard?

    By design, git is *append-only, mostly*.
    Information is only added to a repository, never deleted.

    This is one of git's saving graces actually.
    It's your safety net.
    I wouldn't want to use such a weird, complicated tool
    to store all my work
    if it was in the habit of deleting and overwriting stuff
    every time I issued a command.

    So it doesn't. It has logs for everything.
    Even if you manually go in and mess up a branch,
    even if you use `git gc` to try and destroy all unreachable files,
    git *still* doesn't delete anything that was in any branch within the past 90 days
    (by default).

    http://stackoverflow.com/questions/2046638/use-of-git-rebase-in-publicy-feature-branchs/2046748#2046748

    "If you rebase, you rewrite history. And just like in the real
    world, if you want to rewrite history, you need a conspiracy:
    everybody has to be "in" on the conspiracy (at least everybody who
    knows about the history, i.e. everybody who has ever pulled from the
    branch)."

Discussion: Except for `git push` and `git pull/fetch`,
all git commands do nothing more or less than mess around with files on your disk,
including files in your `.git` directory.
So if you are doing something new and risky, just zip up your whole directory first.

The easiest and surest way to undo a disaster is to go to your backup.
That way you don't have to rely on git commands which may themselves backfire.



### Detective work

We're supplied directories. Our goal is to find out what happened here.

1.  The repo is clean. We just cloned it.

2.  `git diff` is clean, but uncommitted edits have been added to the index using `git add`.

3.  We have added some changes using `git add` and then subsequently made more edits to the same file.

4.  A file has been `git mv`'d but this hasn't been committed yet.

5.  A file or directory has been `git rm`'d.

    Or removed from disk but not `git rm`'d.

6.  Someone did `git merge` or `git pull` but there are conflicts.

7.  Someone did `git rebase` or `git pull --rebase` but there are conflicts.

8.  Someone did `git pull`, triggering a merge that went horribly wrong.
    They did `git checkout .` and then `git commit`,
    basically clobbering all changes since the common ancestor, in the files with conflicts (???)
    (Is that how `git checkout` works on files that have multiple index entries?)
