# my_cmake.sh
#
# Calls cmake with appropriate arguments.
#
# Make sure you run `. ./get_ready.sh` before you run this.
#
# After you run this, you can `run make; make install`.

PREFIX=/tmp/test-lxqt

cmake ../qtermwidget \
  -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG \
  -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DCMAKE_VERBOSE_MAKEFILE=ON \
  -Wno-dev
