package Gtk2Fu;

sub is_installed { (my $mod = "$_[0].pm" ) =~ s!::!/!g; -e "$_/$mod" && return 1 for @INC }

=head1 NAME

Gtk2Fu - GTK2 Forked Ultimate, a powerful layer on top of Gtk2. (forked from ugtk2.)

=head1 INTRODUCTION

gtk2-fu is a layer on top of perl gtk2, that brings power, simplicity and speed
of development. It brings additional methods to ease the widget creation among
other things. But the most important feature is that it brings you a lot of
derivated methods from existing methods, that does exactly the same thing,
except that ir returns the widget. Example :

  $window->set_title('foo');  #the normal method
  $window->set_title_('foo');  #the gtk2-fu derivated method

set_title_ does the same things as set_title, but it returns $window.

What's the advantage? you can chain actions ! Look at the 2 code examples below :

  # normal perl-gtk2
  my $window = Gtk2::Window->new();
  my $entry = Gtk2::Entry->new();
  $entry->set_text('foo');
  $entry->set_editable(0);
  $window->add($entry);

  # using gtk2-fu
  my $window = Gtk2::Window->new();
  $window->add(
    Gtk2::Entry->new()
      ->set_text_('foo')
      ->set_editable_(0)
  );

You could even get rid of the $window declaration. The gain can seem to you
very minor, but in more complex cases, it allows you to create a complex GUI
really easilly. You'll find a bigger example at the end of this documentation

In addition to this feature, gtk2-fu provides a toolbox of useful help methods
to create widgets, ask things to the user, and misc other things.

=head1 HISTORY

gtk2-fu is a fork of ugtk2 (Ultimate gtk2) which is a port to gtk2 of ugtk
(Ultimate gtk), which is an improvment of mygtk, which was the created by pixel
at mandrakesoft, to basically address the same issues.

ugtk2 is great, but mandrakesoft specific, and not clean enough for me. The
derivated methods that return the widget are written one by one by hand; ugtk2
goal is not to be exhaustive, but reduced to the need of mandrakesoft coders,
so it is useless for external coders. In addition, the derivated methods are
not object oriented, you need to call the explicitely. And a lot of helpers
functions use specific things related to the MandrakeLinux installer, config
tools, or Interactive.

OK now to the documentation :

=head1 DESCRIPTION

=head2 DERIVATED METHODS

Not all methods are wrapped so that they can be called with a trailing _ to
return the widget. If you need one that is not yet done, mail me at
<dams@gentoo.org>

=head3 implemented derivated methods

the derivated methods are implemented only for original methods that return
nothing (void). Here is the list of derivated methodes, ordered by classes:

Gnome2::App
    add_dock_item add_toolbar set_contents create_menus create_toolbar
    enable_layout_config insert_menus install_menu_hints set_menus
    remove_menu_range remove_menus set_statusbar_custom set_statusbar
    set_toolbar

Gnome2::AppBar
    clear_prompt clear_stack set_default install_menu_hints pop
    set_progress_percentage set_prompt push refresh set_status

Gnome2::AppHelper
    install_menu_hints_ 

Gnome2::Bonobo::Dock
    add_floating_item_ add_item_ allow_floating_items_ set_client_area_ 

Gnome2::Bonobo::Dock
    set_shadow_type_ 

Gnome2::Canvas 
    set_center_scroll_region_ set_dither_ set_pixels_per_unit_ request_redraw_ 
    set_scroll_region_ scroll_to_ set_stipple_origin_ update_now_ 

Gnome2::Canvas::Bpath
    set_path_def_ 

Gnome2::Canvas::Item 
    affine_absolute_ affine_relative_ grab_focus_ hide_ lower_ lower_to_bottom_ move_ 
    raise_ raise_to_top_ reparent_ request_update_ reset_bounds_ show_ ungrab_ 
    update_bbox_ 

Gnome2::Canvas::PathDef
    closepath_ closepath_current_ curveto_ ensure_space_ finish_ lineto_ 
    lineto_moving_ moveto_ reset_ 

Gnome2::Canvas::RichText
    set_buffer_ copy_clipboard_ cut_clipboard_ paste_clipboard_ 

Gnome2::Canvas::Shape
    set_path_def_ 

Gnome2::Client
    add_static_arg_ set_clone_command_ connect_ set_current_directory_ 
    set_discard_command_ disconnect_ set_environment_ flush_ 
    set_global_config_prefix_ set_priority_ request_interaction_ request_phase_2_ 
    request_save_ set_resign_command_ set_restart_command_ set_restart_style_ 
    save_any_dialog_ save_error_dialog_ set_shutdown_command_ 

Gnome2::ColorPicker
    set_d_ set_dither_ set_i16_ set_i8_ set_title_ set_use_alpha_  

Gnome2::DateEdit
    set_flags_ set_popup_range_ set_time_  

Gnome2::Druid
    append_page_ set_buttons_sensitive_ insert_page_ set_page_ prepend_page_ 
    set_show_finish_ set_show_help_ 

Gnome2::DruidPage
    finish_ prepare_ 

Gnome2::DruidPageEdge
    set_bg_color_ set_logo_bg_color_ set_logo_ set_text_color_ set_text_ 
    set_textbox_color_ set_title_color_ set_title_ set_top_watermark_ set_watermark_ 

Gnome2::DruidPageStandard
    append_item_ set_background_ set_contents_background_ set_logo_background_ 
    set_logo_ set_title_foreground_ set_title_ set_top_watermark_ 

