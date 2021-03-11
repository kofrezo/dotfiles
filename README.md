# Spotify

I decided to not automatically install and apply the Nord theme for Spotify
because it might not be everybody's first choice and the installer would
download things and execute them in (new) local system in the manner of 
curl | sh.

Obviously all the things here are downloaded from somewhere from void 
packages to the vim plugins but I tried to make an educated decision on each
source and tried to keep them to a minimum and choose things that are 
maintained for a long time - I was unsure about Spicetify.

However here are some instructions to install and apply the Spotify Nord theme.

    # Install spicetify-cli which allows you to theme Spotify
    curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh

    # Download the pre made spicetify themes
    cd $HOME/src
    git clone https://github.com/morpheusthewhite/spicetify-themes.git

    # Make Nord theme available to spicetify-cli
    mkdir -p $HOME/.config/spicetify/Themes
    cd spicetify-themes
    cp -r Nord $HOME/.config/spicetify/Themes

    # Allow spicetify-cli to write to the Spotify directory
    sudo chmod a+wr /usr/libexec/spotify
    sudo chmod a+wr /usr/libexec/spotify/Apps -R

    # Give spicetify-cli the hint where to find Spotify
    vim $HOME.config/spicetify/config.ini
    > spotify_path            = /usr/libexec/spotify

    # Now apply the Nord theme using spicetify-cli
    cd $HOME/spicetify-cli
    ./spicetify config current_theme Nord
    ./spicetify config apply

    # Remove spicetify-cli. We only need it once
    rm -rf $HOME/spicetify-cli

If things are outdated or you want to get into more details checkout the 
repositories documentation and don't forget to give them a star.

- https://github.com/khanhas/spicetify-cli
- https://github.com/morpheusthewhite/spicetify-themes
