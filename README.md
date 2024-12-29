My Education
============

Leverages Thor and Ruby  
[gem]: https://rubygems.org/gems/thor  
[homepage]: http://whatisthor.com/

Description
===========

As a student, I want to have a consistently coherent folder structure for my course materials.

This command line utility creates a standard set of directories for each course under a common term,
and provides archiving with tar.

Simple folder structures and tar archives don't become obsolete or require subscriptions.
The goal is to capture course files and information such that it is easy to use with the 
wide variety of courseware used in instruction, and provide an easy mechanism for archiving.  

Wish list:  
S3 cli archive upload
Encryption

Installation
------------
    gem install thor
    clone repository

Usage and documentation
-----------------------
This script was developed and used on linux.

List the commands included

    thor list

Create a root directory in the Documents folder.  

    thor my_education:add_class TERM_NAME CLASS_NAME 

Add a class TERM_NAME CLASS_NAME. 

    thor my_education:add_class uw2024winter drama120

Create an archive file in the archives subfolder

    thor my_education:archive


License
-------
Released under the MIT License.  
See the [license] file for further details.

[license]: LICENSE.md