Gnome2::DruidPageStandard
    append_history_ clear_history_ set_history_id_ set_max_saved_ prepend_history_ 

Gnome2::FileEntry 
    set_default_path_ set_directory_entry_ set_filename_ set_modal_ set_title_ 

Gnome2::FontPicker 
    fi_set_show_size_ fi_set_use_font_in_label_ set_mode_ set_preview_text_ set_title_ 
    uw_set_widget_ 

Gnome2::GConf::Client 
    add_dir_ clear_cache_ set_error_handling_ set_ get_list_ notify_remove_ get_pair_ 
    preload_ remove_dir_ suggest_sync_ 

Gnome2::GConf::Engine 
    notify_remove_ remove_dir_ suggest_sync_ 

Gnome2::HRef 
    set_label_ set_text_ set_url_ 

Gnome2::IconEntry 
    set_browse_dialog_title_ set_history_id_ set_max_saved_ set_pixmap_subdir_ 

Gnome2::IconList 
    clear_ set_col_spacing_ focus_icon_ freeze_ set_hadjustment_ set_icon_border_ 
    set_icon_width_ insert_ insert_pixbuf_ moveto_ remove_ set_row_spacing_ 
    select_icon_ set_selection_mode_ set_separators_ set_text_spacing_ thaw_ 
    unselect_icon_ set_vadjustment_ 

Gnome2::IconSelection 
    add_defaults_ add_directory_ clear_ select_icon_ show_icons_ stop_loading_ 

Gnome2::IconTextItem 
    configure_ focus_ select_ setxy_ start_editing_ stop_editing_ 

Gnome2::IconTheme 
    set_allow_svg_ append_search_path_ set_custom_theme_ prepend_search_path_ 
    set_search_path_ 

Gnome2::PasswordDialog 
    set_password_ set_readonly_username_ set_username_ 

Gnome2::PixmapEntry 
    set_pixmap_subdir_ set_preview_ set_preview_size_ 

Gnome2::PopupMenu 
    add_popup_items_ append_from_ attach_to_ do_popup_ 

Gnome2::Print::Config 
    dump_ 

Gnome2::Print::Dialog 
    set_copies_ 

Gnome2::Print::FontPreview 
    set_color_ set_font_ set_phrase_ 

Gnome2::Print::FontSelection 
    set_font_ 

Gnome2::Print::GlyphList 
    advance_ font_ glyph_ kerning_ letterspace_ moveto_ rmoveto_ text_dumb_ 

Gnome2::Print::UnitSelector 
    add_adjustment_ set_bases_ remove_adjustment_ set_unit_  

Gnome2::Rsvg::Handle 
    set_dpi_ set_size_callback_ 

Gnome2::Scores 
    set_color_ set_colors_ set_current_player_ set_def_color_ set_logo_label_ 
    set_logo_label_title_ set_logo_pixmap_ set_logo_widget_ 

Gnome2::ThumbnailFactory 
    create_failed_thumbnail_ save_thumbnail_  

Gnome2::VFS::Application 
    add_mime_type_ set_bool_value_ clear_mime_types_ remove_application_ 
    remove_mime_type_ unset_key_ set_value_ 

Gnome2::VFS::Async::Handle 
    cancel_ close_ read_ write_ 

Gnome2::VFS::Mime::Application 
    save_ 

Gnome2::VFS::URI 
    set_host_name_ set_host_port_ set_password_ set_user_name_  

Gnome2::Vte::Terminal 
    set_allow_bold_ set_audible_bellâ_ set_background_image_file_ 
    set_background_image_ set_background_saturation_ set_background_tint_color_ 
    set_background_transparent_ set_backspace_binding_ set_color_background_ 
    set_color_bold_ set_color_dim_ set_color_foreground_ set_colors_ copy_clipboard_ 
    copy_primary_ set_cursor_blinks_ set_default_colors_ set_delete_binding_ 
    set_emulation_ set_encoding_ feed_ feed_child_ set_font_from_string_ set_font_ 
    im_append_menuitems_ match_clear_all_ match_remove_ match_set_cursor_ 
    match_set_cursor_type_ set_mouse_autohide_ paste_clipboard_ paste_primary_ 
    reset_ set_scroll_background_ set_scroll_on_keystroke_ set_scroll_on_output_ 
    set_scrollback_lines_ set_size_ set_visible_bell_ set_word_chars_ 

Gnome2::Window 
    toplevel_set_title_ 

Gnome2::Wnck::Pager 
    set_n_rows_ set_orientation_ set_screen_ set_shadow_type_ set_show_all_  

Gnome2::Wnck::Screen 
    change_workspace_count_ force_update_ move_viewport_ release_workspace_layout_ 
    toggle_showing_desktop_ 

Gnome2::Wnck::Tasklist 
    set_grouping_limit_ set_icon_loader_ set_include_all_workspaces_ 
    set_minimum_height_ set_minimum_width_ set_screen_ 
    set_switch_workspace_on_unminimize_ 

Gnome2::Wnck::Window 
    activate_ activate_ activate_transient_ activate_transient_ close_ close_ 
    set_icon_geometry_ keyboard_move_ keyboard_size_ maximize_ 
    maximize_horizontally_ maximize_vertically_ minimize_ move_to_workspace_ pin_ 
    shade_ set_skip_pager_ set_skip_tasklist_ stick_ unmaximize_ 
    unmaximize_horizontally_ unmaximize_vertically_ unminimize_ unminimize_ unpin_ 
    unshade_ unstick_ 

