csol-widgets
============

A collection of scripts that output various metrics from the CSOL-site and Openbadger databases.

Scripts to be run in the CSOL MySQL database:
application-status-count.sql - Returns a count of applications grouped by status
learner-age-count.sql - Returns a count of learners grouped by age, divided into <13, 13-17, 18-24, and >24
learner-gender-count.sql - Returns a count of learners grouped by gender
learner-race-count.sql - Returns a count of learners grouped by race/ethnicity
learner-school-count.sql - Returns a count of learners grouped by school (likely to be less than beautiful due to typos.  Probably not suitable for display on a widget.)
learner-zip-count.sql - Returns a count of learners grouped by zip code (Likely too large a result set to be displayable by widget)
underage-claim-status-count.sql - Returns a count of badge claims by underage learners grouped by status

Scripts to be run in the Openbadger Mongo DB:
awarded-badge-count.js - Returns a count of non-STEAM badges directly awarded from an external site (i.e. iRemix or CSOL-site)
claimed-badge-count.js - Returns a count of non-STEAM badges awarded by claim code issued from Openbadger
steam-badge-count.js - Returns a count of city-level STEAM badges awarded