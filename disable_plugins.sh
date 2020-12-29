#!/bin/bash
wp_plugin_path='/var/www/html/wp-content/plugins'

if [ -z "$DISABLED_PLUGINS" ]
then
   echo "No plugins to be disabled, skipping..."
else
    IFS=',' read -ra plugin_arr <<< "$DISABLED_PLUGINS"
    for i in "${plugin_arr[@]}"
        do
            echo "Attempting to disable $i"
                if [ -d "${wp_plugin_path}/${i}_DISABLED" ]; then
                    echo "$i is already disabled"
                elif [ -d "${wp_plugin_path}/$i" ]; then
                    mv "${wp_plugin_path}/$i" "${wp_plugin_path}/${i}_DISABLED"
                    echo "$i successfully disabled"
                else
                    echo "$i doesn't exist, so cannot be disabled"
                fi
        done
fi
