## "Branches" puzzles

### Undoing `git commit`

Go back to your `peeredit` directory and do `git status`.
It should be clean.
If not, blow it away and re-clone that repository from github.

Here's a new puzzle.

    echo "TONS OF WORK" >> index.js
    git commit -m "New caribou detection algorithm"

OK, I just committed a ton of work. Only it was a major mistake.
Before pushing the change to the server, I find out that nothing works.
Everything is broken.

I want to undo only the commit,
leaving the index and working directory alone.

How can I do it?


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


### Fixing a commit on the wrong branch

*(You can do this exercise in the `peeredit` directory.)*

Let's say we create a new branch for work on antlers.

    git branch antlers

We make some changes...

    echo "WORK WORK WORK" >> index.js

...and commit them.

    git commit -m "initial antler code"

And then we realize we just made a mistake.
What was the mistake?

How can we undo that?

Keep in mind we'd rather not lose the changes if possible.
