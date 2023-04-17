# https://gist.github.com/n-st/74f5ce07391bf8e95f5d8a6b452f6da8
# .bash_profile is executed for login shells,
# .bashrc is executed for interactive non-login shells.
# We want the same behaviour for both, so we source .bashrc from .bash_profile.
# Also, when .bash_profile exists, bash ignores .profile, so we have to source
# it explicitly.

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
