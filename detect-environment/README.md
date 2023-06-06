# Detect environment

This action is used to check the merge branch to determine which environment
to merge to.

Merge branches are:
 - release/uat - matches "uat" environment
 - master - matches "production" environment

If no matched branches exist this will fail

## Outputs

This action has the below outputs:
 - environment: (uat/production) Will be the matched environment.

## Example

```yaml
  - name: Check environment
    id: check_environment
    uses: pixelfusion/actions/detect-environment@v1
  - name: Do thing if changes
    bash: echo "Environment is ${{ steps.check_environment.outputs.environment }}"
```
