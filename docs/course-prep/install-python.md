# Install Python

In the second half of the course, we will do some programming in Python as we learn about the Sockets API and protocols such as HTTP. Of course, this means we will have to install Python.

## Setup Python3
To __install__ python 3 on your machine, follow the brief instructions that are applicable to your OS.

### Mac/Unix users
* Install homebrew package manager:
    * `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* Install python 3: `brew install python3`

### Linux users
* `sudo apt-get install python3.6`

### Windows users
* Follow [this online guide](https://tecadmin.net/install-python-3-windows/)

    !!! info "Note"
        
        If you already have another version of python installed and you do not want to remove it, you can use the `virtualenv` module to run multiple different Python versions on Windows by following [these instructions](http://thebluenode.com/how-to-run-multiple-versions-of-python-on-windows-using-virtualenv). Otherwise, you might have to remove that version __before__ installing Python 3.

## Verify installation

Confirm that python 3 was properly installed by running the following:

* Mac: `python3 --version`
* Linux: `python3 --version`
* Windows: `python -v`

---

_Adapted from Winter 2019 Lab 5 Instructions_