Add .yaml files here that assign roles to nodes (specific servers). Also these
files can override specific settings for the individual node.

Example: we have a node abc123.domain.com we want to set the SNMP contact
   to a special value, we can override just the SNMP contact variable
   encore::snmp::contact in the node's yaml file. It will use all other settings
   from the hierarchy.

The names of the .yaml files should be the fully qualified domain name of the
node, example: abc123.domain.com.yaml
