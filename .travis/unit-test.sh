#!/bin/bash

set -e
errors=0

# Run unit tests
python bionitio_testpython/bionitio_testpython_test.py || {
    echo "'python python/bionitio_testpython/bionitio_testpython_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E bionitio_testpython/*.py || {
    echo 'pylint -E bionitio_testpython/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
