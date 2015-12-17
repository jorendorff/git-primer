## Why use git?

Why are we using Git in the first place?

Well, I don't know.
That's a choice you made internally, I guess,x
and I don't know what the considerations were.
But I do want to at least try to convince you that Git really does have some benefits,
it's not just the latest hot new programming craze
that the open source hipsters insist on using.

I don't know TFS or TFVC, so I can't speak to Git vs. TFVC specifically.

I want to talk about this mainly because this answer is un-Google-able.
You literally can't find a good, true answer to this question by searching for "Why use Git?"
because there's too much utter nonsense on the Internet about this topic.

Most of the differences between Git and other version control systems
do not matter to you.

So I want to focus on just two things.


### Difference #1: Branches

What do we know about branches and merging?

*   PROMPT: What is a branch?
    (A branch is a diverging line of development.)

*   PROMPT: What is merging?
    (Adopting changes from one branch into another branch.
    Some branches are not meant to be merged. Some are.)

*   You will do it. PROMPT: Why?
    Several reasons.
    You might do a branch for each version of a product.
    You might make a branch to do speculative work
    that you think may or may not pan out.

OK. Here is the first thing that makes git special:

Git recognizes that as soon as multiple people are working on a project,
those people will start making edits on their machines
that go in different directions.

*(illustrating this on the whiteboard)*

I'll edit one file, going in this direction.
You'll edit another file, going in this direction.
And so on.

Git recognizes that this
is the same thing as a branch.
These changes we're making, they're tiny branches.
Branches actually happen literally all the time.
They're inherent in what we do.

And git provides a single set of tools
for managing these tiny branches
and for managing massive branches,
the kind we were talking about earlier,
where two lines of development diverge for weeks or months, or forever.

A single set of tools handles both situations.

Why is that good?

*   In traditional VC, one person on your team understands branching and merging.
    In git, everyone understands branching and merging.
    You'll see why. You'll understand it by the end of today.

    It's *not* because git makes it any easier
    to do and understand branches.

    It's because in git branches are just an integral part
    of the stuff you have to learn
    to use the tool.

    This is the big difference right here.

*   In traditional VC, you do not create a branch for tiny amounts of work.
    In git, you can't avoid doing that, and it's OK.

*   In traditional VC, a merge is an event you schedule. (?)
    In git, you can do a merge locally on your machine
    while other people are working.

*   In traditional VC, to land changes from a branch to mainline, you merge.
    Git has some other tools built in,
    in particular `git rebase` and `git cherry-pick`.

    If you've never heard of these, don't worry.
    We'll talk about them later.
    All you need to know right now is,
    it turns out there are some benefits to accepting and embracing branches!
    You get better tools.

OK, so this one thing is to me the main advantage of using git
over traditional version control systems
in a corporate environment.

(For an open source project, git has other advantages
which we'll skip for today.)

But I said two things, and there is one other thing
that is really nice.


### Difference #2: Complete replicas

Traditional VC is a client-server model.
There is a single source of truth,
one big cylinder in the sky that tracks all work.

*(drawing on the whiteboard)*

Here's your development machine,
here's the server.

Where do changes live?

*(drawing arrow to the cylinder)*

On the server.

As a result, pretty much every operation involves talking to the server.

Do you want to see the changelog? Talk to the server.

If you're not on the network, you can't get answers.

**With git, the entire repository is on your disk.**

The whole history.
This means most commands don't talk to the network at all.
And that makes git feel really fast, which is nice.

It also means you can commit changes,
look at the logs,
figure out who wrote a given line of code,
you can do all these things even if for some awful reason
you don't have network access,
not that that would ever happen.
Or if the central server is unexpectedly down,
not that that would ever happen.

It also means you're free to create a local branch,
and explore a whole line of development,
making commits the way you regularly would,
and if it doesn't work out, nobody ever has to see it.

If you ever see the acronym "DVCS",
that means "distributed version control systems",
and it refers to Git and a handful of other similar systems.
"Distributed" means there are multiple fully functional replicas
on different machines.

So these are the two main differences between Git
and traditional version control systems.

1.  Git forces you to understand branches
    and provides better tools for managing branches.

2.  With Git, you have the complete history of the project on your disk.


## About this primer

I don't have any slides today.
You don't want to stare at slides for two hours plus.

Instead, I'm going to draw pictures on the whiteboard,
and then draw arrows all over them,
but I don't want to talk for more than 5 minutes at a time.
So the "lecture" parts here will be in small chunks.

The rest of the time we'll be trying stuff.
There are a lot of hands-on exercises here.
For the most part, we're going to work through them together
up here on the projector.


### Why we are learning so much

You can use Git without understanding it thoroughly.
There are lots of blog posts and cheat sheets to help you kind of limp along.
When you hit trouble you can search StackOverflow
and paste in scary-looking commands and pray.
I did that for a really long time.

It's frustrating, though, because
if you have the slightest question,
you are kind of screwed.

Everything ever written about Git,
including the manual,
is written in this super dense jargon.
It talks about branch pointers and working trees and staging areas,
and HEAD and master and setting the current branch, and all the rest.

If you don't understand these terms,
or you're just not confident that you *fully* understand them,
it's hard to learn anything by reading.
And that sucks.

This is why we're here today.

Git is not the kind of tool that rewards our usual way of learning.
Normally, to learn something new, you start in the shallow end,
you play with it, you learn a little more,
and pretty soon you're swimming in the deep end, you're an expert.

With git, it's really hard to get there from here,
and there are sharks in the water,
only instead of eating you these sharks eat your work.

So instead we're going to take a deep breath and jump into the deep end.

My goal is to teach you the two things you need to know
in order to learn more on your own.

1.  We're going to learn the language.
    We're going to learn all that jargon,
    so that we can read the manual and actually learn from it.

2.  We're going to learn how to experiment with Git in toy repositories,
    little bitty repositories that we create for ourselves as needed,
    with no real work in them.
    So if we get the repository totally hosed and have to delete the whole thing,
    we don't care.

Let's get started.
