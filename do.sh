
export CFLAGS="-g -ggdb3 -O0"
export CXXFLAGS="-g -ggdb3 -O0"

# export CFLAGS="$CFLAGS -fno-common -Wall -Wunused -Wimplicit -Wreturn-type -Wmissing-prototypes -Wmissing-declarations -Wparentheses -Wswitch -Wtrigraphs -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings"
# export CXXFLAGS="$CXXFLAGS -fno-common -Wall -Wunused -Wreturn-type -Wparentheses -Wswitch -Wtrigraphs -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings"
# export PATH=/opt/openpkg/bin:$PATH
# TAG="gcc9"
# export CC=gcc9
# export CXX=g++9

##export CC="gcc-9"
##export CXX="g++-9"
##export CFLAGS="$CFLAGS -fno-omit-frame-pointer -fsanitize=address -fsanitize-recover=address -fno-common -Wall -Wunused -Wimplicit -Wreturn-type -Wmissing-prototypes -Wmissing-declarations -Wparentheses -Wswitch -Wtrigraphs -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings"
##export CXXFLAGS="$CXXFLAGS -fno-omit-frame-pointer -fsanitize=address -fsanitize-recover=address -fno-common -Wall -Wunused -Wreturn-type -Wparentheses -Wswitch -Wtrigraphs -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings"

#export CFLAGS="$CFLAGS -fno-common -Wall -Wunused -Wimplicit -Wreturn-type -Wmissing-prototypes -Wmissing-declarations -Wparentheses -Wswitch -Wtrigraphs -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings"
#export CXXFLAGS="$CXXFLAGS -fno-common -Wall -Wunused -Wreturn-type -Wparentheses -Wswitch -Wtrigraphs -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings"

#export CPPFLAGS="-DMPFR_USE_LOGGING"
#export ASAN_OPTIONS=halt_on_error=0
# bash ./build.sh --parallel   --nostrip 2>&1  | tee out
# bash ./build.sh --parallel --mingw64  --nostrip 2>&1  | tee out

bash ./build.sh   --nostrip 2>&1  | tee out