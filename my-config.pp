$homedir  = "/home/${id}"
$codepath = "${homedir}/code"

# Dotfiles repo
vcsrepo { "${codepath}/dotfiles":
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/jivagoalves/dotfiles.git',
  revision => 'master'
}

# Git stuff
## .gitconfig from my dotfiles repo
file { "${homedir}/.gitconfig":
  ensure  => link,
  target  => "${codepath}/dotfiles/gitconfig",
  require => Vcsrepo["${codepath}/dotfiles"]
}
## .gitignore from my dotfiles repo
file { "${homedir}/.gitignore":
  ensure  => link,
  target  => "${codepath}/dotfiles/gitignore",
  require => Vcsrepo["${codepath}/dotfiles"]
}

# vim-pathogen
include vim

# .vimrc from my dotfiles repo
file { "${vim::vimrc}":
  ensure  => link,
  target  => "${codepath}/dotfiles/vimrc",
  require => Vcsrepo["${codepath}/dotfiles"]
}

# My vim's plugins
vim::bundle { [
  'kien/ctrlp.vim',
  'mattn/gist-vim',
  'claco/jasmine.vim',
  'scrooloose/nerdtree',
  'msanders/snipmate.vim',
  'godlygeek/tabular',
  'jivagoalves/tslime.vim',
  'tpope/vim-bundler',
  'tpope/vim-classpath',
  'guns/vim-clojure-static',
  'kchmck/vim-coffee-script',
  'tpope/vim-commentary',
  'tpope/vim-fireplace',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'tpope/vim-haml',
  'henrik/vim-indexed-search',
  'itspriddle/vim-jquery',
  'plasticboy/vim-markdown',
  'edsono/vim-matchit',
  'tpope/vim-rails',
  'tpope/vim-repeat',
  'vim-ruby/vim-ruby',
  'ecomba/vim-ruby-refactoring',
  'tpope/vim-surround',
  'nelstrom/vim-textobj-rubyblock',
  'lucapette/vim-textobj-underscore',
  'kana/vim-textobj-user',
  'christoomey/vim-tmux-navigator',
  'jgdavey/vim-turbux',
  'tpope/vim-unimpaired',
  'tpope/vim-vividchalk',
  'mattn/webapi-vim',
  'Valloric/YouCompleteMe',
  'rodjek/vim-puppet',
  'scrooloose/syntastic',
]: }

# Tmux
## .tmux.conf from my dotfiles repo
file { "${homedir}/.tmux.conf":
  ensure  => link,
  target  => "${codepath}/dotfiles/tmux.conf",
  require => Vcsrepo["${codepath}/dotfiles"]
}

class { 'youcompleteme':
  require => Vcsrepo["${vim::vimdir}/bundle/YouCompleteMe"]
}
