### Generating and Applying Patches in Git

#### Generating a Patch

1. **Identify the commit range**: Determine the commits for the patch (e.g., `HEAD~1..HEAD` for the last commit).
2. **Generate the patch file(s)**:
    ```sh
    git format-patch HEAD~1..HEAD
    ```
    For a single patch file for multiple commits:
    ```sh
    git format-patch HEAD~3..HEAD --stdout > my_patch.patch
    ```

#### Applying a Patch

1. **Apply the patch**:
    ```sh
    git apply my_patch.patch
    ```
    For multiple patch files:
    ```sh
    git apply *.patch
    ```
2. **Review the changes**:
    ```sh
    git diff
    ```
3. **Commit the changes**:
    ```sh
    git add .
    git commit -m "Applied patch from my_patch.patch"
    ```

#### Handling Conflicts

1. **Apply with `git am`**:
    ```sh
    git am < my_patch.patch
    ```
2. **Resolve conflicts** and continue:
    ```sh
    git add .
    git am --continue
    ```
    To abort:
    ```sh
    git am --abort
    ```
