# prqu [![Build Status](https://travis-ci.org/lfex/prqu.png?branch=master)](https://travis-ci.org/lfex/prqu)

<img src="resources/public/images/prqu.png"/>

*PR Queues for Github Projects*

## Introduction

Add content to me here!


### Dependencies

This project assumes that you have [rebar]() installed somwhere in your
``$PATH``.

This project depends upon the following, which are installed to the ``deps``
directory of this project when you run ``make deps``:

* [LFE]() (Lisp Flavored Erlang; needed only to compile)
* [lfeunit]() (needed only to run the unit tests)


## Running

``make dev`` and the load up
<a href="http://localhost:5099/">localhost:5099</a>
in your browser.


Usage
=====

Here's how you start using prqu:

* Copy the sample configuration file ``./etc/user-sample.conf`` to
  ``./etc/user.conf``
* Edit the entries in the ``[orgs]``, ``[accounts]``, and ``[projects]``
  sections.
* Reload your page (e.g.,
  <a href="http://localhost:5099/">localhost:5099</a>)
