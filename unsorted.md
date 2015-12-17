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

