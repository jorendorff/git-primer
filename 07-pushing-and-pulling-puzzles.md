## "Pushing and pulling" puzzles

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
