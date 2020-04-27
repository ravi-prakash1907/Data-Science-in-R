## Reading Data

In this week we only discuss how to read the data from various sources including **SQL server** & **APIs**.

### Main Sources
Following are the few main sources that are discussed in this 2<sup>nd</sup> week:
1. SQL
2. HDF5
3. Web
4. APIs

### Reading from SQL
This part gives a brief yet satisfactory amount of information regr. reading the data from a MySQL _(or any similar SQL server)_ from scratch. The package used is ```RMySql``` to connect to the _MySQL_ server<br />
Key concepts taught:
> **Connecting** to a SQL Server<br />
> Listing the **databases**<br />
> Listing he **tables** * their **dimentions**<br />
> _Reading the **data**_ from any perticular table<br />
> **Subsetting** the tables<br />
> Executing any desired SQL Query

Few most important functions are: ```dbConnect()```, ```dbGetQuery()```, ```dbSendQuery()```, ```dbReadTable()```, ```dbClearResult()```& ```dbDisconnect()```.


### Reading from HDF5
**HDF5** stores:<br />
> Large Datasets<br />
> Structured Datasets<br />
> **H**ierarchical **D**ata **F**ormat _(HDF)_: because data is stored in groups of Zero or more data sets, along with their matadata.

These files are maily kind of the group or collections of the datasets. The **HDF5** Package for R is installed from **Bioconductors**.<br />
A datase can be written using simple building blocks like matricex or arrays, as well as directly as a data-frame in the _HDF5_.<br /><br />

For further info, [_hdfgroup.org_](https://hdfgroup.org) can be visited.


### Webscraping
This is a very important as well as handy method to **scrap** or **collect the data from the web**, through an _R script_.<br />

**Webscraping** is practically extracting the data from website or an HTML document.<br /><br />

Basically here we have 3 different ways to extract contants fromweb:<br />
> By esteblishing the connection using ```url()```<br />
> Using library ```htmlParseTree()``` function from **XML** package<br />
> Using **httr** package

I personally prefer **httr** package because:
1. Has functionality to **access authenticated websites** as well
2. Can store the auth. detainl in _cookies_ if ```handle()``` is used
3. Can also implement **xPath**


### APIs
**A**pplication **P**rogramming **I**nterfaces are one of the best ways to collected or provide the data.<br /><br />

Things required to use these APIs:<br />
> API key<br />
> API secret key<br />
> Access token<br />
> Access token secret

_A sample script is given with the codes of this weeks code contents, that uses the **Twitter API**._<br />

This Twitter API returns a JSON dat that is extracted using ```content()```<br />
Visit [_twitter documentation_](https://developer.twitter.com/en/docs/) for URL and other info about getting different type of data.

<hr />


### Some other sources

There are _R packages_ for different functionalities! These can be googled easily.<br /><br />

Few handy functions:<br />
1. ```file()``` = used to setup connection i.e. with file available **locally**
2. ```url()``` = used to setup connection over the **internet**
3. ```gzfile()``` & ```bzfile()``` = open conn. with zipped files **.gz** and **.bz2**
4. ```?connections``` can give a far more info

_REMEMBER to close the connection!!_<br />

Few packages:<br />
1. **forign** : to access data fro other programming language
2. **RPostresSQL**
3. **RMongo**

Reading **images**<br />
1. ```jpeg()```
2. ```readbitmap()```
3. ```png()```
4. ```EBImage()``` : by Bioconductor

Reading **audio**<br />
1. ```tuneR()```
2. ```seewave()```

<br />

_**httr** is one of the most important package_<br />
Few of it's importent functions:<br />
* GET
* POST
* PUT
* DELETE

This package is frequently used while data collection using various methods.<br />
Authentications is also done (using user name & password).<br />
Mordern APIs use authentication functions like **Oauth**<br />
_httr_ works with Google, Facebook, Twitter, GitHub etc..<br >

<br />

_For codes and other things, please visit [here](https://github.com/ravi-prakash1907/Data-Science-in-R/tree/master/Getting%20and%20Cleaning%20Data/week2)._<br />

<hr />

[_Back to the Course Home_](../)
