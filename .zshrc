#autocomplete
autoload -Uz compinit
compinit

#history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

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

#aliases
alias icat="kitty +kitten icat"
alias bookmus="CMUS_HOME=/home/emma/Audiobooks cmus"

alias javac-fx="javac --module-path /usr/lib/jvm/java-17-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx-swt.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.fxml.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.graphics.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.swing.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.web.jar: --add-modules javafx.controls,javafx.fxml "
alias java-fx="java --module-path /usr/lib/jvm/java-17-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx-swt.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.fxml.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.graphics.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.swing.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.web.jar: --add-modules javafx.controls,javafx.fxml "

eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

#syntax highlighting
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
