(unsorted items to put somewhere)


    git clone URL [DIR]
    git status
    .gitignore
    git diff
    git diff --cached
    git commit -a
    git rm FILE1 ...
    git rm -f FILE1 ...      # if staged changes are not saved in repo at all


## "Basics" detective work

We're supplied directories. Our goal is to find out what happened here.

1.  The repo is clean. We just cloned it.

2.  `git diff` is clean, but uncommitted edits have been added to the index using `git add`.

3.  A file has been `git mv`'d but this hasn't been committed yet.

4.  A file or directory has been `git rm`'d.

    Or removed from disk but not `git rm`'d.

(These are all too easy to bother with, I think.)


## "Branches" puzzles

### Undoing `git commit`

You just committed a ton of work, and it
was a major mistake. You haven't pushed the change yet. You want to
undo only the commit, leaving the index and working directory alone.

Solution:  `git reset --soft HEAD^`


### Discussion after "undoing `git commit`"

Really, `git reset` is a masterpiece of bad UI design.
Check this out:

*   `git reset [SHA] FILE` only touches the index.

*   `git reset`, with no arguments at all, only touches the index.

*   `git reset [--soft/--hard/--mixed/--keep] SHA`,
    with a SHA argument but no file arguments,
    changes the branch pointer.
    Some of the options have it touching the index and working tree too.

    I always consult the man page before using this flavor, because I
    can't remember what "soft" and "hard" mean. Could they possibly have
    used less informative words here?


### Undoing `git push`

Oops. Not only did I commit the work, I actually
pushed it to the central repository. Now what?

This is not as simple as other cases. *(prompt:)* Why?

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

*(prompt:)* Why is this hard?

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

> If you rebase, you rewrite history. And just like in the real world,
> if you want to rewrite history, you need a conspiracy: everybody has
> to be "in" on the conspiracy (at least everybody who knows about the
> history, i.e. everybody who has ever pulled from the branch).

Except for `git push` and `git pull/fetch`,
all git commands do nothing more or less than mess around with files on your disk,
either files in your `.git` directory,
or files in your working tree.
So if you are doing something new and risky, just zip up your whole directory first.

The easiest and surest way to undo a disaster is to go to your backup.
That way you don't have to rely on git commands which may themselves backfire.



## "Merging and rebasing" puzzles

### Undoing a busted merge

You just did:

    git checkout master
    git merge mybranch1

And there were a ton of conflicts.

You don't have time to deal with this right now and you want your repo back.
How can you recover?

Solution: `git merge --abort` ?


### Undoing a "successful" merge

You just did:

    git checkout master
    git merge mybranch2

As far as git's concerned, the merge succeeded.

Unfortunately, the resulting codebase is a massive mess. It won't
even run.  You need to try something else-- but the first order of
business is to undo the merge.

Solution: `git reset --soft HEAD^` again


### Undoing `git rebase`

You just did:

    git rebase master

to rebase your whole current branch `topic` on top of the current
`HEAD` of `master`.

The rebased work doesn't pass tests, and you're having trouble
figuring out what went wrong.  You want to just forget the whole
rebase, go back to the pre-rebase version, make sure that passed
tests, and go from there. How?

Solution: `git reset --hard topic{1}` ?


## "Merging and rebasing" detective work

1.  Someone did `git merge` or `git pull` but there are conflicts.

2.  Someone did `git rebase` or `git pull --rebase` but there are conflicts.

3.  Someone did `git pull`, triggering a merge that went horribly wrong.
    They did `git checkout .` and then `git commit`,
    basically clobbering all changes since the common ancestor, in the files with conflicts (???)
    (Is that how `git checkout` works on files that have multiple index entries?)
