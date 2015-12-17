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
