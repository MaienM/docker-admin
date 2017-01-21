# docker-adminer

Docker image for adminer. Specifically meant to be used in conjunction with
[MaienM/docker-adminer-gen](https://github.com/MaienM/docker-adminer-gen), but will also function without it as
just a regular, lightweight adminer image.

## Plugins

### Installing

Extra plugins can be installed by dropping the files into a subdirectory of `/plugins`. This can either be done by
just mounting a directory from the host into a subdirectory of `/plugins`, or by another container linked with
`--volumes-from` that automatically sets up a plugin.

An example of a container proving a plugin like this is
[MaienM/docker-adminer-gen](https://github.com/MaienM/docker-adminer-gen), which scans containers and automatically
provides links to tagged database containers.

### Enabling

By default, no plugins are enabled.

The easiest way to enable plugins is to set the environment variable `ENABLED_PLUGINS` to a comma-separated list of
plugin class names. This only works for plugins that require no arguments.

If you want more control, you can mount a file to `/plugins/load.php` that sets the plugins up. Example:

```php
<?php

global $plugins;
$plugins[] = 
```
