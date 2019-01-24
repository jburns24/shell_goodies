# shell_goodies
Some config files for the shells I use 
### On a new machine setup
* generate ssh key https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

* `sudo apt-get install git`
* `sudo apt-get install zsh`
* `sudo apt-get install curl`
* `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

* clone jump z `sudo git clone git@github.com:rupa/z.git` then move ~/z to /usr/bin 

* clone this repository

### make symbolic
* `ln -s /home/joshua/git/shell_goodies/zsh/.zshrc /home/joshua/.zshrc`

* `ln -s /home/joshua/git/shell_goodies/zsh/.gitconfig /home/joshua/.gitconfig`

### source .zshrc

### make zsh default shell
* `chsh -s $(which zsh)`

## Finally restart machine
