## RDS module

This module uses SSM to get its root password. Since we don't feel comfortable storing this information in a state file albeit in an encrypted S3 bucket, this module requires creation of /RDS/${var.identifier}_master_password parameter first.

See source/README.md for more details on how to use this module. Since RDS is a complex module we just forked its code into our own repo without any changes to it.
