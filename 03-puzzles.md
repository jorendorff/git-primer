## Git puzzles

Let's do a few puzzles.

You can follow along on your laptop.
Find a convenient directory to work in, and type:

    git clone https://github.com/jorendorff/peeredit.git
    cd peeredit

Did that work?

*(prompt:)* What does this command do?


### Undoing simple edits

Let's say I open a file in here (say `index.js`)
and do a global search-and-replace,
replacing `fun` with `malfun`,
because there's some variable I want to rename or something.
I save the file and exit the editor.

Then I do `git diff` and realize that I've accidentally
turned all my JS functions into malfunctions.

Now I want to undo all those edits,
restoring `index.js` to how it looked at the previous commit.
I could manually edit the file to undo each change,
but that would be tedious.
What `git` command will undo these edits?

Raise your hand when you think you've got it.

*(Hint: Try `git status` and read the output closely.)*


## Undoing `git add`

Let's say I have been working in this repository for a while.

    echo "WORK WORK WORK" >> index.html
    echo "FIX FIX FIX" >> index.html
    git add index.html

And I meant to commit this work, but let's say I forgot,
I just went home and left it sitting there.

The changes are in my working tree and in the index.
They just haven't been committed yet.

OK, now I come into work the next day and:

    echo "HOURS OF TRICKY WORK" >> index.js
    git add index.js

*(prompt:)* What do you think `git status` will show now?

What mistake have I made?

How can we undo it?
Keep in mind:

1.  I only want to undo the last command.

2.  I don't want to lose hours of tricky work.


## Undelete

This time I'm going to accidentally delete a whole directory.

    rm -r test

Oops! I meant to *run* the tests, not *obliterate* the tests!
Oh well.

What git command brings them back?


## Undoing `git rm`

OK, same thing, but let's say I also made the mistake of
telling `git` what I was doing.

     git rm -r test

First of all, how is this different from the previous puzzle?
In that puzzle, I did `rm -r test`, in this one, `git rm -r test`.
Is there a difference?

See if you can undo this.

*(Hint: It might take two commands.)*


# Undoing `git mv`

OK, let's try something else.

    git mv index.js undex.js

*(prompt:)* What did I just do?

    ls

The file was renamed, in my working tree at least.

Was it renamed in the index too?

    git status

If that's not clear enough for you, you can use `git diff`:

    git diff
    git diff --staged

So it looks like `git mv` did rename the file both in the working tree
and in the index.

OK, so let's say `undex.js` is just a typo,
I didn't really mean to rename that file to a typo.
Here's the puzzle. How do we undo it?

This is a sneaky one. There's an easy answer and a hard answer.


## Segue

You may have noticed a theme with these puzzles.
They were all about fixing mistakes, right?
Undoing damage.

I made puzzles about undo because it's a very common need.

And these puzzles illustrate just how important it is
to understand Git thoroughly.
If you don't understand Git pretty well,
you'll find this kind of puzzle quite difficult.
And that's too bad, because these things happen.

Another way to solve any of these puzzles
is to sweep the whole stupid disaster into the Recycle Bin
and make a new clone.
But then what will you do
when you've got hours or weeks of work in there?
