## git redo after undo

after

```
git checkout
git reset
git merge
```

Git keeps track of updates to the tip of branches using a mechanism called reference logs, or "reflogs."

```
λ git reflog
cc35656 HEAD@{0}: commit: workspace setting eclipse
d79c8a9 HEAD@{1}: commit: workspace settings eclipse
810af46 HEAD@{2}: commit: git eclipse git repository sync with remote
86aadd5 HEAD@{3}: commit: readme
5a5d106 HEAD@{4}: commit: vscode launch jasmine test for this file
11cf09f HEAD@{5}: commit: vscode _launch_tasks_json
36cd864 HEAD@{6}: commit: package managers
ff64400 HEAD@{7}: pull --tags origin master: Merge made by the 'recursive' strategy.
c2355f4 HEAD@{8}: commit: centos firewall
940eae1 HEAD@{9}: pull --tags origin master: Merge made by the 'recursive' strategy.
c79d0c4 HEAD@{10}: commit: vscode _launch_tasks_json settings
fda81c0 HEAD@{11}: commit: vscode _launch_tasks_json
1a74854 HEAD@{12}: pull --tags origin master: Fast-forward
75922ef HEAD@{13}: pull: Merge made by the 'recursive' strategy.
250b778 HEAD@{14}: commit: tomcat hot-deploy dynamic-loading
5e46d26 HEAD@{15}: commit: mysql mariadb settings
4db04e1 HEAD@{16}: commit: mysql mariadb settings
f21cbf3 HEAD@{17}: commit: git errors
207d210 HEAD@{18}: pull origin master: Merge made by the 'recursive' strategy.
fdb521e HEAD@{19}: commit: gitignore
f7358ea HEAD@{20}: initial pull
```

reflog for other branch

```
git reflog show otherbranch
```

reflog for stash

```
git reflog stash
```

## Recovering lost commits

```
#make changes to HEAD
git commit -am "some WIP changes"
```

proceed undo it

```
git rebase -i origin/master
```

want redo it, show reflog

```
git reflog
```

recover it with HEAD-ID

```
git reset HEAD@{10}
```
