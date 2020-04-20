## Next step in Looping

In this week, the _looping functions_ are introduced.<br />
Basically, it elaborates the ```apply()``` even further.

### Significance of ```apply()```

apply() function is very helpful to loop trough the range of things, repetedly and dynamically.<br />
Generally, it's pretty difficult to run a for loop on every sngle column of any R object like _dat frame_ or _table_.<br />
So, in order to achieve this easily, apply function is used.

### Varients of ```apply()```
> ```lapply()``` -> apply on **List**
> ```mapply()``` -> apply on **Matrix**
> ```tapply()``` -> apply on **Tables**
> ```vapply()``` & ```sapply()``` -> apply on **Vectors**

```vapply()``` is considered safer than ```sapply()``` because:
* Slight speed improvement
* Improves consistency by providing limited return type checks

<br />
For better prectice, we can install the ```swirl``` package for this course (JHU) and can practice following:
> lapply & sapply
> vapply & tapply

[Assignment](https://github.com/ravi-prakash1907/Data-Science-in-R/tree/master/R%20Programming/week3/ProgrammingAssignment)

_For codes and other things, please visit [here](https://github.com/ravi-prakash1907/Data-Science-in-R/tree/master/R%20Programming/week3)._<br />

<hr />

[_Back to the Course Home_](../)