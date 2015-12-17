## Basic things you need to know

Let's walk through a simple example using the basic `git` commands.

For some of you, all this will be very familiar.
But I'm going to do something weird while we're doing this.
I'm going to draw a picture over here as we go.
This will end up being a detailed picture of what is in a `git` repository.


## Example 1: a repository from scratch

Let's create a new project.

    $ mkdir hello
    $ cd hello

I'll just throw a line of code into a Python file.

    $ echo "print('hello world')" > hello.py
    $ python hello.py
    hello world

You can pretend I just spent four hours creating a new web site or something.

    $ ls -a
    .  ..  hello.py

*(prompt:)* How can we put this work into Git?

    $ git init               # set up Git to manage this directory
    $ git add hello.py       # add a file to the project
    $ git commit             # commit our work

What I want to do now is talk through these three commands in more detail.
On the way, we're going to collect a bunch of Git vocabulary words.

    $ rm -rf .git

*(at this point, get a volunteer to drive)*

What was our first command again?

    $ git init
    Initialized empty Git repository in /home/jorendorff/dev/git-ignorance/playground/hello/.git/

*(prompt:)* What just happened?

Well, git told us what happened. We've created an empty git repository.
A **repository** is just a directory tree, plus version control.

*(prompt:)* How does Git know what server we're talking to?

This repository isn't connected to any server.
Git can work just fine on your local filesystem.

All the version control stuff is stored under this `.git` subdirectory:

    $ ls -a
    .  ..  .git  hello.py

*(whiteboard: draw a vertical line;
on one side, write "working tree"
and put `hello.py` in there;
on the other side write `.git`)*

This `.git` directory is the database where all your history is stored.

In general, everything in `.git` is created by Git for its own use,
and you're not supposed to look in there or mess with it.
We are going to look in there all day today,
because it's a great way to understand what's going on.

Everything else, everything outside the `.git` directory, is called your **working tree**.
That's where you do your work.
Git exists to record snapshots of your working tree,
and help you share that work with others.
And it saves all those snapshots in the `.git` directory.

Something we're going to come back to again and again today is the `git status` command
that basically just tells you what is going on.
As a rule, if you have a question like "What just happened?"
(and you will)
then now is a good time to run `git status`.

    $ git status
    On branch master

    Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

        hello.py

    nothing added to commit but untracked files present (use "git add" to track)

Words that are git jargon in this message include: "on", "branch",
"master", "initial", "commit", "untracked"... basically all of them.

You can see places in here where git is trying to be helpful,
to suggest a useful next step.
But my experience of those suggestions is kind of surreal.
It says, "use `git add` to track".  ...Track?

I said earlier that our main task today is to learn the language.
So let's get started.

    On branch master

Right away, literally first thing we do, we have to talk about branches.
In git, a **branch** is just a named line of development,
a series of commits.

`git init` creates a branch with the name `master`. There is nothing
special about this branch except that it's the one Git makes for you.
You can rename it if you want.

When git says that we're "on branch master", that means that right now,
any work we commit is going to be added to the branch called `master`.

OK. Next line:

    Initial commit

A commit is the basic unit of work in Git.
Remember how I said that Git exists to record snapshots?
Well, that's what a commit is.
A **commit** is a snapshot of your working tree,
plus a few bits of information like a timestamp and your name.
We'll see one in a minute here.

**Initial commit** means we haven't run `git commit` yet,
so there are no commits yet. There's no history.

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

        hello.py

Git is telling us that it sees this file, `hello.py`, that we created
earlier, but we haven't added it to Git, so Git is going to ignore that
file for now. That's what "untracked" means. Git doesn't keep track of
your work until you run a `git add` command.

If you use an IDE, it might automatically add files for you. Since we're
using the command line today, we'll do it ourselves.

    nothing added to commit but untracked files present (use "git add" to track)

"nothing added to commit" means we have not run the `git add` command yet.
"untracked files present" is another reminder about `hello.py` not being tracked.

So, let's change that. We want `hello.py` to be under version control.

    $ git add hello.py

*(prompt:)* What just happened?

*(draw the index, and the `git add` arrow)*

OK. So this is something called the **index**, or the **stage**, or the
**staging area**. Think of the stage as a copy of your working tree,
stored somewhere inside your `.git` directory. (Don't bother looking for
it in there; you won't find it. We'll talk about exactly how this is
stored later.)

So when you do `git add hello.py`, it copies the current contents of hello.py,
whatever you've currently got, and puts the copy into the index.

