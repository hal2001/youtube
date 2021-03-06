# Reading data from .csv files and other formats
# Data comes from Blanca Vargas-Govea, Juan Gabriel GonzÃ¡lez-Serna, Rafael Ponce-Mede

# There are a number of ways we can read files. But first here is a small review of how
# to use R commands to see what files you have in a given folder. You can always manage
# files externally if you want. For example you can download them and unzip them using
# your operating system. In RStudio you can move around your hard drive also and do things.
# But R has some commands you can use directly.

# list.files()                # Shows you files in your current directory
# dir.create("some_folder")   # Creates a new folder
# getwd()                     # Shows you what folder you are currently in
# setwd("some_folder_path")   # Changes to a new folder location


# Let's download a CSV file and then read it in.

url <- "https://raw.githubusercontent.com/steviep42/youtube/master/YOUTUBE.DIR/userprofile.csv"
download.file(url,"userprofile.csv")
file.info("userprofile.csv")  # Works on all Operating systems

# These next two are specific to UNIX and Mac OSX

system("ls -lh userprofile.csv")   # How big is the file ? 
system("wc -l userprofile.csv")    # How many lines does it have ? 

# Next we read it in. However, we have to first know if the file has a header row
# Sometimes we know this in advance or we can use our favorite operating system
# command to look at the first few lines of the file to see if there is a header

system("head -2 userprofile.csv")   # Specific to UNIX and Mac OSX

# Note that Windows users can install the GNU utilities to get access to many cool
# UNIX type commands. See http://unxutils.sourceforge.net/

# To read the file we can read it from the hard drive or directly from the
# internet

myFile <- read.table("userprofile.csv",header=T,sep=",")

# Or

url <- "https://raw.githubusercontent.com/steviep42/youtube/master/YOUTUBE.DIR/userprofile.csv"

myFile <- read.table(url,header=T,sep=",")

names(myFile)   # Get the names of the columns

str(myFile)  # Shows us the structure of each column.

# By default R turns strings into factors but if we don't want that we can 
# pass an option to indicate that

myFile <- read.table("userprofile.csv",header=T,sep=",",stringsAsFactors=FALSE)
str(myFile)

# Sometimes it is best to read in just a few lines of a file to see what types of
# data we have. This happens if we don't have access to a description or a code book 
# for the data

myFile <- read.table("userprofile.csv",header=T,sep=",",nrows=5)

# Once we see what type of data we have then we can go back in and read the
# entire file using the "colClasses" option to tell R what the types of columns are
# If we don't provide the colClasses argument then R will guess what format
# the types are. If we tell R what they are then it helps with memory allocation.

myFile <- read.table("userprofile.csv",header=T,sep=",",nrows=5)
classes <- sapply(myFile,class)
myFile <- read.table("userprofile.csv",header=T,sep=",",colClasses=classes)

# Note that you don't have to download the file. You can read it directly from the 
# Internet using the URL

url <- "https://raw.githubusercontent.com/steviep42/youtube/master/YOUTUBE.DIR/userprofile.csv"
mydata <- read.table(url,header=T,sep=",")

## Reading spreadsheets 

# The recommended way is to save the ss to a .csv file
# and then read it in using read.table. However there is a package that will try to directly
# read the spreadsheet itself. You need to install a package called "readxl"

library(readxl)
url <- "https://raw.githubusercontent.com/steviep42/youtube/master/YOUTUBE.DIR/example_excel_spreadsheet.xlsx" 
download.file(url,"example_excel_spreadsheet.xlsx")
data <- read_excel("example_excel_spreadsheet.xlsx")



