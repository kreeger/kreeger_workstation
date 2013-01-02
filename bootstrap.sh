#!/bin/bash

if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/.cookbooks; cd ~/.cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD

recipes:
- pivotal_workstation::1password
- pivotal_workstation::alfred
- pivotal_workstation::bettertouchtool
- pivotal_workstation::chrome
- pivotal_workstation::dropbox
- pivotal_workstation::enable_assistive_devices
- pivotal_workstation::evernote
- pivotal_workstation::gem_setup
- pivotal_workstation::git
- pivotal_workstation::github_ssh_keys
- pivotal_workstation::homebrew
- pivotal_workstation::imagemagick
- pivotal_workstation::istatmenus
- pivotal_workstation::iterm2
- pivotal_workstation::java
- pivotal_workstation::node_js
- pivotal_workstation::oh_my_zsh
- pivotal_workstation::rbenv
- pivotal_workstation::screen_sharing_app
- pivotal_workstation::screen_sharing_on
- pivotal_workstation::sequelpro
- pivotal_workstation::set_finder_show_all_hd_on_desktop
- pivotal_workstation::set_finder_show_user_home_in_sidebar
- pivotal_workstation::skype
- pivotal_workstation::ssh_copy_id
- pivotal_workstation::sublime_text
- pivotal_workstation::timemachine_preferences
- pivotal_workstation::tmux
- pivotal_workstation::vagrant
- pivotal_workstation::wget
- pivotal_workstation::xquartz
- pivotal_workstation::zsh
EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
if [[ -d kreeger_workstation ]]; then
  cd kreeger_workstation && git pull && cd ..
else
  git clone https://github.com/kreeger/kreeger_workstation.git
fi

soloist
