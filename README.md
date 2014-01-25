####To Install

    npm install j4m355/update-youtrack -g


#####Users
Place credential settings in ``./app/config/settings.json``.

#####Forkers
If forking ``touch`` a ``_settings.json`` file instead of placing credentials in ``settings.json`` to avoid am accidental commit of credentials.

####Usage

``touch`` a ``post-commit`` file inside your projects ``.git/hooks/`` folder and insert the following:

    #!/bin/sh
    #
    # An example hook script that is called after a successful
    # commit is made.
    #

    update-youtrack


####To update an issue status:
   
    git commit -am "#issue-id status"