So let's run `git status` and see what happened.

    $ git status
    On branch master

    Initial commit

    Changes to be committed:
      (use "git rm --cached <file>..." to unstage)

        new file:   hello.py

*(discussion)*

Note that `git status` no longer says anything about "untracked files".
A file is **tracked** if it's in the index.

Now let's actually commit this work.

    $ git commit

*(discuss `EDITOR` and `GITEDITOR` environment variables)*

*(enter a commit message and exit the editor)*

*(prompt:)* What just happened?

*(draw `git commit` arrow from the index to the object store)*

    $ git commit
    [master (root-commit) a031fab] hello world!
     1 file changed, 1 insertion(+)
     create mode 100644 hello.py

More jargon, but none of these words are super important in Git.

*   Do you remember what `master` is? Why is it mentioned here?

*   Can you guess what `root-commit` means?
    Right. This is the first commit in the `master` branch.

*   What is this `a031fab`?
    Git has assigned a unique ID, called a SHA, to this commit.
    It's a number, actually, a long string of hexadecimal digits.

    We'll talk more about what this is later on.
    It's a fair question to ask,
    "Why doesn't git just call this `commit #1`?"
    There is a reason, and I promise, you'll see why.

*   `1 insertion` simply means that there's 1 line of code in that file.
    If it had 3 lines of code, it would say `3 insertions`, and so on.

*   "Mode" is a Unix permissions thing that we don't care about.

Now we can type `git log` and it'll show the complete history of our project:

    $ git log
    commit a031fab953fc7bdfa4d462f0d192f8fa30fc0ebc
    Author: Jason Orendorff <jason.orendorff@gmail.com>
    Date:   Wed Dec 16 14:31:24 2015 -0600

        hello world!

In some places, Git will show an abbreviation of the SHA, just 7 digits usually.
But in other places, Git shows you the whole thing, which is 40 hex digits.
I don't know what the logic is, honestly.

Now what will `git status` say?

    On branch master
    nothing to commit, working directory clean

This is a lot shorter than last time.

*   We're still working on branch `master`.

*   We just committed all our work, so there are no new changes to commit.

*   "working directory" means our working tree.

*   And our working directory is **clean** because every tracked file
    is unchanged since the last commit.

Git doesn't have much to say about clean files.
Since everything is clean right now,
we're getting the minimum output from `git status`.

When you see this, it means that
*(indicating the whiteboard)*
your working directory,
the index,
and the most recent commit
all contain the same files, the same directories, the same data.


## How to ask basic questions

A key survival skill in `git`, or any complex system really,
is how to find out what's going on without changing anything.

`git status` is great.
Here are two more.

*   `git diff` shows you the differences
    between your working tree and the index.

    *(whiteboard: write "compare" and draw the `git diff` arrow)*

*   `git diff --staged` shows you the differences
    between the index and the last commit.

    That is, it shows you what would be in your new commit
    if you decided to commit right now.

    *(whiteboard: draw the `git diff --staged` arrow)*

    You'll often see `git diff --cached`.
    **Cached** means staged.
    The two are completely synonymous.

`git status` only tells you which files changed.
These commands show exactly what was changed in each file.


## Two more commands

I'm going to show you two more commands now,
and then we'll do some puzzles together
to see if you've been paying attention.

*(whiteboard: draw the two leftward arrows)*

So far we've only seen how to move changes from your brain,
to the working tree, to the index, and finally to a commit.
There are also commands to copy files in the other direction.

You use these when you've screwed up.

*   `git checkout FILENAME` takes whatever version of a file you have in the index,
    and copies that to your working tree.

    So whatever's in your working tree with that filename gets clobbered.
    It's overwritten with what's in the index.

    So this is kind of like a backwards version of `git add`.
    Instead of data being copied from your working tree into the index,
    this goes the other direction.

    You can also `checkout` a directory;
    `git` will clobber all your edits in that whole directory.

*   `git reset FILENAME` does not affect your working tree.
    It takes a version of a file from the most recent commit
    and copies that to the index,
    overwriting whatever was in the index.

Why are these useful? Well, we'll see.


## The "complete" picture

This is the picture I wish someone had shown me when I started using Git.

*(the final picture on the whiteboard)*

                           | .git/
                           |         -----------                   ----------
        working tree  <------------> |  index  | <--------------> (  commit  )
                           |         -----------                   ----------
                           |
               +                         - +                           -
     compare: |<========= diff ==========>|<====== diff --staged ======>|

     emacs--->*-----------add------------>*------------commit---------->*

              *<-------checkout FILE------*<---------reset FILE---------


This will be enough to get us started.