Gnome2::Wnck::Workspace 
    activate_ activate_ change_name_ 

=cut

use strict;
use Gtk2;
use vars qw(@ISA %EXPORT_TAGS @EXPORT_OK $VERSION);
@ISA = qw(Exporter);
%EXPORT_TAGS = (
#    helpers => [ qw(add2notebook add_icon_path fill_tiled fill_tiled_coords gtkcolor gtkcreate_img
#                    gtkcreate_pixbuf gtkfontinfo gtkset_background n_line_size set_back_pixbuf set_back_pixmap
#                    string_size string_width string_height wrap_paragraph) ],
#
    create => [ qw(create_window create_entry) ],
    ask => [ qw(ask_from_info_dialog ask_from_warn_dialog ask_from_err_dialog ask_from_dialog) ],

    misc => [ qw(each_index member gtkflush) ],
#    ask => [ qw(ask_browse_tree_info ask_browse_tree_info_given_widgets ask_dir ask_from_entry ask_okcancel ask_warn
#                ask_yesorno ) ],
#    dialogs => [ qw(err_dialog info_dialog warn_dialog) ],

);
$EXPORT_TAGS{all} = [ map { @$_ } values %EXPORT_TAGS ];
@EXPORT_OK = map { @$_ } values %EXPORT_TAGS;

$VERSION = '0.08';

=head2 METHODS for creation

These methods return a widget, ready to use. to use them you need to do :

  use Gtk2Fu qw(:create);
or 

  use Gtk2Fu qw(:all);

=over 4

=item create_window()

 $widget = create_window($title, $type='toplevel', $resizable=1, $modal=0, $border_width=0, $delete_event=sub{})

Creates a window with specified properties. 

=cut

sub create_window {
    my ($title, $type, $resizable, $modal, $border_width, $delete_event) = @_; 
    Gtk2::Window->new($type || 'toplevel')
        ->set_title_($title)
        ->set_resizable_($resizable || 1)
        ->set_modal_($modal || 0)
        ->set_border_width_($border_width || 0)
        ->signal_connect_(delete_event => $delete_event || sub {});
}

=item create_entry()

  $entry = create_entry($text)

Creates an entry with a default text if provided.

=cut

sub create_entry {
    my ($text) = @_;
    my $e = Gtk2::Entry->new;
    $text and $e->set_text($text);
    $e;
}

package Gtk2::Window;
use vars qw(@ISA @EXPORT_OK);
push @EXPORT_OK, qw(create_full_menubar);

=item create_full_menubar()

  $menubar = $window->create_full_menubar($menu_items=
                                          [
                                            [ "/_File" ,undef,0 ,0 ,"<Branch>" ],
                                            [ "/File/_New" ,"<control>N" ,\&callback,0 ,"<StockItem>" ,"gtk-new" ,"create a new file" ],
                                          ],
                                          $start_path='<main>');
  ($menubar, $factory) = $window->create_full_menubar($menu_items=
                                          [
                                            [ "/_File" ,undef,0 ,0 ,"<Branch>" ],
                                            [ "/File/_New" ,"<control>N" ,\&callback,0 ,"<StockItem>" ,"gtk-new" ,"create a new file" ],
                                          ],
                                          $start_path='<main>');

Creates a full menubar with menuitems of any type, and shortcuts. In scalar
context, returns the menubar ready to be added in a box for instance. In list
context, returns the menubar widget, and the factory, for advanced use.
$start_path is optional.

=cut

sub create_full_menubar {
    my ($w, $menu_items, $start_path) = @_;
    $start_path ||= '<main>';
    $w->add_accel_group(my $accel = Gtk2::AccelGroup->new());
    my $f = Gtk2::ItemFactory->new('Gtk2::MenuBar', $start_path, $accel);
    my $w = $f->create_items_($w, @$menu_items)
              ->get_widget($start_path);
    wantarray ? ($w, $f) : $w;
}

package Gtk2::Widget;
use vars qw(@ISA @EXPORT_OK);
push @EXPORT_OK, qw(create_scrolled_window);

=item create_scrolled_window()

  $viewport = $widget->create_scrolled_window($policy=['automatic','automatic'], $viewport_shadow)

Creates a scrolled viewport from a given $widget. Returns the viewport

=cut

sub create_scrolled_window {
     my ($W, $policy, $viewport_shadow) = @_;
     my $w = Gtk2::ScrolledWindow->new(undef, undef);
     $w->set_policy($policy ? @$policy : ('automatic', 'automatic'));
     if (Gtk2Fu::member(ref($W), qw(Gtk2::Layout Gtk2::Text Gtk2::TextView Gtk2::TreeView Gtk2::SimpleList Gtk2::IconView))) {
 	$w->add($W)
     } else {
 	$w->add_with_viewport($W);
     }
     $viewport_shadow and $w->child->set_shadow_type($viewport_shadow);
     $W->can('set_focus_vadjustment') and $W->set_focus_vadjustment($w->get_vadjustment);
     $W->set_left_margin(6) if ref($W) =~ /Gtk2::TextView/;
     $W->show;
     if (ref($W) =~ /Gtk2::TextView|Gtk2::TreeView|Gtk2::SimpleList/) {
     	Gtk2::Frame->new->set_shadow_type_('in')->add_($w)
     } else {
 	$w
     }
 }

