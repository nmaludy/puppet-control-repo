Add .yaml files here that override specific settings for a given role:: class.

These are useful for the case where we want to override a specific settings
for a given role of servers.

Example, an NTP server (role::ntpserver) will need to have different NTP
settings than an NTP client (role::base). In this case we would create a .yaml
file named role::ntpserver.yaml and override the settings that are unique to
this role.

The names of the .yaml files should be the fully qualified class name, example:
role::mysqlserver.yaml
