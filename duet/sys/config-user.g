;File     : config-user.g
;Effect   : Provides a custom configuration area for the railcore user.
;Use-case : By keeping any custom definitions in this file (such as Z probe attributes, axis minima/maxima and anything else that you wish to override in config.g

M291 P"You do not have a user configuration! This must be created before proceeding" R"Warning!" S2 ; Message waits for response before continuing
M112 ; Emergency stop so they don't hurt themselves