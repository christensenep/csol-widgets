# csol-widgets

A collection of scripts that output various metrics from the CSOL-site and Openbadger databases.

### Scripts to be run in the CSOL MySQL database

Script                          | Output
--------------------------------|-----------------------------------
application-status-count.sql    | A count of applications grouped by status
learner-age-count.sql           | A count of learners grouped by age, divided into &lt;13, 13-17, 18-24, and &gt;24
learner-gender-count.sql        | A count of learners grouped by gender
learner-race-count.sql          | A count of learners grouped by race/ethnicity
learner-school-count.sql        | A count of learners grouped by school (likely to be less than beautiful due to typos.  Probably not suitable for display on a widget.)
learner-zip-count.sql           | A count of learners grouped by zip code (Likely too large a result set to be displayable by widget)
underage-claim-status-count.sql | A count of badge claims by underage learners grouped by status

### Scripts to be run in the Openbadger Mongo DB

Script                          | Output
--------------------------------|-----------------------------------
awarded-badge-count.js          | A count of non-STEAM badges directly awarded from an external site (i.e. iRemix or CSOL-site)
claimed-badge-count.js          | A count of non-STEAM badges awarded by claim code issued from Openbadger
steam-badge-count.js            | A count of city-level STEAM badges awarded