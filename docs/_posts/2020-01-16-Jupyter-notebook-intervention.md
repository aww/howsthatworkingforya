---
layout: post
title: Jupyter notebook intervention
---

# Give it a name

I am creating new notebooks all the time and frequently I'm not sure what will come of them.
Will I spend less than an hour on this to answer one simple question?
Or will this expand into a project with a year of updates?
It doesn't matter. *Give that file a name right now!*
I know you, you have more than one `Untitled4.ipynb` on your filesystem.
You probably have one of them open with a kernel running right now.
That ends now.

# Write what you are thinking

When is the last time you used a cell type other than **Code**?
Put down in writing the question that motivated you to write that query and compute those five numbers.
Add some text explaining how that question was answered given the numbers.

# Restart and run all

If you fear this then you risk wasting your time.

# Idempotent

It is not always possible but whenver possible you want every cell to be idempotent.
In this context I mean that you can run one or many times and it doesn't matter, the global state will be the same.

For example, let's say you have DataFrame with a `clicks` column and you need a logarithmic version of it.
***BAD***:
```
df['clicks'] = np.log(df['clicks'])  # Running this two or more times will give you weird results!
```
Instead the best thing to do is
```
df['clicks_log'] = np.log(df['clicks'])
```
or if you really don't want to create a new column then load the clicks data and transform it in the same cell
```
df = get_data()
df['clicks'] = df['clicks'].log()
```

# Clean up your namespace

Do you have three different DataFrames in your global namespace called `users`, `Users`, and `usr`?
You just can't make up your mind, you got lazy with your typing, and you are only really using `usr` now; that's cool.
But guess what, you forgot to change the reference to `user` to `usr` in that one.
Protect yourself by carefully cleaning up after yourself:
```
usr = user
del user
```
This is good use-case for the scratchpad pluggin.

Or, dare I suggest *Restart and run all*? No, you had to wait 10 minutes for query to pull 2GB of data into memory.
You don't want to do that right now. But you can keep things tidy.

# Keep your namespace clean

To create some awesome plot you had to do a series of five crazy transformations
but now the result of each one of those transformations is sitting in the global namespace
as `x`, `x2`, `x3`, `morestuff`, and `result`.
You aren't too proud of that naming "convention" but you are busy person!
There is an easy solution. **Wrap stuff like this in a verbosely named throw-away function** such as

```
def plot_mindblowing_3d_cummulative_histo_dendrite(df):
  x = ...
  x2 = ...
  ...
  result.plot()
```
That way only the function pollutes your namespace.
The risk is that somewhere further along you will intended to reuse the name `result`,
ovewriting it with some new result,
but you accidently do something like
```
...
resul = ...
_, ax = plt.subplots()
ax.plot(result)
```
and are very confused by the "results."
