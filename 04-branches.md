## Branches

Git clearly comes with some extra complexity.
I want to show you one of the advantages.


### Creating a branch

Let's say I want to do some work on our code.
And let's say I'm not entirely sure if my approach is going to work out.
I just want to try it.

    $ git branch newtemplates

I just created a branch called `newtemplates`.

*(prompt:)* Why did I call it that?

Yeah, I'm living in a fantasy world where I'm working on a web site
and I have some big ideas about templates.
You can name a branch whatever you want.

If you run `git branch` without any arguments, it lists your branches.

    $ git branch
    * master
      newtemplates

Remember we got one called `master` when we created the repository,
and now we have another one called `newtemplates`.

We can pass the `-vv` flag and Git will give us more information:

    $ git branch -vv
    * master       69f0de5 hello
      newtemplates 69f0de5 hello

What Git is showing us is, for each branch, what is the most recent commit on that branch.

The most recent commit on a branch is called the **head** of that branch.
Every branch has a head.
The SHA of the head of a branch is also called the **branch pointer**.
A branch in Git is really nothing more than a pointer
pointing at some commit in the history.

What you see here is literally all a branch is.


### HEAD

*(prompt:)* Why does `master` have a star next to it?

*(run `git status` and see)*

We're still "On branch master".
What does that mean?

OK. A branch is a line of development, right?
When you commit work, that work goes into your current line of development,
your current branch.
Right now, our current branch is `master`.
If we make a change right now and commit it, that change will go into `master`.

Let's do that and see it working.

*(commit some work, show git branch -vv)*

You can see that when we did `git commit`,
`master`'s branch pointer changed.
Now it points to the new commit.
Our other branch didn't move.

But suppose we actually want to get started on our new line of development,
this `newtemplates` branch.


### Behind the scenes

This stuff right here is so important
that I want to show you how it works behind the scenes.

    $ cd .git
    $ cat HEAD
    ref: refs/heads/master

This is a file inside the `.git` directory.
We're not supposed to be looking at this.

We're looking at something called `HEAD`, in allcaps.
`HEAD` is simply the current branch.

You can see that our current branch is something called `refs/heads/master`.

Guess what.

    $ ls -l refs/heads/master
    -rw-r--r--  1 jorendorff  staff  41 Dec 17 08:09 refs/heads/master

There's a file inside our .git directory called `refs/heads/master`.
What do you think it has in it?

    $ cat refs/heads/master
    4383d72334c7bf744d9e16abb427f74f447cb616

Does that look familiar? It shouldn't, necessarily, but check it out:

    $ git branch -vv
    * master       4383d72 do more work on the greeting
      newtemplates 69f0de5 hello

It's the full SHA of our most recent commit.

Do you think there might also be a file called `refs/heads/newtemplates`?

    $ cat refs/heads/newtemplates
    69f0de59933491fb5ffed402dcf2215bdd25e6b3

Yeah.

*(back to whiteboard, draw `HEAD` and `master: 4383d72`)*

So this `git commit` command we drew on here earlier,
it doesn't just copy files from your index into a commit.
It does one more thing.
It moves the branch pointer to point to that new commit.


### Switching branches

The whole point of having a branch is to be able to do work in that branch
that nobody else has to worry about until it's done.

*(prompt:)* Why is that useful?

So let's go do some work in this branch.

    $ git checkout newtemplates

*(demonstrate committing to the branch)*


### Seeing branch history

    $ git log

*(prompt:)* Wait a minute. Isn't a commit missing from the log? What happened to it?

Well, `git log` only shows you the current branch by default.
But it's super easy to ask it to show you multiple branches at once:

    $ git log master newtemplates

Now we're looking at the combined history of both branches.

You can use `--all` to show all commits from all branches.

So, this shows us the commits, but it doesn't show us which changes are in which branches.
It would be nice to be able to see that, right?

    $ git log --graph --all

Even better, `git` can show you which branch is which:

    $ git log --graph --all --decorate

This command is so useful that I have an alias set up for it.

    $ git config --global alias.glog 'log --graph --all --decorate'
    $ git glog

*(possibly talk about how every commit has a parent)*

*(possibly show a repository with lots of merges)*


### Forcibly changing branch pointers

Normally, branch pointers only move when you make a new commit.
But stuff happens, so to help you fix problems,
there is also a command that just sets the current branch pointer
to whatever SHA you like.

Use this with care.

The command is called `git reset`.

    git reset --soft SHA    ## only changes the branch pointer
    git reset        SHA    ## also changes the index
    git reset --hard SHA    ## also changes the index and working tree

We saw `git reset FILENAME` earlier.
It's best if you think of `git reset SHA` as something completely different.
I wish it had a different name. They are not very closely related.

This last one will absolutely clobber all your uncommitted work.
But in fact it's worse than that, because all three of these commands
can be used to erase your *committed* work.

To see how they can be used for good, let's do a couple puzzles.
