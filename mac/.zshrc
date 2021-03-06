# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=""
DEFAULT_USER="bobbylindsey"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

sn() {
    grep -rnwi "$HOME/Dropbox/Collections/notes" -e "$1" | sed s_$HOME'/Dropbox/Collections/'__ | grep -i "$1"
}

apply-naming-scheme() {
    # lowercase all folders
    find . -depth -type d -execdir rename -f 'y/A-Z/a-z/' {} \;
    # lowercase all files
    find . -depth -type f -execdir rename -f 'y/A-Z/a-z/' {} \;
    # replace spaces with hyphens for all folders
    find . -depth -type d -execdir rename 's/ /-/g' {} \;
    # replace spaces with hyphens for all files
    find . -depth -type f -execdir rename 's/ /-/g' {} \;
}

build-prod-site() {
    cd ~/Dropbox/me/career/website-and-blog/bobbywlindsey;
    JEKYLL_ENV=production bundle exec jekyll build;
}

build-dev-site() {
    cd ~/Dropbox/me/career/website-and-blog/bobbywlindsey;
    bundle exec jekyll serve --drafts;
}

push-site() {
    rsync -v -rz -e ssh --checksum --delete ~/Dropbox/me/career/website-and-blog/bobbywlindsey/_site/ $1@bobbywlindsey.com:public_html
}

publish2dsi() {
    absfilepath=$(readlink $1)
    python ~/.jupyter/scrub_code_cells.py $absfilepath
    tail -n +2 "$1" > "$1.tmp" && mv "$1.tmp" "$1"
    echo '---\ncategories: ["analyses"]\n---'  | cat - "$1" > temp && mv temp "$1"
}

jarvis-connect() {
    ssh $1@$2 -p 22222
}

jn-connect() {
    ssh -N -L localhost:8888:localhost:8888 $1@$2 -p 22222
}

new-project() {
    cp -r ~/GitProjects/data-science/helpers .
    cp -r ~/GitProjects/data-science/deeplearning .
}

readlink() {
    cd $(dirname $1)         # or  cd ${1%/*}
    echo $PWD/$(basename $1) # or  echo $PWD/${1##*/}
}

create-post() {
    title="$1"
    date="$(date +'%Y-%m-%d')"
    time="$(date +'%H:%M:%S') -0600"
    hyphened_title=${title// /-}
    lower_case_hyphened_title="$(echo $hyphened_title | tr '[A-Z]' '[a-z]')"
    file_name=$date-$lower_case_hyphened_title.md
    touch $file_name
    echo "---\nlayout: post\ncomments: true\ntitle: $title\ndescription: $2\ndate: $date $time\ncategories: [\"$3\"]\n---\n\n" >> $file_name
}

alias db="cd ~/Dropbox/"
alias dls="cd ~/Downloads/"
alias notes="cd ~/Dropbox/Collections/notes"
alias blog="cd ~/Dropbox/me/career/website-and-blog/bobbywlindsey"
alias dsi="cd ~/Dropbox/me/career/technipfmc/dsi"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias projects="cd ~/GitProjects"
alias ds="cd ~/GitProjects/data-science/project-template"
alias zs="source ~/.zshrc"
alias ezs="vim ~/.zshrc"
alias evim="vim ~/.vim_runtime/my_configs.vim"
alias gum="git pull upstream master"
alias clipboard="pbcopy"
alias chrome="/usr/bin/open -a '/Applications/Google Chrome.app'"
alias datagrip="/usr/bin/open -a '/Applications/DataGrip.app'"
alias vim="/usr/bin/open -a '/Applications/MacVim.app'"
alias wan="curl 'https://api.ipify.org'"
alias create="touch"
alias school="cd ~/Dropbox/me/university/grad-school/courses/fall-2017"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias julia="/Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia"

# include Z, yo
if [[ `uname` == 'Darwin' ]]; then
    . `brew --prefix`/etc/profile.d/z.sh
else
    . $HOME/z.sh
fi

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract osx copydir brew npm)

# override default Python
export PATH=/anaconda3/bin:$PATH

source $ZSH/oh-my-zsh.sh

# load pure prompt
autoload -U promptinit; promptinit
prompt pure

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.rvm/scripts/rvm
