class poetic::environment {
  include chrome
  include firefox
  include googledrive
  include sourcetree

  include osx::global::disable_key_press_and_hold
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::enable_scrollwheel_zoom
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control

  class { 'osx::global::key_repeat_delay': delay => 15 }
  class { 'osx::global::key_repeat_rate': rate => 2 }
}
