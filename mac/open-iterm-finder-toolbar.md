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

Here is a screenshot of my Finder toolbar with the button added:  
(I removed the applescript logo cause it looked ugly)

![image](https://github.com/junhyukhan/til/assets/160210995/15a5ac4f-1471-4cdd-9068-347bf9b265f3) 
I can also use the terminal logo:
![Screenshot 2024-05-16 at 02 25 49](https://github.com/junhyukhan/til/assets/160210995/c2075f11-298f-44e2-aa99-738a12a9d495)