=head2 METHODS for interaction with user

These methods create some widgets, launch a main loop, then return a value.

The ask_from_dialog methods display a dialog box and returns a value
corresponding to the button clicked. The dialogs can take $options. $options is
a HASHREF with keys/values tha can be :

=over 2

=item stock => STRING

an icon for the dialog box

=item cancel => BOOLEAN

if set to 1, a cancel button will be added

=item width => INTEGER

set a specific width to the dialog box

=item width => INTEGER

set a specific height to the dialog box

=item transient => BOOLEAN

set the transient state of the dialog box

=item use_markup => BOOLEAN

use markup or not

=back

=item ask_from_info_dialog()

  $widget = ask_from_info_dialog($title, $label, $options={});

Information dialog

=cut

package Gtk2Fu;

sub ask_from_info_dialog {
    my ($title, $label, $options) = @_;
    $options ||= { };
    add2hash_($options, { stock => 'gtk-dialog-info' });
    ask_from_dialog($title, $label, $options);
}

=item ask_from_warn_dialog()

 $widget = ask_from_warn_dialog($title, $label, {});

Warning dialog

=cut

sub ask_from_warn_dialog {
    my ($title, $label, $options) = @_;
    $options ||= { };
    add2hash_($options, { stock => 'gtk-dialog-warning', cancel => 1 });
    ask_from_dialog($title, $label, $options);
}

=item ask_from_err_dialog()

 $widget = ask_from_err_dialog($title, $label, {});

Error dialog

=cut

sub ask_from_err_dialog {
    my ($title, $label, $options) = @_;
    $options ||= { };
    add2hash_($options, { stock => 'gtk-dialog-error' });
    ask_from_dialog($title, $label, $options);
}

sub _create_dialog {
    my ($title, $options) = @_;
    my $dialog = Gtk2::Dialog->new;
    $dialog->set_title($title);
    $dialog->set_position('center');  # center-on-parent doesn't work
    #may_set_icon($dialog, $wm_icon || $::Wizard_pix_up || "wiz_default_up.png");
    $dialog->set_size_request($options->{width} || -1, $options->{height} || -1);
    $dialog->set_modal(1);
    $dialog->set_transient_for($options->{transient}) if $options->{transient};
    $dialog;
}

=item ask_from_dialog()

  $widget = ask_from_dialog($title, $label, {});

Normal dialog

=cut

sub ask_from_dialog {
    my ($title, $label, $options) = @_;
    my $ret = 0;
    my $dialog = _create_dialog($title, $options);
    $dialog->set_border_width(10);
    my $text = ref($label) ? $label : $options->{use_markup} ? Gtk2::WrappedLabel->new->set_markup($label) : Gtk2::WrappedLabel->new($label);
    $dialog->vbox
      ->gtkpack(Gtk2::HBox
                ->new->gtkpack_(if_($options->{stock},
                                    0, Gtk2::Image->new_from_stock($options->{stock}, 'dialog'),
                                    0, Gtk2::Label->new("   "),
                                   ),
                                1, $options->{scroll} ? $text->create_scrolled_window_([ 'never', 'automatic' ]) : $text,
                               ),
               );
    
    if ($options->{cancel}) {
	my $button2 = Gtk2::Button->new('Cancel');
	$button2->signal_connect(clicked => sub { $ret = 0; $dialog->destroy; Gtk2->main_quit });
	$button2->can_default(1);
	$dialog->action_area->pack_start($button2, 1, 1, 0);
    }

    my $button = Gtk2::Button->new('Ok');
    $button->can_default(1);
    $button->signal_connect(clicked => sub { $ret = 1; $dialog->destroy; Gtk2->main_quit });
    $dialog->action_area->pack_start($button, 1, 1, 0);
    $button->grab_default;

    $dialog->set_has_separator(0);;
    $dialog->show_all;
    Gtk2->main;
    $ret;
}

=back

=head2 toolbox METHODS

Packing helpers methods. The methods aim to replace the pack_start and pack_end
methods.

=cut

package Gtk2::Box;
use vars qw(@ISA @EXPORT_OK);
push @EXPORT_OK, qw(gtkpack gtkpack_ gtkpack__ gtkpack2 gtkpack2_ gtkpack2__);

=over 4

=item gtkpack()

  $widget = gtkpack($box, $widget1, $widget2, ...)

Packs $widgets in $box, with expand set to 1 and fill set to 1

=item gtkpack_()

  $widget = gtkpack_($box, 0 => $widget1, 1 => $widget2 ...)

Packs $widgets in $box, with fill set to 1. For each widget, the boolean set
the expand property in the packing.

=item gtkpack__()

  $widget = gtkpack__($box, $widget1, $widget2, ...)

Packs $widgets in $box, with expand set to 0 and fill set to 1

=item gtkpack2()

  $widget = gtkpack2($box, $widget1, $widget2, ...)

Packs $widgets in $box, with expand set to 1 and fill set to 0

=item gtkpack2_()

  $widget = gtkpack2_($box, 0 => $widget1, 1 => $widget2 ...)

Packs $widgets in $box, with fill set to 0. For each widget, the boolean set
the expand property in the packing.

=item gtkpack2__()

  $widget = gtkpack2__($box, $widget1, $widget2, ...)

Packs $widgets in $box, with expand set to 0 and fill set to 0

=back

=cut

