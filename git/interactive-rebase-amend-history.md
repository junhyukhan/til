# TIL: Removing a Committed Token While Keeping History

## Problem  
I accidentally committed a token into my source code. Since I haven’t pushed it yet, I needed a way to remove the token while preserving my commit history.

## Solution: Using Interactive Rebase  
If the token exists in recent commits, I can use `git rebase -i` to edit those commits.

### Steps:

1. Start an interactive rebase: 
```bash
git rebase -i HEAD~N
```

Replace N with the number of commits I want to go back.
2.	Mark the commit(s) as “edit”
- In the interactive rebase editor, change the keyword pick to edit for the commits that contain the token.
- Save and close the editor.
l
3.	Modify the commit to remove the token:
```bash
git reset HEAD^
```
- This unstages the commit while keeping my changes.
- I manually edit the file to remove the token.

4.	Recommit the clean version:

git add path/to/file
git commit --amend --no-edit


5.	Continue the rebase process:
```bash
git rebase --continue
```
- Repeat steps 3–5 if multiple commits need fixing.

Optional: Force Push if the Repo Was Public

If I had pushed the bad commit, I would need to force push:
```bash
git push origin main --force
```
Warning: This rewrites history, which could affect others if working in a team.

Takeaway
- Avoid committing sensitive data by using .gitignore or environment variables.
- Use git rebase -i for fine-grained history rewriting.
- Revoke and rotate compromised tokens if they were pushed anywhere.