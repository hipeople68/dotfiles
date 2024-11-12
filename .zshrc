#TODO
#Configure Powerlevel10k
#fancy colours :)
#tab completion could be better
#
if [[ ! -e ~/.zsh/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
if [[ ! -e ~/.zsh/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#keybinds
bindkey -e

#history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

#Start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi


#autocomplete
autoload -Uz compinit
compinit
source /home/emma/.dotfiles/zsh/completions.zsh

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

#syntax highlighting
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#pkfile command not found
source /usr/share/doc/pkgfile/command-not-found.zsh

#prompt
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

#aliases
alias icat="kitty +kitten icat"
alias bookmus="CMUS_HOME=/home/emma/Audiobooks cmus"
alias scratchpad="nvim /home/emma/Documents/scratchpad"
alias rsync="rsync --partial --progress"

#help with marking, remove after job is done
alias markHelper="7z e *.zip && javac *.java"
alias markfxHelper="7z e *.zip && javac-fx *.java"

alias javac-fx="javac --module-path /home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.base.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.controls.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx-swt.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.fxml.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.graphics.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.swing.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.web.jar: --add-modules javafx.controls,javafx.fxml "
alias java-fx="java --module-path /home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.base.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.controls.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx-swt.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.fxml.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.graphics.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.swing.jar:/home/emma/git/fft-s1t03/lib/javafx-sdk-23.0.1/lib/javafx.web.jar: --add-modules javafx.controls,javafx.fxml "

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

#Disable the beep (yay)
setopt NO_BEEP

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
