# basics

mydata = data.frame(
  C1 = 1:100,
  C2 = 101:200,
  C3 = 1000:1100
)

# how args are matched in a function (when are named)

# seq changed only cuz' we're naming the paased var
lm(data = mydata, y ~ x, model = FALSE, 1:100)

# seq is kept same
lm(y~x, mydata, 1:100, model = FALSE)  # prefered more

##################################

# NAMING the passed args is a good practice

## Order of exectution of a fun in terms of the passed var:
    # 1) Checked for exect match for NAMED args
    # 2) Checked for partial match
    # 3) Checked for positional match
