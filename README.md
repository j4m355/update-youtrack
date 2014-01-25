####To Install

    npm install j4m355/update-youtrack -g

Place credential settings in ``./app/config/settings.json`` 

####Usage

Touch a ``post-commit`` file inside your projects ``.git/hooks/`` folder and insert the following:

    #!/bin/sh
    #
    # An example hook script that is called after a successful
    # commit is made.
    #
    # To enable this hook, rename this file to "post-commit".

    update-youtrack


####To update an issue status:
   
    git commit -am "#issue-id status"