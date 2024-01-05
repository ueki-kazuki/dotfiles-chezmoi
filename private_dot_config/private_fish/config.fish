if status is-interactive
    # Commands to run in interactive sessions can go here
    # set -x LANG ja_JP.utf8
    set EDITOR nvim
    set fish_prompt_hg_status_added "+"
    set fish_color_autosuggestion brblack
    set -x XDG_CONFIG_HOME ~/.config
    fish_add_path /usr/local/bin
    fish_add_path ~/go/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.deno/bin

    set -x NVM_DIR "/usr/local/opt/nvm"
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    # set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    status is-login; and pyenv init --path | source
    pyenv init - | source
    . (rbenv init - | psub)
    eval (direnv hook fish)
    # cf-terraforming completion fish | source
    # ~/bin/chezmoi completion fish | source


    function fish_user_key_bindings
      bind \cr 'peco_select_history (commandline -b)'
      bind \c] peco_select_ghq_repository
    end

    # test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
    complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); /usr/local/bin/aws_completer; end)'

    # tabtab source for serverless package
    # uninstall by removing these lines or running `tabtab uninstall serverless`
    [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
    # tabtab source for sls package
    # uninstall by removing these lines or running `tabtab uninstall sls`
    [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
    # tabtab source for slss package
    # uninstall by removing these lines or running `tabtab uninstall slss`
    [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish

    # tabtab source for packages
    # uninstall by removing these lines
    [ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

    # alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws amazon/aws-cli'


    set -x PIPENV_VENV_IN_PROJECT true
    set -x PIPENV_VERBOSITY -1
    # set pipenv_fish_fancy yes

    # curl is keg-only, which means it was not symlinked into /usr/local,
    # need to have curl first in the PATH
    set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

    # Google Cloud
    set __google_cloud_sdk "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
    [ -f $__google_cloud_sdk ]; and source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"; or true

    # openjdk@11 {{{
    # For the system Java wrappers to find this JDK, symlink it with
    # sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

    # openjdk@11 is keg-only, which means it was not symlinked into /usr/local,
    # because this is an alternate version of another formula.
    set -g fish_user_paths "/usr/local/opt/openjdk@11/bin" $fish_user_paths

    # For compilers to find openjdk@11 you may need to set:
    set -gx CPPFLAGS "-I/usr/local/opt/openjdk@11/include"
    # }}}

end
if which neofetch
  neofetch
end

