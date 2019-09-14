# apache_commands

Apache base comands like ubuntu in another unix system


## Installation

To perform the installation you must follow the following steps.

1. Download the repository
2. Have Apache2 installed
3. run install.sh
4. Add `Include conf/sites-enabled/` inside `/etc/httpd/conf/httpd.conf` file

# DESCRIPTION

This page documents the a2ensite and a2dissite commands.

It is not an error to enable a site which is already enabled, or to disable one which is already disabled.

Apache treats the very first virtual host enabled specially as every request not matching any actual directive is being redirected there.

Therefore, it is recommended to name the vhost with the following format "`[numeric_order]-[name].conf`"

## a2ensite

This is a script that enables the specified site (which contains a <VirtualHost> block) within the apache2 configuration.

It is done by creating symlinks within "/etc/httpd/sites/sites-enabled" obtained from "/etc/httpd/sites/sites-available"

### Examples

```bash
    a2ensite vhost.conf
```

## a2dissite

This is a script that disable the specified site within the apache2 configuration.

It is done by removing created symlinks in "/etc/httpd/sites-enabled"

### Examples

```bash
    a2dissite vhost.conf
```

# License

© 2019 Alejandro de Tovar

Licensed under the MIT License.

Please see [License](./LICENSE) File for more information.

<hr>
<a href="https://info.flagcounter.com/4SwE"><img src="https://s01.flagcounter.com/count2/4SwE/bg_FFFFFF/txt_000000/border_FFFFFF/columns_5/maxflags_5/viewers_0/labels_1/pageviews_1/flags_0/percent_1/" alt="Flag Counter" border="0"></a>