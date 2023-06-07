# Detect environment

This action is used to check the merge branch to determine which environment
to merge to.

Merge branches are:
 - release/uat - matches "uat" environment
 - master - matches "production" environment

If no matched branches exist this will fail

## Outputs

This action has the below outputs:
 - environment: (uat/production) Will be the matched environment
 - release_branch: Brarnch name releasing from (e.g. release/uat, master)

## Example

```yaml
jobs:
  prebuild:
    name: Check environment
    outputs:
      environment: ${{ steps.check_environment.outputs.environment }}
    runs-on: ubuntu-latest
    steps:
      - name: Detect environment
        id: check_environment
        uses: pixelfusion/actions/detect-environment@v1
  build:
    name: Build (needs environment)
    runs-on: ubuntu-latest
    needs: prebuild
    environment:
      name: ${{ needs.prebuild.outputs.environment }}
    steps: [] # Your steps go here
```
