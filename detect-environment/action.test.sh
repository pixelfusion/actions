#!/bin/bash

function test_script {
  local branch="$1"
  local expected_environment="$2"

  echo "Running test with branch=$branch, expected environment=$expected_environment"

  if [[ $branch == 'master' ]]; then
    environment=production
  elif [[ $branch == release/* ]]; then
    environment_version=${branch#release/}
    environment=$environment_version
  else
    echo "Wrong github branch used"
    exit 1
  fi

  if [[ $environment == $expected_environment ]]; then
    echo "Test passed"
  else
    echo "Test failed: environment=$environment, expected=$expected_environment"
  fi
  echo
}

# Test with master branch
test_script 'master' 'production'

# Test with release/uat branch
test_script 'release/uat' 'uat'

# Test with other release branch
test_script 'release/test' 'test'

# Test with an incorrect branch
test_script 'feature/branch' 'branch' # Should fail
