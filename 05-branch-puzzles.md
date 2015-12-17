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
