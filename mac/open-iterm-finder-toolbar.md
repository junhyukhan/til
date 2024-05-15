I used ChatGPT to solve my workflow issue of opening the current Finder directory in iTerm2. Here's a simple AppleScript to automate it. Save this script as an application and add it to your Finder toolbar for easy access.

```
applescript
Copy code
tell application "Finder"
    set currentDir to (POSIX path of (target of front window as alias))
end tell

tell application "iTerm"
    activate
    set newWindow to (create window with default profile)
    tell current session of newWindow
        write text "cd " & quoted form of currentDir
    end tell
end tell
```
