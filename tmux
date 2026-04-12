set -g base-index 1
setw -g pane-base-index 1
set -g default-terminal 'screen-256color'
set -ga terminal-overrides ",xterm-256color*:Tc"
set -g status-right "%A, %d %b %Y %l:%M %p"
set-option -g default-shell $SHELL
unbind C-b
set-option -g prefix C-f
bind-key C-f send-prefix

# Clock
set-window-option -g clock-mode-style 12

# vim keybindings in copy mode
set-window-option -g mode-keys vi

# vim-like pane switching
bind -r ^ last-window
bind -r k select-pane -U
bind -r j select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R

# better bindings for me with panes
bind -r C-v split-window
bind -r C-h split-window -h
bind -r Left resize-pane -L 5
bind -r Right resize-pane -R 5
bind -r Up resize-pane -U 5
bind -r Down resize-pane -D 5
