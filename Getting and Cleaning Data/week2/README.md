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

_A sample script is given with the codes of this weeks code contents, that uses the **Twitter API**._

<br />

_For codes and other things, please visit [here](https://github.com/ravi-prakash1907/Data-Science-in-R/tree/master/Getting%20and%20Cleaning%20Data/week2)._<br />

<hr />

[_Back to the Course Home_](../)
