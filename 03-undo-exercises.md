The goal of this exercise is to figure out how to undo some common
commands that change something in your git repository.

To start, find a convenient directory to work in, and type

    git clone https://github.com/jorendorff/peeredit.git
    cd peeredit

Then, try the examples below.
Each example will have you run a command,
then figure out how to undo that command using `git`.

In every case, try to find a command that exactly undoes the
command listed, not a "clobber everything and start from scratch" command.

*   **Undoing simple edits** - You've edited a file of source code, totally
    screwed it up, and saved it. To simulate this, run this command:

        sed -i 's/fun/malfun/' index.js

    This edits `index.js` by doing a global search-and-replace. After
    running it, you can use `git diff` to see what it did.

    Now you want to undo all those edits,
    restoring `index.js` to how it looked at the previous commit.
    You could manually edit the file to undo each change,
    but that would be tedious.
    What `git` command will undo these edits?

    Hint: Try `git status` and read the output closely.

    Solution:  `git checkout FILE`

*   **Undelete** - You accidentally deleted a whole directory.

    In a clean repository, run this command:

        rm -r test

    What git command brings it back?

    Solution:  `git checkout DIR`

*   **Undoing `git rm`** - Same thing, but you also made the mistake of
    telling `git` what you were doing.

         git rm -r test

    How can you undo that?

    Solution:  `git reset -- test; git checkout test`

*   **Undoing `git mv`** - Oops. You didn't mean to move/rename that file.

        git mv index.js undex.js

    Solution:  `git mv undex.js index.js`

    Solution:  `git reset -- index.js; git checkout index.js; git rm -f undex.js`

*   **Undoing `git add`** - In a clean repository, run these three commands:

        git mv test/test.js test/test_basics.js     # rename a file
        echo "HOURS OF TRICKY WORK" >> index.js     # edit a file
        git add index.js                            # stage the edit

    You want to undo only the last command.
    This should leave the changes to index.js in your working directory.

    Bonus: Can you figure out what the scenario is here?
    Why would you want to undo a `git add` command?

    Solution: `git reset index.js`

*   **Undoing `git commit`** - You just committed a ton of work, and it
    was a major mistake. You haven't pushed the change yet. You want to
    undo only the commit, leaving the index and working directory alone.

    Solution:  `git reset --soft HEAD~` ?

*   **Undoing a busted merge** - You just did:

        git checkout master
        git merge mybranch1

    And there were a ton of conflicts.

    You don't have time to deal with this right now and you want your repo back.
    How can you recover?

    Solution: `git merge --abort` ?

*   **Undoing a "successful" merge** - You just did:

        git checkout master
        git merge mybranch2

    As far as git's concerned, the merge succeeded.

    Unfortunately, the resulting codebase is a massive mess. It won't
    even run.  You need to try something else-- but the first order of
    business is to undo the merge.

    Solution: `git reset --soft HEAD~` again

*   **Undoing `git rebase`** - You just did:

        git rebase master

    to rebase your whole current branch `topic` on top of the current
    `HEAD` of `master`.

    The rebased work doesn't pass tests, and you're having trouble
    figuring out what went wrong.  You want to just forget the whole
    rebase, go back to the pre-rebase version, make sure that passed
    tests, and go from there. How?

    Solution: `git reset --hard topic{1}` ?

