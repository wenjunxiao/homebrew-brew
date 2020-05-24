# homebrew-brew

  This is a tap for homebrew.

## Usage

  Once this tap is installed, you can install the tools I provided through brew. 
  Such as, [mac-docker-connector](https://github.com/wenjunxiao/mac-docker-connector).
```bash
$ brew tap wenjunxiao/brew
$ brew install docker-connector
```

  Or you can directly install through the following command, when there is a name conflict or not.
```bash
$ brew install wenjunxiao/brew/docker-connector
```

  If github is slow, also can install from [gitee.com](https://gitee.com/wenjunxiao)
```bash
$ brew tap wenjunxiao/brew https://gitee.com/wenjunxiao/homebrew-brew
```

  Here is a command to view the installation location of tap
```
$ cd `brew --repo`/Library/Taps
$ ls
homebrew  wenjunxiao
```

## Slow Solution

  If brew slow and blocked in update stage. you can change the source of repo.
  Use `brew update --verbose` to show which repo is slow.

### `brew core`

  Change the brew core source to [ustc](https://lug.ustc.edu.cn/wiki/mirrors/help/brew.git).
```bash
$ cd "$(brew --repo)"
$ git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
$ git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask"
$ git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
```
  Restore when the mirror is unavailable
```bash
$ cd "$(brew --repo)"
$ git remote set-url origin https://github.com/Homebrew/brew.git
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
$ git remote set-url origin https://github.com/Homebrew/homebrew-core.git
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask"
$ git remote set-url origin https://github.com/Homebrew/homebrew-cask.git
```