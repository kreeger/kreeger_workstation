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
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::xquartz
- pivotal_workstation::locate_on
- pivotal_workstation::1password
- pivotal_workstation::gem_setup
- pivotal_workstation::bash4
- pivotal_workstation::bash_it
- pivotal_workstation::bash_completion
- pivotal_workstation::coreutils
- pivotal_workstation::findutils
- pivotal_workstation::wget
- pivotal_workstation::pwgen
- pivotal_workstation::siege
- pivotal_workstation::xmlstarlet
- pivotal_workstation::watch
- pivotal_workstation::rvm
- pivotal_workstation::alfred
- pivotal_workstation::chrome
- pivotal_workstation::dropbox
- pivotal_workstation::firefox
- pivotal_workstation::github_for_mac
- pivotal_workstation::bartender
- pivotal_workstation::istatmenus
- pivotal_workstation::phpstorm
- pivotal_workstation::things
- pivotal_workstation::viscosity
- pivotal_workstation::root_shell_bash
- pivotal_workstation::optipng
- pivotal_workstation::jpegoptim
- pivotal_workstation::gnu-tar
- pivotal_workstation::mysql
- pivotal_workstation::postgres
- pivotal_workstation::psycopg2
- pivotal_workstation::mysql-python
- pivotal_workstation::imagemagick
- pivotal_workstation::unhide_home
- pivotal_workstation::php54
- pivotal_workstation::mod-jk
- pivotal_workstation::composer
- pivotal_workstation::sequelpro
- pivotal_workstation::tower
- pivotal_workstation::kaleidoscope2
- pivotal_workstation::omnigraffle
- pivotal_workstation::standby-delay
- pivotal_workstation::expand_save_panel_by_default
- pivotal_workstation::increase_window_resize_speed_for_cocoa_applications
- pivotal_workstation::disable_gatekeeper
- pivotal_workstation::expand_print_panel_by_default
- pivotal_workstation::save_to_disk_not_to_iCloud_by_default
- pivotal_workstation::disable_resume_system-wide
- pivotal_workstation::check_for_software_updates_daily
- pivotal_workstation::restart_automatically_if_the_computer_freezes
- pivotal_workstation::check_for_software_updates_daily
- pivotal_workstation::increase_sound_quality_for_bluetooth_headphones
- pivotal_workstation::enable_full_keyboard_access_for_all_controls
- pivotal_workstation::enable_assistive_devices
- pivotal_workstation::disable_press-and-hold_for_keys_in_favor_of_key_repeat
- pivotal_workstation::set_a_blazingly_fast_keyboard_repeat_rate
- pivotal_workstation::automatically_illuminate_built-in_macbook_keyboard_in_low_light
- pivotal_workstation::turn_off_keyboard_illumination_when_computer_is_not_used_for_5_minutes
- pivotal_workstation::disable_auto-correct
- pivotal_workstation::enable_subpixel_font_rendering_on_non-apple_lcds
- pivotal_workstation::save_screenshots_in_png_format
- pivotal_workstation::save_screenshots_to_the_desktop
- pivotal_workstation::finder_allow_text_selection_in_quick_look
- pivotal_workstation::finder_display_full_path
- pivotal_workstation::search_the_current_folder_by_default
- pivotal_workstation::avoid_creating_ds_store_files_on_network_volumes
- pivotal_workstation::disable_the_warning_when_changing_a_file_extension
- pivotal_workstation::disable_disk_image_verification
- pivotal_workstation::automatically_open_a_new_finder_window_when_a_volume_is_mounted
- pivotal_workstation::use_column_view_in_all_finder_windows_by_default
- pivotal_workstation::disable_the_warning_before_emptying_the_trash
- pivotal_workstation::empty_trash_securely_by_default
- pivotal_workstation::enable_highlight_hover_effect_for_the_grid_view_of_a_stack
- pivotal_workstation::set_the_icon_size_of_dock_items_to_36_pixels
- pivotal_workstation::enable_spring_loading_for_all_dock_items
- pivotal_workstation::show_indicator_lights_for_open_applications_in_the_dock
- pivotal_workstation::do_not_animate_opening_applications_from_the_dock
- pivotal_workstation::speed_up_mission_control_animations
- pivotal_workstation::do_not_group_windows_by_application_in_mission_control
- pivotal_workstation::do_not_show_dashboard_as_a_space
- pivotal_workstation::remove_the_auto-hiding_dock_delay
- pivotal_workstation::remove_the_animation_when_hiding_showing_the_dock
- pivotal_workstation::make_dock_icons_of_hidden_applications_translucent
- pivotal_workstation::position_the_dock_on_the_left_side
- pivotal_workstation::enable_safari_debug_menu
- pivotal_workstation::make_safari_search_banners_default_to_contains_instead_of_starts_with
- pivotal_workstation::add_a_context_menu_item_for_showing_the_web_inspector_in_web_views
- pivotal_workstation::disable_send_and_reply_animations_in_mail
- pivotal_workstation::prevent_time_machine_from_prompting_to_use_new_hard_drives_as_backup_volume
- roderik_workstation::sublime_packages
- roderik_workstation::inputrc
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
