function pre_build {
    set -x

    pushd isl
      echo "isl license" >> ../doc/misc.rst
      cat LICENSE >> ../doc/misc.rst
      echo "imath license" >> ../doc/misc.rst
      echo "=============" >> ../doc/misc.rst
      head -n 25 imath/imath.h  >> ../doc/misc.rst
    popd
    rm -rf /usr/local/include/isl
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c "import islpy"
}

function pip_wheel_cmd {
    local abs_wheelhouse=$1
    pip install pybind11
    pip wheel $(pip_opts) -w $abs_wheelhouse --no-deps .
}

