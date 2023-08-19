
![img](https://github.com/Gogiu23/Git.sh/blob/main/Images/enter.png)

# Git.sh
Script that check if there are any repository unpushed and clean it before to leave

## TOC

- [Installation](#Installation)
- [Use](#Use)
    
    - [First part](#First-part)
    - [Authomatic Committing](#Authomatic-Committing)
    - [Manual Committing](#Manual-Committing)


## Installation

1. Just clone the repository where you like.

```
git clone https://github.com/Gogiu23/Git.sh.git
```
2, Get inside the directory
```
cd Git.sh
```
3. Once did that be sure to change the permission
```
chmod 774 *.sh
chmod 774 Dependencies/*.sh
```
4. Execute the main archive Git.sh and done.

## Use
Just executing the script as
```bash
./Git.sh
```
It will start the program to run
### First part
At the beginning it will ask where to save the log file, which it will be the records of your session.


<h1 align="center">
    
![](https://github.com/Gogiu23/Git.sh/blob/main/Images/log.png)

</h1>

And then the program it will ask to choose between **Authomatic** or **Manually** commits.


<h1 align="center">

![](https://github.com/Gogiu23/Git.sh/blob/main/Images/pick.png)

</h1>

### Authomatic Committing
Here the programm will search in every folder from your `$HOME` all the repository that changes from the last commit wasn't staged and commits properly.

> **Pay attention that all the commits will be pushed without ask the user any confirmation** 

### Manual Committing

Manual committing will ask at the user to see the:

- `git diff`
- stage the changes with `git add`
- commits the changes with `git commit`

    - Here the programm will ask about the message in the commit. If ignored, the date will be the message in the
    commit
- And finally `git push`

> **The programm will iterate every folder untill there will be none changes unstaged**
