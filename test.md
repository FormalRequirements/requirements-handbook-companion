# Requirements Handbook Companion

:hb-pdf: http://se.ethz.ch/~meyer/down/requirements_handbook/REQUIREMENTS.pdf
:hb-title: Handbook of requirements and business analysis
:hb-url: http://requirements-handbook.org/
:cb-url: https://docs.google.com/document/d/1HrWCRzyW_iTf1QXFFzEoDvvc66IzMCDb3uXGS5GRWz8/edit?usp=sharing

// icons for GitHub
ifdef::env-github[]
:tip-caption: :bulb:
:note-caption: :information_source:
:important-caption: :heavy_exclamation_mark:
:caution-caption: :fire:
:warning-caption: :warning:
endif::[]
//-------------------------------------


WARNING: Work in progress!

//-------------------------------------
== Context

This repository constitutes the companion of the book: link:{hb-pdf}[{hb-title}].
It serves has the basis for the future Handbook's site: {hb-url}

//-------------------------------------
== Overview of the method

=== Overall structure

.The four books of requirements
image::classification.svg[]

//-------------------------------------
== Useful links

- The draft of the Method Book: {hb-pdf}[PDF]
- The draft of the Companion Book: {cb-url}[Google Doc]

ifdef::pdf-backend[]
//-------------------------------------
== Checks results and issues

.Checking URLs result:
--
asciidoc-link-check README.adoc -c .ignore_links.json
--
endif::[]