sub gtkpack                   { gtkpowerpack(1, 1, @_) }
sub gtkpack_                  { gtkpowerpack('arg', 1, @_) }
sub gtkpack__                 { gtkpowerpack(0, 1, @_) }
sub gtkpack2                  { gtkpowerpack(1, 0, @_) }
sub gtkpack2_                 { gtkpowerpack('arg', 0, @_) }
sub gtkpack2__                { gtkpowerpack(0, 0, @_) }

sub gtkpowerpack {
    #- Get Default Attributes (if any). 2 syntaxes allowed :
    #- gtkpowerpack( {expand => 1, fill => 0}, $box...) : the attributes are picked from a specified hash ref
    #- gtkpowerpack(1, 0, 1, $box, ...) : the attributes are picked from the non-ref list, in the order (expand, fill, padding, pack_end).
    my @attributes_list = qw(expand fill padding pack_end);
    my $default_attrs = {};
    if (ref($_[0]) eq 'HASH') {
	$default_attrs = shift;
    } elsif (!ref($_[0])) {
	foreach (@attributes_list) {
	    ref($_[0]) and last;
	    $default_attrs->{$_} = shift;
	}
    }
    my $box = shift;

    while (@_) {
	#- Get attributes (if specified). 4 syntaxes allowed (default values are undef ie. false...) :
	#- gtkpowerpack({defaultattrs}, $box, $widget1, $widget2, ...) : the attrs are picked from the default ones (if they exist)
	#- gtkpowerpack($box, {fill=>1, expand=>0, ...}, $widget1, ...) : the attributes are picked from a specified hash ref
	#- gtkpowerpack($box, [1,0,1], $widget1, ...) : the attributes are picked from the array ref : (expand, fill, padding, pack_end).
	#- gtkpowerpack({attr=>'arg'}, $box, 1, $widget1, 0, $widget2, etc...) : the 'arg' value will tell gtkpowerpack to always read the 
	#- attr value directly in the arg list (avoiding confusion between value 0 and Gtk::Label("0"). That can simplify some writings but
	#- this arg(s) MUST then be present...
	my (%attr, $attrs);
	ref($_[0]) eq 'HASH' || ref($_[0]) eq 'ARRAY' and $attrs = shift;
	foreach (@attributes_list) {
	    if (($default_attrs->{$_} || '') eq 'arg') {
		ref($_[0]) and die "error in packing definition\n";
		$attr{$_} = shift;
		ref($attrs) eq 'ARRAY' and shift @$attrs;
	    } elsif (ref($attrs) eq 'HASH' && defined($attrs->{$_})) {
		$attr{$_} = $attrs->{$_};
	    } elsif (ref($attrs) eq 'ARRAY') {
		$attr{$_} = shift @$attrs;
	    } elsif (defined($default_attrs->{$_})) {
		$attr{$_} = int $default_attrs->{$_};
	    } else {
		$attr{$_} = 0;
	    }
	}
	#- Get and pack the widget (create it if necessary to  a label...)
	my $widget = ref($_[0]) ? shift : new Gtk2::Label(shift);
	my $pack_call = 'pack_' . ($attr{pack_end} ? 'end' : 'start');
	$box->$pack_call($widget, $attr{expand}, $attr{fill}, $attr{padding});
	$widget->show;
    }
    $box;
}

package Gtk2::WrappedLabel;
sub new {
    my ($_type, $text, $align) = @_;
    my $l = Gtk2::Label->new($text || '');
    $l->set_line_wrap(1);
    $l->set_alignment($align || 0, 0.5);
    return $l;
}

package Gtk2Fu;

=head2 miscellaneous METHODS

miscellaneous helpers methods.

=over 4 

=item gtkflush()

flushes the pending iterations

=back

=cut

sub gtkflush() { Gtk2->main_iteration while Gtk2->events_pending }

