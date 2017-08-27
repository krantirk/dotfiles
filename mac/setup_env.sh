# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# update Homebrew
brew update
brew upgrade
brew install curl
brew install global
# install gcc
brew install gcc
# install gcc alternative
brew tap homebrew/versions
brew install homebrew/versions/gcc6 --with-all-languages --with-java --with-jit --with-nls
# install R
brew tap homebrew/science
brew install Caskroom/cask/xquartz
brew install r

brew cask install macdown
brew install tree
# install youtube-dl
brew install youtube-dl
# install rename
brew install rename
# install Hack font
brew cask install caskroom/fonts/font-hack
# install Atom text editor
brew cask install atom

# install vim
brew tap zegervdv/zathura
brew install zathura
brew install zathura-pdf-poppler
brew install xdotool
brew cask install skim
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/joshdick/onedark.vim.git ~/.vim_runtime/my_plugins/onedark.vim

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# update default Ruby version
curl -sSL https://get.rvm.io | bash -s stable --ruby
# install OpenAI Gym dependencies
brew install cmake boost boost-python sdl2 swig wget
pip install 'gym[all]'
# install emacs
brew install emacs --HEAD --with-cocoa --srgb
brew linkapps emacs
brew install aspell --lang=en
brew install coreutils
brew install z
brew install node
# install postgresql
brew install postgresql
sudo ln -s /usr/local/Cellar/postgresql /usr/local/opt/postgresql
# install ODBC dependency for R
brew install unixODBC
# install GLUT
brew install freeglut
# install meteor
curl https://install.meteor.com/ | sh
# install js node packages for react dev
npm install -g browserify
npm install -g gulp
npm install -g jshint
npm install -g uglify-js
npm install -g static-server
# some useful npm packages you might use in project
npm install gulp-jshint jshint-stylish --save-dev
npm install gulp-sass --save-dev
npm install gulp-sourcemaps --save-dev
npm install gulp-concat --save-dev
npm install gulp-react --save-dev
npm install gulp-html-replace --save-dev
npm install react react-dom babelify babel-preset-react --save-dev
npm install bootstrap-sass --save-dev
npm install jquery --save-dev
npm install browserify --save-dev
npm install babel-preset-es2015 --sav-dev
npm install react-dom --save-dev
npm install browser-sync gulp --save-dev
npm install browser-sync --save-dev
npm install del --save-dev
npm install watchify --save-dev
npm install gulp-notify --save-dev
npm install superagent --save-dev
npm install glob --save-dev
npm install co --save-dev
npm install react-router --save-dev
npm install react-validate-decorator --save-dev
npm install classnames --save-dev
# install shell script to check internet speed
npm install --global fast-cli
# install shell script to find emojis
npm install --global emoj
# symlink julia executable (path will change with updated versions of Julia)
sudo ln -s /Applications/Julia-0.5.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia
# install conda packages
# conda install feedparser
# conda install -c r r-essentials

# install jupyter theme
# pip install jupyterthemes lesscpy
# jt -t grade3

pip install spotipy
pip install gmusicapi

# To configure atom
# cd ~/.atom/packages/linter-eslint
# npm install eslint-plugin-react
# npm install babel-eslint

# To configure Sublime Text
brew install sublime-text
mkdir ~/bin
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# download cuDNN (must login to Nvidia first): https://developer.nvidia.com/cudnn
# sudo cp include/cudnn.h /Developer/NVIDIA/CUDA-8.0/include
# sudo cp lib/libcudnn* /usr/local/cuda/lib
# create .theanorc file in home directory with contents:
# [global]
# device = gpu0
# floatX = float32

# if getting rvm error with oh my zsh
# rm ~/.zcomp*

brew install freetds
conda install pymssql

pip install luigi
conda install cudatoolkit
