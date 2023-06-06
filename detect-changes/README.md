# Detect changes

This action will detect changes to a folder and return a boolean
flag if any are found.

Important note: Currently this action ONLY works on merge, not
on pull requests.

## Inputs

All env vars are mandatory, but build-dir can be omitted if building
from root. Make sure that your keys are provided via secrets,
not plain vars.

- work-dir: Optional directory to check for changes. Defaults to root directory

## Outputs

This action has the below outputs:

- changes: (boolean) Will be true / false depending on whether changes
  are found in this directory

## Example

```yaml
  - name: Build docker image for admin
    id: check_changes
    uses: pixelfusion/actions/detect-changes@v1
    with:
      work-dir: 'admin'
  - name: Do thing if changes
    if: ${{ steps.check_changes.outputs.changes == 'true' }}
    bash: echo "There are changes in admin!"
```
