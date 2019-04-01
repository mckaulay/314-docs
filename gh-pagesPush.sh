#!/bin/bash


# @Requirement: all new work must be done in master.

# @Summary:
    # Merges all of the work you did in master into gh-pages.
    # Pushes only relevant files.

mkdocs gh-deploy --clean

# -----------------------------------------
# mkdocs gh-deploy --clean -m "message here"