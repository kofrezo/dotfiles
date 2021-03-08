# Spotify

There is a community developed Nord theme for Spotify which can be applied
using spicetify-cli.

It is straight forward to install but I decided to leave it out of the
automatic installer because it downloads scripts from the repository directly
and pipes them to the shell and there is enough magic already in the other
setup like vim and zsh with Plug and antigen.

But I leave some instructions here so you can do it manually.

    # Install spicetify-cli
    curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh

    # Download spicetify themes
    cd $HOME/src
    git clone https://github.com/morpheusthewhite/spicetify-themes.git

    # Copy Nord theme
    mkdir -p $HOME/.config/spicetify/Themes
    cd spicetify-themes
    cp -r Nord $HOME/.config/spicetify/Themes

    # Allow spicetify to write into spotify directory
    sudo chmod a+wr /usr/libexec/spotify
    sudo chmod a+wr /usr/libexec/spotify/Apps -R

    # Adjust path for spotify
    vim $HOME.config/spicetify/config.ini
    > spotify_path            = /usr/libexec/spotify

    # Apply Nord theme
    cd $HOME/spicetify-cli
    ./spicetify config current_theme Nord
    ./spicetify config apply

    # Clean this mess up
    rm -rf $HOME/spicetify-cli

You may check the projects for details if something does not work out-of-the
box.

- https://github.com/khanhas/spicetify-cli
- https://github.com/morpheusthewhite/spicetify-themes
