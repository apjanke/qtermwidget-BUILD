# get_ready.sh
#
# Sets up environment variables for building QTermWidget based on 
# detected installation locations. After running this, you can then
# call `. ./my_cmake.sh` in the same terminal session and it should
# work.
#
# Supports Homebrew-installed Qt and lxqt dependencies. In fact, it expects
# and requires it.
#
# I am no expert on using CMake with brewed Qts, so this might not
# actually be doing things the Right Way. Suggestions welcome.

# We'll start by just trying all the stuff listed in the Homebrew Qt formula's
# caveats.

MY_QT_PREFIX=$(brew --prefix qt)
if [[ $? != 0 ]]; then
    echo >&2 Error: Could not locate Homebrewed Qt installation
    return
fi
echo "Found Homebrewed Qt at $MY_QT_PREFIX"

PATH="$MY_QT_PREFIX/bin:$PATH"
export LDFLAGS="$LDFLAGS -L$MY_QT_PREFIX/lib"
export CPPFLAGS="$CPPFLAGS -I$MY_QT_PREFIX/include"
export PKG_CONFIG_PATH="$MY_QT_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"

# We'll use a Homebrewed lxqt-build-tools. This needs to be installed
# from the octave-app/octave-app-bases tap.

BUILD_TOOLS_PREFIX=$(brew --prefix lxqt-build-tools)
if [[ $? != 0 ]]; then
    echo >&2 Error: Could not locate Homebrewed lxqt-build-tools installation
    return
fi
PATH="$BUILD_TOOLS_PREFIX/bin:$PATH"


echo "Environment variables set up. Ready to configure."
