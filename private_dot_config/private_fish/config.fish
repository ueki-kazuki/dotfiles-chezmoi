if status is-interactive
    # Commands to run in interactive sessions can go here
    # set -x LANG ja_JP.utf8
    set EDITOR vim
    set fish_prompt_hg_status_added "+"
    set fish_color_autosuggestion brblack
    set -x XDG_CONFIG_HOME ~/.config
    set -x PATH /usr/local/bin $PATH
    set -x NVM_DIR "/usr/local/opt/nvm"
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    # set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    status is-login; and pyenv init --path | source
    pyenv init - | source
    . (rbenv init - | psub)
    eval (direnv hook fish)
    set -x PATH $HOME/.cargo/bin:$PATH
    # cf-terraforming completion fish | source
    # ~/bin/chezmoi completion fish | source

    
    function fish_user_key_bindings
      bind \cr 'peco_select_history (commandline -b)'
      bind \c] peco_select_ghq_repository
    end
    
    # test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
    complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); /usr/local/bin/aws_completer; end)'
    
    # tabtab source for packages
    # uninstall by removing these lines
    [ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
    
    # alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws amazon/aws-cli'
    
    
    set -x PIPENV_VENV_IN_PROJECT true
    set -x PIPENV_VERBOSITY -1
    # set pipenv_fish_fancy yes
end