do { my ($a, @b) = @$_; eval(qq|
package $a;
use vars qw(\@ISA \@EXPORT_OK);
unshift \@ISA, 'Exporter';
push \@EXPORT_OK, qw(| . join (' ', map { qq(${_}_) } @b) . ");\n" .
join (' ', map { qq(sub ${_}_{ (my \$w=shift)->$_(\@_); \$w }) } @b)); } foreach (

########## Glib 

[qw (
  Glib::Object
    signal_connect

)],

########## Gtk2

[qw (

  Gtk2::Object
    object_sink object_unref object_weakref object_weakunref
    object_destroy object_get object_set object_set_data
    object_set_data_full object_remove_data object_remove_no_notify
    object_set_user_data object_add_arg_type object_set_data_by_id
    object_set_data_by_id_full object_remove_data_by_id
    object_remove_no_notify_by_id

)], [qw (

  Gtk2::Widget
    can_default can_focus
    unref destroy destroyed set unparent show show_now hide show_all
    hide_all map unmap realize unrealize queue_draw queue_resize
    queue_resize_no_redraw draw get_child_requisition
    size_allocate add_accelerator set_accel_path reparent grab_focus
    grab_default set_name set_state set_sensitive set_parent set_parent_window
    set_uposition set_usize set_events add_events set_extension_events
    set_colormap get_pointer set_style ensure_style reset_rc_styles
    push_colormap pop_colormap set_default_colormap set_direction
    set_default_direction shape_combine_mask path class_path modify_style
    modify_fg modify_bg modify_text modify_base modify_font pop_composite_child
    push_composite_child queue_clear queue_clear_area queue_draw_area
    reset_shapes set_app_paintable set_double_buffered set_redraw_on_allocate
    set_composite_name class_install_style_property
    class_install_style_property_parser style_get style_get_property
    style_get_valist child_notify freeze_child_notify get_size_request
    set_child_visible set_size_request thaw_child_notify set_no_show_all
    add_mnemonic_label remove_mnemonic_label

 )], [qw (

  Gtk2::Container
    add remove add_with_properties set_resize_mode check_resize foreach
    foreach_full set_reallocate_redraws set_focus_child set_focus_vadjustment
    set_focus_hadjustment resize_children child_get child_set
    child_get_property child_set_property child_get_valist child_set_valist
    forall set_border_width propagate_expose set_focus_chain unset_focus_chain
    class_install_child_property

)], [qw (

  Gtk2::Frame
    set_label
    set_label_widget
    set_label_align
    set_shadow_type
    get_label_align

)], [qw (

  Gtk2::Window
    set_title set_wmclass set_policy
    set_resizable add_accel_group
    remove_accel_group set_modal set_default_size
    set_geometry_hints set_gravity set_position
    set_transient_for set_destroy_with_parent
    set_screen add_mnemonic remove_mnemonic
    set_focus set_default present
    iconify deiconify stick unstick
    maximize unmaximize fullscreen
    unfullscreen set_keep_above set_keep_below
    begin_resize_drag begin_move_drag
    set_decorated set_frame_dimensions
    set_has_frame set_mnemonic_modifier set_role
    set_type_hint set_skip_taskbar_hint
    set_skip_pager_hint set_accept_focus
    set_focus_on_map get_default_size
    get_frame_dimensions get_position get_size
    move reshow_with_initial_size resize
    set_default_icon_list set_default_icon
    set_default_icon_name set_icon set_icon_list
    set_icon_name set_auto_startup_notification

)], [qw (

  Gtk2::Box
    pack_start pack_end pack_start_defaults pack_end_defaults
    set_homogeneous set_spacing reorder_child query_child_packing
    set_child_packing

)], [qw (

  Gtk2::Button
    clicked enter set_label leave pressed released set_relief set_use_stock
    set_use_underline

)], [qw (

  Gtk2::ButtonBox
    set_layout set_child_size set_child_ipadding set_child_secondary

)], [qw (

  Gtk2::HButtonBox
    set_spacing_default set_layout_default

)], [qw (

  Gtk2::Paned
    add1 add2 pack1 pack2 set_gutter_size set_position

)], [qw (

  Gtk2::ProgressBar
    set_fraction set_orientation pulse set_pulse_step set_text

)], [qw (

  Gtk2::Misc
    set_alignment set_padding get_alignment get_padding

)], [qw (

  Gtk2::Label
    set_text set_attributes set_markup set_markup_with_mnemonic set_pattern
    set_justify set_ellipsize set_width_chars set_line_wrap select_region
    set_mnemonic_widget set_selectable set_text_with_mnemonic set_label
    set_use_markup set_use_underline set_single_line_mode

)], [qw (

  Gtk2::Entry

    set_text append_text prepend_text set_position select_region set_visibility
    set_invisible_char set_editable set_max_length set_activates_default
    set_has_frame set_width_chars set_alignment get_layout_offsets
    set_completion

)], [qw (

  Gtk2::Table

    attach attach_defaults set_col_spacing set_col_spacings set_homogeneous
    resize set_row_spacing set_row_spacings

)], [qw (

  Gtk2::TextView

    set_accepts_tab add_child_at_anchor add_child_in_window
    set_border_window_size set_buffer set_cursor_visible set_editable
    set_indent set_justification set_left_margin move_child set_overwrite
    set_pixels_above_lines set_pixels_below_lines set_pixels_inside_wrap
    set_right_margin scroll_mark_onscreen scroll_to_mark set_tabs set_wrap_mode

)], [qw (

  Gtk2::TextBuffer

    add_selection_clipboard apply_tag apply_tag_by_name begin_user_action
    copy_clipboard cut_clipboard delete delete_mark delete_mark_by_name
    end_user_action insert insert_at_cursor insert_child_anchor insert_pixbuf
    insert_range insert_with_tags insert_with_tags_by_name set_modified
    move_mark move_mark_by_name paste_clipboard place_cursor remove_all_tags
    remove_selection_clipboard remove_tag remove_tag_by_name set_text

)],


# DEPRECATED API #

[qw (
  Gtk2::ItemFactory
    construct add_foreign create_item create_items create_items_ac delete_item
    delete_entry delete_entries popup popup_with_data create_menu_entries
    set_translate_func

 )],

########## Gnome2
!is_installed('Gnome2') ? () :
(

[qw (

  Gnome2::App
    add_dock_item add_toolbar set_contents create_menus create_toolbar
    enable_layout_config insert_menus install_menu_hints set_menus
    remove_menu_range remove_menus set_statusbar_custom set_statusbar
    set_toolbar

)], [qw (

  Gnome2::AppBar
    clear_prompt clear_stack set_default install_menu_hints pop
    set_progress_percentage set_prompt push refresh set_status

)], [qw (

Gnome2::AppHelper
    $bar->install_menu_hints ($uiinfo) 

)], [qw (

Gnome2::Bonobo::Dock
    add_floating_item add_item allow_floating_items set_client_area

)], [qw (

Gnome2::Bonobo::Dock
    set_shadow_type

)], [qw (

Gnome2::Canvas
    set_center_scroll_region set_dither set_pixels_per_unit request_redraw
    set_scroll_region scroll_to set_stipple_origin update_now

)], [qw (

Gnome2::Canvas::Bpath
    set_path_def

)], [qw (

Gnome2::Canvas::Item
    affine_absolute affine_relative grab_focus hide lower lower_to_bottom move
    raise raise_to_top reparent request_update reset_bounds show ungrab
    update_bbox

)], [qw (

Gnome2::Canvas::PathDef
    closepath closepath_current curveto ensure_space finish lineto
    lineto_moving moveto reset

)], [qw (

Gnome2::Canvas::RichText
    set_buffer copy_clipboard cut_clipboard paste_clipboard

)], [qw (

Gnome2::Canvas::Shape
    set_path_def

)], [qw (

Gnome2::Client
    add_static_arg set_clone_command connect set_current_directory
    set_discard_command disconnect set_environment flush
    set_global_config_prefix set_priority request_interaction request_phase_2
    request_save set_resign_command set_restart_command set_restart_style
    save_any_dialog save_error_dialog set_shutdown_command

)], [qw (

Gnome2::ColorPicker
    set_d set_dither set_i16 set_i8 set_title set_use_alpha  

)], [qw (

Gnome2::DateEdit
    set_flags set_popup_range set_time  

)], [qw (

Gnome2::Druid
    append_page set_buttons_sensitive insert_page set_page prepend_page
    set_show_finish set_show_help

)], [qw (

Gnome2::DruidPage
    finish prepare 

)], [qw (

Gnome2::DruidPageEdge
    set_bg_color set_logo_bg_color set_logo set_text_color set_text
    set_textbox_color set_title_color set_title set_top_watermark set_watermark

)], [qw (

Gnome2::DruidPageStandard
    append_item set_background set_contents_background set_logo_background
    set_logo set_title_foreground set_title set_top_watermark

)], [qw (

Gnome2::DruidPageStandard
    append_history clear_history set_history_id set_max_saved prepend_history

)], [qw (

Gnome2::FileEntry
    set_default_path set_directory_entry set_filename set_modal set_title

)], [qw (

Gnome2::FontPicker
    fi_set_show_size fi_set_use_font_in_label set_mode set_preview_text set_title
    uw_set_widget

)], [qw (

Gnome2::GConf::Client
    add_dir clear_cache set_error_handling set get_list notify_remove get_pair
    preload remove_dir suggest_sync

)], [qw (

Gnome2::GConf::Engine
    notify_remove remove_dir suggest_sync 

)], [qw (

Gnome2::HRef
    set_label set_text set_url

)], [qw (

Gnome2::IconEntry
    set_browse_dialog_title set_history_id set_max_saved set_pixmap_subdir

)], [qw (

Gnome2::IconList
    clear set_col_spacing focus_icon freeze set_hadjustment set_icon_border
    set_icon_width insert insert_pixbuf moveto remove set_row_spacing
    select_icon set_selection_mode set_separators set_text_spacing thaw
    unselect_icon set_vadjustment

)], [qw (

Gnome2::IconSelection
    add_defaults add_directory clear select_icon show_icons stop_loading

)], [qw (

Gnome2::IconTextItem
    configure focus select setxy start_editing stop_editing

)], [qw (

Gnome2::IconTheme
    set_allow_svg append_search_path set_custom_theme prepend_search_path
    set_search_path

)], [qw (

Gnome2::PasswordDialog
    set_password set_readonly_username set_username

)], [qw (

Gnome2::PixmapEntry
    set_pixmap_subdir set_preview set_preview_size

)], [qw (

Gnome2::PopupMenu
    add_popup_items append_from attach_to do_popup

)], [qw (

Gnome2::Print::Config
    dump

)], [qw (

Gnome2::Print::Dialog
    set_copies

)], [qw (

Gnome2::Print::FontPreview
    set_color set_font set_phrase

)], [qw (

Gnome2::Print::FontSelection
    set_font

)], [qw (

Gnome2::Print::GlyphList
    advance font glyph kerning letterspace moveto rmoveto text_dumb

)], [qw (

Gnome2::Print::UnitSelector
    add_adjustment set_bases remove_adjustment set_unit  

)], [qw (

Gnome2::Rsvg::Handle
    set_dpi set_size_callback 

)], [qw (

Gnome2::Scores
    set_color set_colors set_current_player set_def_color set_logo_label
    set_logo_label_title set_logo_pixmap set_logo_widget

)], [qw (

Gnome2::ThumbnailFactory
    create_failed_thumbnail save_thumbnail  

)], [qw (

Gnome2::VFS::Application
    add_mime_type set_bool_value clear_mime_types remove_application
    remove_mime_type unset_key set_value

)], [qw (

Gnome2::VFS::Async::Handle
    cancel close read write

)], [qw (

Gnome2::VFS::Mime::Application
    save

)], [qw (

Gnome2::VFS::URI
    set_host_name set_host_port set_password set_user_name  

)], [qw (

Gnome2::Vte::Terminal
    set_allow_bold set_audible_bellâ set_background_image_file
    set_background_image set_background_saturation set_background_tint_color
    set_background_transparent set_backspace_binding set_color_background
    set_color_bold set_color_dim set_color_foreground set_colors copy_clipboard
    copy_primary set_cursor_blinks set_default_colors set_delete_binding
    set_emulation set_encoding feed feed_child set_font_from_string set_font
    im_append_menuitems match_clear_all match_remove match_set_cursor
    match_set_cursor_type set_mouse_autohide paste_clipboard paste_primary
    reset set_scroll_background set_scroll_on_keystroke set_scroll_on_output
    set_scrollback_lines set_size set_visible_bell set_word_chars

)], [qw (

Gnome2::Window
    toplevel_set_title 

)], [qw (

Gnome2::Wnck::Pager
    set_n_rows set_orientation set_screen set_shadow_type set_show_all  

)], [qw (

Gnome2::Wnck::Screen
    change_workspace_count force_update move_viewport release_workspace_layout
    toggle_showing_desktop

)], [qw (

Gnome2::Wnck::Tasklist
    set_grouping_limit set_icon_loader set_include_all_workspaces
    set_minimum_height set_minimum_width set_screen
    set_switch_workspace_on_unminimize

)], [qw (

Gnome2::Wnck::Window
    activate activate activate_transient activate_transient close close
    set_icon_geometry keyboard_move keyboard_size maximize
    maximize_horizontally maximize_vertically minimize move_to_workspace pin
    shade set_skip_pager set_skip_tasklist stick unmaximize
    unmaximize_horizontally unmaximize_vertically unminimize unminimize unpin
    unshade unstick

)], [qw (

Gnome2::Wnck::Workspace
    activate activate change_name 

)],
)
);

package Gtk2Fu;
sub member { my $e = shift; foreach (@_) { $e eq $_ and return 1 } 0 }
sub each_index(&@) {
    my $f = shift;
    my @v; local $::i = 0;
    foreach (@_) {
        &$f($::i);
        $::i++;
    }
}

sub put_in_hash { my ($a, $b) = @_; while (my ($k, $v) = each %{$b || {}}) { $a->{$k} = $v } $a }
sub add2hash    { my ($a, $b) = @_; while (my ($k, $v) = each %{$b || {}}) { $a->{$k} ||= $v } $a }
sub add2hash_   { my ($a, $b) = @_; while (my ($k, $v) = each %{$b || {}}) { exists $a->{$k} or $a->{$k} = $v } $a }
# prototype is needed for things like: if_(/foo/, bar => 'boo')
sub if_($@) {
    my $b = shift;
    $b or return ();
    wantarray || @_ <= 1 or die("if_ called in scalar context with more than one argument " . join(":", caller()));
    wantarray ? @_ : $_[0];
}

1;

=head1 EXAMPLE

  my $w = create_window()
    ->signal_connect_(destroy => sub { Gtk2->main_quit })
    ->set_size_request_(600, 450)
    ->set_border_width_(5)
    ->add_(Gtk2::VBox->new(0,5)
           ->gtkpack_(0, new Gtk2::HBox(0, 0)
                      ->gtkpack_(1, my $darea = Gtk2::DrawingArea->new()
                                    ->signal_connect_(expose_event => \&draw_banner),
                                 0, new Gtk2::VBox(0, 0)
                                    ->gtkpack_(1, '', 0, $arrow_button)
                                ),
                      1, Gtk2::HPaned->new()
                      ->pack1_(new Gtk2::VBox(0, 5)
                               ->gtkpack_(0, new Gtk2::HBox(0, 5)
                                             ->gtkpack_(0, my $search_entry = Gtk2::Entry->new(),
                                                        0, my $search_ok = Gtk2::Button->new('search'),
                                                        0, my $search_label = Gtk2::Label->new(),
                                                       ),
                                          1, $slist->create_scrolled_window()
                                         ), 1, 0
                              )
                      ->pack2_($hpan2 = new Gtk2::VBox(0, 5)
                               ->gtkpack_(0, Gtk2::HBox->new(0, 5)
                                             ->gtkpack_(0, 'flag name :',
                                                        1, my $flag_name = Gtk2::Entry->new()
                                                       ),
                                          0, Gtk2::HBox->new(0, 5)
                                             ->gtkpack__(my $flag_M = Gtk2::CheckButton->new('')
                                                           ->set_sensitive_(0),
                                                         'set in make.defaults'),
                                          0, Gtk2::HBox->new(0, 5)
                                             ->gtkpack__(my $flag_U = Gtk2::CheckButton->new('')
                                                           ->set_sensitive_(0),
                                                         'set in use.defaults'),
                                          0, Gtk2::HBox->new(0, 5)
                                             ->gtkpack__(my $flag_C = Gtk2::CheckButton->new('')
                                                           ->set_sensitive_(0),
                                                         'set in make.conf'),
                                          0, Gtk2::Label->new('description :')
                                             ->set_alignment_(0, 0.5),
                                          1, Gtk2::Frame->new()
                                             ->set_shadow_type_('in')
                                             ->add_($flag_description)
                                         ),
                               1, 0)->set_position_(400),
                      0, Gtk2::HButtonBox->new()
                         ->set_layout_('end')
                         ->gtkpack(Gtk2::Button->new('Cancel')
                                     ->signal_connect_(clicked => sub { Gtk2->main_quit }),
                                   Gtk2::Button->new('OK')
                                     ->signal_connect_(clicked => sub { main_ok() })
                                  )
                     )
          )
    ->show_all_();
  $darea->size(-1, 38);


=head1 COPYRIGHT

Copyright (c) 2004-2005 Damien Krotkine. All rights reserved.
This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
