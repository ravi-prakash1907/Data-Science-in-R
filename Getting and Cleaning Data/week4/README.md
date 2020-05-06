## String & Text Manipulation

This week teaches about how to extract, match, or manipulate the string or text data.<br />
The concept of the _Regular Expressions_ (regex) in R is explained in a fantastic manner in this week.<br />

#### Editing Text Variables
Sopposingly we want to rename the columns of a data fram. One way of doing this is just passing new names to the ```colnames()``` function.<br />
But, in case, if we want to just to change the existing name in a particular way, we do use following functions:<br />
* ```strslpit()``` : to separator the passed string
* ```sub()``` or ```gsub()``` : to substitute aomething in the string
* ```grep()``` or ```grepl()``` : to grab some particular elementin the passed dataset

### Regular Expression
1. **^** : for beging of line
2. **$** : end of line
3. **[]** : inclusion
4. **\*** : any num of elements
5. **.** : zero or one element (any)
6. **\_** : at least one occurance
7. \<blah1\>**|**\<blah2\> : extracts all the lines having either of two ....  <>|<>|.....|<>
8. _\[r1 **-** r2\]_ : all elements b/w range r1 to r2
9. **(...+,,,+''')** : a sequence of _...,,,'''_
10. _&lt;blah1&gt;(someSeq)**{1, 5}**&lt;blah2&gt;_ : lines having min 1 or max 5 _(someSeq)_ occrance b/w 2 blahs
11. (someSeq) +**\1** : one more occurance of (someSeq) continuusly ... eg. _blah blah **blah blah**_ 

[This video](https://www.coursera.org/learn/data-cleaning/lecture/QvbWt/regular-expressions-ii) of the course can be seen to cover regex better.

### Working with Dates

There are several ways to extract date but there are some differances.<br />
Eg. ```date()``` returns **character** while ```Sys.date()``` returns **Date**<br /><br />

For **date** in desired format, as ```format("date", "regex format")```<br />
RegEx format for Date:<br />
> **%d** : day of the date ... _12_ <br />
> **%a** : abbr. weekday ... _Mon_ <br />
> **%A** : weekday ... _Monday_ <br />
> **%m** : month num. ... _01_ for January <br />
> **%b** : abbr. month ... _Jan_ <br />
> **%B** : Month ... _January_ <br />
> **%y** : year in 2 num _20_ <br />
> **%Y** : year in 4 num _2020_ <br />

**Eg.** <br />
```
date = "2020-01-03"
format(date, "%a-%b-%d")

# Output
# "Sun Jan 03"
```

**Dates** can be subtracted or added as _integer_. As - <br />
```
nextDay = date+1
format(nextDay, "%a-%b-%d")

# Output
# "Mon Jan 04"
```

Other inbuilt (from core pkg) functions:
* ```wekdays()```
* ```months()```
* ```julian()``` : number of days since origin date
* ```attr(, "origin")``` : origin date i.e. **1970-01-01**


#### Imp. functions from ```library(lubridate)```:
1. ```ymd()``` : eg. ```ymd("2019-12-18")```; day = 18, month = 12, year = 2019

Here separator can be of any type eg. -, /, : etc..
2. ```mdy()```
3. ```dmy()```

Others
4. ```ymd_hms()``` : **tz** attribute can be used to set the _time zone_
5. ```wday()``` : weekday

_This weeks ends by giving info about some data resources from where, the data can be easily collected._

<br />

_For codes and other things, please visit [here](https://github.com/ravi-prakash1907/Data-Science-in-R/tree/master/Getting%20and%20Cleaning%20Data/week4)._<br />

The project of this week can be accessed at a separate repo i.e. [Getting-and-Cleaning-Data-Course-Project](https://github.com/ravi-prakash1907/Getting-and-Cleaning-Data-Course-Project) <br />

<hr />

[_Back to the Course Home_](../)
