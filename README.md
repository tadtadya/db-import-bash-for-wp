# wordpress-db-import-bash
It is a tool of bash script which rewrites all wordpress DB data with import file.

[Japanease](https://github.com/tadtadya/db-import-bash-for-wp/blob/master/README_ja.md)

## Requirement
- MySQL or MarriaDB
- An environment in which the bash script can be executed.

## Overview
Replace all WordPress DB contents from the specified import file. The processing is performed in the following procedure.

1. Create DB backup
1. Delete all tables in the specified DB
1. DB restore with import file
1. Replace the domain of DB data collectively using wp-cli

## Preparation
Edit the contents of the script according to your own environment.

| variable | Setting |
----|:---
| db_name | WordPress database name |
| db_user | DB connection user name |
| db_pass | DB connection password |
| db_bkfile | DB backup file name default: wp_db_bkup_yyyymmdd_HHMMSS.sql |
| old_domain | before domain name |
| new_domain | after domain name |

### important point
- All bash variables. Please adjust to the usage of bash script variables.
- Validity check of the variable value is not done. Before executing the script, please check the content thoroughly by testing.

## Usage
    db_renew.sh import.sql

