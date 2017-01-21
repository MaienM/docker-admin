<?php

function adminer_object() {
    // Required to run any plugin
    require_once './adminer/plugins/plugin.php';

    // Autoload all plugins
    foreach (glob('./adminer/plugins/*.php') as $filename) {
        require_once "./$filename";
    }

    // Autoload all plugins provided in subfolders of /plugins, for easier addition of extra plugins
    foreach (glob('/plugins/*/*.php') as $filename) {
        require_once $filename;
    }

    // Import file for plugin specifications, allowing you to enable plugins without having to touch this file
    global $plugins;
    $plugins = [];
    @include_once '/plugins/load.php';

    return new AdminerPlugin($plugins);
}

// Include original Adminer
require './adminer/adminer.php';
?>
