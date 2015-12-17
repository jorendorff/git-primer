## Configuring git mergetool

http://www.codewrecks.com/blog/index.php/2013/03/19/how-to-configure-diff-and-merge-tool-in-visual-studio-git-tools/

https://onedrive.live.com/prev?id=288FBF38C031D5F3!50350&cid=288FBF38C031D5F3&parId=288FBF38C031D5F3!13982&v=TextFileEditor


    [diff]
            tool = vsdiffmerge
    [difftool]
            prompt = true
    [difftool "vsdiffmerge"]
            cmd = \"C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\Common7\\IDE\\vsdiffmerge.exe\" \"$LOCAL\" \"$REMOTE\" //t
            keepbackup = false
            trustexistcode = true
    [merge]
            tool = vsdiffmerge
    [mergetool]
            prompt = true
    [mergetool "vsdiffmerge"]
            cmd = \"C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\Common7\\IDE\\vsdiffmerge.exe\" \"$REMOTE\" \"$LOCAL\" \"$BASE\" \"$MERGED\" //m
            keepbackup = false
            trustexistcode = true
