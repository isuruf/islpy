function pre_build {
    set -x

    pushd isl
      echo "isl license" >> ../doc/misc.rst
      cat LICENSE >> ../doc/misc.rst
      echo "imath license" >> ../doc/misc.rst
      echo "=============" >> ../doc/misc.rst
      head -n 25 imath/imath.h  >> ../doc/misc.rst
    popd
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c "import islpy"
}

function pip_wheel_cmd {
    local abs_wheelhouse=$1
    pip install pybind11
    pip wheel $(pip_opts) -w $abs_wheelhouse --no-deps . || (clang -DNDEBUG -fwrapv -Wall -arch x86_64 -I/usr/local/include -DUSE_IMATH_FOR_MP=1 -DUSE_SMALL_INT_OPT=1 -Isrc/wrapper -Iisl-supplementary -Iisl/include -Iisl -Iisl/imath -I/Users/runner/work/islpy/islpy/venv/lib/python3.6/site-packages/pybind11/include -I/Users/runner/work/islpy/islpy/venv/lib/python3.6/site-packages/pybind11/include -I/Users/runner/work/islpy/islpy/venv/include -I/Library/Frameworks/Python.framework/Versions/3.6/include/python3.6m -c -std=gnu++14 src/wrapper/wrap_isl_part1.cpp -fvisibility=hidden -DVERSION_INFO="2020.2.2" -fvisibility=hidden -stdlib=libc++ -mmacosx-version-min=10.7 -E)
}

