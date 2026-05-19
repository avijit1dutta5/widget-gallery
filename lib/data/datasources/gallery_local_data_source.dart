import '../models/gallery_widget_model.dart';
import 'widget_source_snippets.dart';

/// In-memory catalog of every reusable widget. Pure data — the live
/// preview for each id is supplied by the presentation layer.
class GalleryLocalDataSource {
  const GalleryLocalDataSource();

  List<GalleryWidgetModel> getWidgets() => const [
        // -------------------------------------------------------- Buttons
        GalleryWidgetModel(
          id: 'app-button',
          title: 'AppButton',
          description:
              'Primary button with optional icon, loading state and full-width layout.',
          category: 'Buttons',
          code: WidgetSourceSnippets.appButton,
        ),
        GalleryWidgetModel(
          id: 'app-outlined-button',
          title: 'AppOutlinedButton',
          description: 'Secondary outlined action button with optional icon.',
          category: 'Buttons',
          code: WidgetSourceSnippets.appButton,
        ),

        // ---------------------------------------------------------- Cards
        GalleryWidgetModel(
          id: 'stat-card',
          title: 'StatCard',
          description:
              'Compact metric card with icon, value, label and trend delta.',
          category: 'Cards',
          code: WidgetSourceSnippets.statCard,
        ),
        GalleryWidgetModel(
          id: 'info-card',
          title: 'InfoCard',
          description:
              'List-style card with leading icon, title, subtitle and trailing slot.',
          category: 'Cards',
          code: WidgetSourceSnippets.infoCard,
        ),
        GalleryWidgetModel(
          id: 'profile-card',
          title: 'ProfileCard',
          description:
              'Profile card with avatar / initials, name, role and a primary action.',
          category: 'Cards',
          code: WidgetSourceSnippets.profileCard,
        ),

        // --------------------------------------------------------- Inputs
        GalleryWidgetModel(
          id: 'app-text-field',
          title: 'AppTextField',
          description:
              'Labelled text field with prefix icon, helper and error text.',
          category: 'Inputs',
          code: WidgetSourceSnippets.appTextField,
        ),
        GalleryWidgetModel(
          id: 'password-field',
          title: 'PasswordField',
          description: 'Password input with a built-in show / hide toggle.',
          category: 'Inputs',
          code: WidgetSourceSnippets.appTextField,
        ),
        GalleryWidgetModel(
          id: 'app-search-bar',
          title: 'AppSearchBar',
          description: 'Rounded search field with a clear button.',
          category: 'Inputs',
          code: WidgetSourceSnippets.appSearchBar,
        ),

        // ------------------------------------------------------- Feedback
        GalleryWidgetModel(
          id: 'app-banner',
          title: 'AppBanner',
          description:
              'Inline info / success / warning / error banner with dismiss.',
          category: 'Feedback',
          code: WidgetSourceSnippets.appBanner,
        ),
        GalleryWidgetModel(
          id: 'labeled-progress-bar',
          title: 'LabeledProgressBar',
          description:
              'Animated labelled progress bar with a percentage readout.',
          category: 'Feedback',
          code: WidgetSourceSnippets.labeledProgressBar,
        ),
        GalleryWidgetModel(
          id: 'loading-indicator',
          title: 'LoadingIndicator',
          description: 'Centered spinner with an optional message.',
          category: 'Feedback',
          code: WidgetSourceSnippets.labeledProgressBar,
        ),
        GalleryWidgetModel(
          id: 'empty-state',
          title: 'EmptyState',
          description: 'Placeholder state with icon, title, message and a CTA.',
          category: 'Feedback',
          code: WidgetSourceSnippets.emptyState,
        ),

        // -------------------------------------------------------- Display
        GalleryWidgetModel(
          id: 'app-avatar',
          title: 'AppAvatar',
          description:
              'Avatar with image / initials fallback and a status dot.',
          category: 'Display',
          code: WidgetSourceSnippets.appAvatar,
        ),
        GalleryWidgetModel(
          id: 'status-badge',
          title: 'StatusBadge',
          description: 'Small colored status pill with optional icon.',
          category: 'Display',
          code: WidgetSourceSnippets.statusBadge,
        ),
        GalleryWidgetModel(
          id: 'tag-chip',
          title: 'TagChip',
          description: 'Selectable / removable tag chip.',
          category: 'Display',
          code: WidgetSourceSnippets.statusBadge,
        ),
        GalleryWidgetModel(
          id: 'rating-stars',
          title: 'RatingStars',
          description: 'Read-only or interactive star rating.',
          category: 'Display',
          code: WidgetSourceSnippets.ratingStars,
        ),
        GalleryWidgetModel(
          id: 'section-header',
          title: 'SectionHeader',
          description: 'Section title with subtitle and a trailing action.',
          category: 'Display',
          code: WidgetSourceSnippets.sectionHeader,
        ),
        GalleryWidgetModel(
          id: 'notification-badge',
          title: 'NotificationBadge',
          description:
              'Count badge overlaid on any icon, with a 99+ cap.',
          category: 'Display',
          code: WidgetSourceSnippets.notificationBadge,
        ),
        GalleryWidgetModel(
          id: 'timeline',
          title: 'Timeline',
          description:
              'Vertical timeline / activity feed with connected nodes.',
          category: 'Display',
          code: WidgetSourceSnippets.timeline,
        ),
        GalleryWidgetModel(
          id: 'expandable-panel',
          title: 'ExpandablePanel',
          description: 'Accordion / FAQ panel that animates open and closed.',
          category: 'Display',
          code: WidgetSourceSnippets.expandablePanel,
        ),

        // -------------------------------------------------------- Buttons
        GalleryWidgetModel(
          id: 'gradient-button',
          title: 'GradientButton',
          description:
              'Bold gradient call-to-action button with optional icon.',
          category: 'Buttons',
          code: WidgetSourceSnippets.gradientButton,
        ),

        // --------------------------------------------------------- Inputs
        GalleryWidgetModel(
          id: 'quantity-selector',
          title: 'QuantitySelector',
          description: 'Integer stepper clamped between a min and max.',
          category: 'Inputs',
          code: WidgetSourceSnippets.quantitySelector,
        ),
        GalleryWidgetModel(
          id: 'otp-input',
          title: 'OtpInput',
          description: 'Fixed-length OTP / PIN entry with auto-advance.',
          category: 'Inputs',
          code: WidgetSourceSnippets.otpInput,
        ),
        GalleryWidgetModel(
          id: 'filter-chip-group',
          title: 'FilterChipGroup',
          description: 'A wrap of multi-selectable filter chips.',
          category: 'Inputs',
          code: WidgetSourceSnippets.filterChipGroup,
        ),

        // ------------------------------------------------------- Feedback
        GalleryWidgetModel(
          id: 'skeleton-loader',
          title: 'SkeletonLoader',
          description: 'Animated shimmer placeholder for loading content.',
          category: 'Feedback',
          code: WidgetSourceSnippets.skeletonLoader,
        ),

        // ------------------------------------------------------- Overlays
        GalleryWidgetModel(
          id: 'confirm-dialog',
          title: 'ConfirmDialog',
          description:
              'Reusable confirm dialog with a Future<bool> show() helper.',
          category: 'Overlays',
          code: WidgetSourceSnippets.confirmDialog,
        ),

        // ----------------------------------------------------- Navigation
        GalleryWidgetModel(
          id: 'app-bottom-nav-bar',
          title: 'AppBottomNavBar',
          description:
              'Pill-style bottom nav where the selected item shows its label.',
          category: 'Navigation',
          code: WidgetSourceSnippets.appBottomNavBar,
        ),
        GalleryWidgetModel(
          id: 'app-tab-bar',
          title: 'AppTabBar',
          description:
              'Controlled segmented top tab bar with an animated pill.',
          category: 'Navigation',
          code: WidgetSourceSnippets.appTabBar,
        ),
        GalleryWidgetModel(
          id: 'step-progress',
          title: 'StepProgress',
          description:
              'Horizontal multi-step indicator for wizards / checkout.',
          category: 'Navigation',
          code: WidgetSourceSnippets.stepProgress,
        ),
        GalleryWidgetModel(
          id: 'breadcrumbs',
          title: 'Breadcrumbs',
          description: 'Tappable path breadcrumb trail.',
          category: 'Navigation',
          code: WidgetSourceSnippets.breadcrumbs,
        ),

        // ---------------------------------------------------------- Forms
        GalleryWidgetModel(
          id: 'app-dropdown-field',
          title: 'AppDropdownField',
          description: 'Generic labelled dropdown / select field.',
          category: 'Forms',
          code: WidgetSourceSnippets.appDropdownField,
        ),
        GalleryWidgetModel(
          id: 'labeled-slider',
          title: 'LabeledSlider',
          description: 'Slider with a label and a live value readout.',
          category: 'Forms',
          code: WidgetSourceSnippets.labeledSlider,
        ),
        GalleryWidgetModel(
          id: 'checkbox-tile',
          title: 'CheckboxTile',
          description: 'Tappable checkbox row with title and subtitle.',
          category: 'Forms',
          code: WidgetSourceSnippets.checkboxTile,
        ),
        GalleryWidgetModel(
          id: 'radio-group',
          title: 'AppRadioGroup',
          description: 'Single-select option group with a custom indicator.',
          category: 'Forms',
          code: WidgetSourceSnippets.radioGroup,
        ),
        GalleryWidgetModel(
          id: 'switch-tile',
          title: 'SwitchTile',
          description: 'Settings-style row with icon, text and a switch.',
          category: 'Forms',
          code: WidgetSourceSnippets.switchTile,
        ),
        GalleryWidgetModel(
          id: 'date-picker-field',
          title: 'DatePickerField',
          description: 'Read-only field that opens a date picker on tap.',
          category: 'Forms',
          code: WidgetSourceSnippets.datePickerField,
        ),

        // --------------------------------------------------------- Layout
        GalleryWidgetModel(
          id: 'labeled-divider',
          title: 'LabeledDivider',
          description: 'Horizontal divider with centered text (e.g. OR).',
          category: 'Layout',
          code: WidgetSourceSnippets.labeledDivider,
        ),
        GalleryWidgetModel(
          id: 'key-value-table',
          title: 'KeyValueTable',
          description: 'Label / value spec table for detail screens.',
          category: 'Layout',
          code: WidgetSourceSnippets.keyValueTable,
        ),
        GalleryWidgetModel(
          id: 'responsive-grid',
          title: 'ResponsiveGrid',
          description: 'Auto-fitting grid that adapts column count to width.',
          category: 'Layout',
          code: WidgetSourceSnippets.responsiveGrid,
        ),

        // --------------------------------------------------------- Display
        GalleryWidgetModel(
          id: 'avatar-group',
          title: 'AvatarGroup',
          description: 'Overlapping stacked avatars with a +N overflow.',
          category: 'Display',
          code: WidgetSourceSnippets.avatarGroup,
        ),
        GalleryWidgetModel(
          id: 'circular-percent',
          title: 'CircularPercent',
          description: 'Animated circular progress ring with center label.',
          category: 'Display',
          code: WidgetSourceSnippets.circularPercent,
        ),
        GalleryWidgetModel(
          id: 'price-tag',
          title: 'PriceTag',
          description:
              'Price with optional old price and a discount badge.',
          category: 'Display',
          code: WidgetSourceSnippets.priceTag,
        ),
        GalleryWidgetModel(
          id: 'image-card',
          title: 'ImageCard',
          description:
              'Network image card with placeholder and title overlay.',
          category: 'Display',
          code: WidgetSourceSnippets.imageCard,
        ),

        // ----------------------------------------------------------- Lists
        GalleryWidgetModel(
          id: 'swipeable-list-item',
          title: 'SwipeableListItem',
          description: 'List row with swipe-to-delete.',
          category: 'Lists',
          code: WidgetSourceSnippets.swipeableListItem,
        ),
        GalleryWidgetModel(
          id: 'selectable-list-tile',
          title: 'SelectableListTile',
          description: 'List tile that highlights and checks when selected.',
          category: 'Lists',
          code: WidgetSourceSnippets.selectableListTile,
        ),
      ];
}
