echo "this cannot be run all the way through"
exit 1
# Clone and build
# See http://arjanvandergaag.nl/blog/compiling-vim-with-ruby-support.html
git clone https://github.com/vim/vim.git

./configure --prefix=/usr/local --enable-gui=no --without-x --disable-nls --enable-multibyte --with-tlib=ncurses --enable-pythoninterp --enable-rubyinterp --with-ruby-command=/usr/bin/ruby --with-features=huge # If this fails try wthout ruby.
make
make install

# should now have a `vim` in that directory
# mv it to somewhere in path

git clone https://github.com/christopher-bradshaw/dotfiles ~

# run :VundleInstall

# setup YCM
cd ~/.vim/bundle/YouCompleteMe

./install.py --gocode-completer --tern-completer #--clang-completer --racer-completer
# --all for everything.

npm install -g typescript

# rust
cargo install rustfmt
# add that to path
