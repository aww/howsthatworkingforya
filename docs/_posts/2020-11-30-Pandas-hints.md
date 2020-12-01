---
layout: post
title: Pandas hints
---

# Unstack is better than pivot

I rarely use `DataFrame.pivot()` because I find it easier to chain `.set_index()` and `.unstack()`.
Those tools are useful in broader contexts and the combination isn't any more characters than `.pivot()`

```
df.pivot(index='year', columns='state', values='population')
df.set_index(['year', 'state'])['population'].unstack()
```

Also, if you want to fill 0 into the empty values you could do

```
df.pivot(index='year', columns='src_id', values='job_listings').fillna(0)
df.set_index(['year', 'src_id'])['job_listings'].unstack(fill_value=0)
```
but the `unstack` version is clearly superior because you keep integers as integers
rather than ending with floats because the NaN intermidiate values.
