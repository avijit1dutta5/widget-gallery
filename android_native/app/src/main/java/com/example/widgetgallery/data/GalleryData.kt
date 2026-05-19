package com.example.widgetgallery.data

import com.example.widgetgallery.domain.GalleryRepository
import com.example.widgetgallery.domain.GalleryWidget

/** Data-layer representation; maps to the domain entity. */
data class GalleryWidgetModel(
    val id: String,
    val title: String,
    val description: String,
    val category: String,
    val code: String,
) {
    fun toEntity() = GalleryWidget(id, title, description, category, code)
}

/** In-memory catalog of every reusable widget. */
class GalleryLocalDataSource {
    fun getWidgets(): List<GalleryWidgetModel> = listOf(
        // -------------------------------------------------------- Buttons
        GalleryWidgetModel("app-button", "AppButton",
            "Primary button with optional icon, loading state and full-width layout.",
            "Buttons", WidgetSourceSnippets.appButton),
        GalleryWidgetModel("app-outlined-button", "AppOutlinedButton",
            "Secondary outlined action button with optional icon.",
            "Buttons", WidgetSourceSnippets.appButton),
        GalleryWidgetModel("gradient-button", "GradientButton",
            "Bold gradient call-to-action button with optional icon.",
            "Buttons", WidgetSourceSnippets.gradientButton),

        // ---------------------------------------------------------- Cards
        GalleryWidgetModel("stat-card", "StatCard",
            "Compact metric card with icon, value, label and trend delta.",
            "Cards", WidgetSourceSnippets.statCard),
        GalleryWidgetModel("info-card", "InfoCard",
            "List-style card with leading icon, title, subtitle and trailing slot.",
            "Cards", WidgetSourceSnippets.infoCard),
        GalleryWidgetModel("profile-card", "ProfileCard",
            "Profile card with avatar / initials, name, role and a primary action.",
            "Cards", WidgetSourceSnippets.profileCard),

        // --------------------------------------------------------- Inputs
        GalleryWidgetModel("app-text-field", "AppTextField",
            "Labelled text field with leading icon, helper and error text.",
            "Inputs", WidgetSourceSnippets.appTextField),
        GalleryWidgetModel("password-field", "PasswordField",
            "Password input with a built-in show / hide toggle.",
            "Inputs", WidgetSourceSnippets.appTextField),
        GalleryWidgetModel("app-search-bar", "AppSearchBar",
            "Rounded search field with a clear button.",
            "Inputs", WidgetSourceSnippets.appSearchBar),
        GalleryWidgetModel("quantity-selector", "QuantitySelector",
            "Integer stepper clamped between a min and max.",
            "Inputs", WidgetSourceSnippets.quantitySelector),
        GalleryWidgetModel("otp-input", "OtpInput",
            "Fixed-length OTP / PIN entry with auto-advance.",
            "Inputs", WidgetSourceSnippets.otpInput),
        GalleryWidgetModel("filter-chip-group", "FilterChipGroup",
            "A wrap of multi-selectable filter chips.",
            "Inputs", WidgetSourceSnippets.filterChipGroup),

        // ------------------------------------------------------- Feedback
        GalleryWidgetModel("app-banner", "AppBanner",
            "Inline info / success / warning / error banner with dismiss.",
            "Feedback", WidgetSourceSnippets.appBanner),
        GalleryWidgetModel("labeled-progress-bar", "LabeledProgressBar",
            "Animated labelled progress bar with a percentage readout.",
            "Feedback", WidgetSourceSnippets.labeledProgressBar),
        GalleryWidgetModel("loading-indicator", "LoadingIndicator",
            "Centered spinner with an optional message.",
            "Feedback", WidgetSourceSnippets.labeledProgressBar),
        GalleryWidgetModel("empty-state", "EmptyState",
            "Placeholder state with icon, title, message and a CTA.",
            "Feedback", WidgetSourceSnippets.emptyState),
        GalleryWidgetModel("skeleton-loader", "SkeletonLoader",
            "Animated shimmer placeholder for loading content.",
            "Feedback", WidgetSourceSnippets.skeletonLoader),

        // -------------------------------------------------------- Display
        GalleryWidgetModel("app-avatar", "AppAvatar",
            "Avatar with initials fallback and a status dot.",
            "Display", WidgetSourceSnippets.appAvatar),
        GalleryWidgetModel("status-badge", "StatusBadge",
            "Small colored status pill with optional icon.",
            "Display", WidgetSourceSnippets.statusBadge),
        GalleryWidgetModel("tag-chip", "TagChip",
            "Selectable / removable tag chip.",
            "Display", WidgetSourceSnippets.statusBadge),
        GalleryWidgetModel("rating-stars", "RatingStars",
            "Read-only or interactive star rating.",
            "Display", WidgetSourceSnippets.ratingStars),
        GalleryWidgetModel("section-header", "SectionHeader",
            "Section title with subtitle and a trailing action.",
            "Display", WidgetSourceSnippets.sectionHeader),
        GalleryWidgetModel("notification-badge", "NotificationBadge",
            "Count badge overlaid on any icon, with a 99+ cap.",
            "Display", WidgetSourceSnippets.notificationBadge),
        GalleryWidgetModel("timeline", "Timeline",
            "Vertical timeline / activity feed with connected nodes.",
            "Display", WidgetSourceSnippets.timeline),
        GalleryWidgetModel("expandable-panel", "ExpandablePanel",
            "Accordion / FAQ panel that animates open and closed.",
            "Display", WidgetSourceSnippets.expandablePanel),
        GalleryWidgetModel("avatar-group", "AvatarGroup",
            "Overlapping stacked avatars with a +N overflow.",
            "Display", WidgetSourceSnippets.avatarGroup),
        GalleryWidgetModel("circular-percent", "CircularPercent",
            "Animated circular progress ring with center label.",
            "Display", WidgetSourceSnippets.circularPercent),
        GalleryWidgetModel("price-tag", "PriceTag",
            "Price with optional old price and a discount badge.",
            "Display", WidgetSourceSnippets.priceTag),
        GalleryWidgetModel("image-card", "ImageCard",
            "Image card with a gradient title overlay.",
            "Display", WidgetSourceSnippets.imageCard),

        // ------------------------------------------------------- Overlays
        GalleryWidgetModel("confirm-dialog", "ConfirmDialog",
            "Reusable confirm dialog with a callback result.",
            "Overlays", WidgetSourceSnippets.confirmDialog),

        // ----------------------------------------------------- Navigation
        GalleryWidgetModel("app-bottom-nav-bar", "AppBottomNavBar",
            "Pill-style bottom nav where the selected item shows its label.",
            "Navigation", WidgetSourceSnippets.appBottomNavBar),
        GalleryWidgetModel("app-tab-bar", "AppTabBar",
            "Controlled segmented top tab bar with an animated pill.",
            "Navigation", WidgetSourceSnippets.appTabBar),
        GalleryWidgetModel("step-progress", "StepProgress",
            "Horizontal multi-step indicator for wizards / checkout.",
            "Navigation", WidgetSourceSnippets.stepProgress),
        GalleryWidgetModel("breadcrumbs", "Breadcrumbs",
            "Tappable path breadcrumb trail.",
            "Navigation", WidgetSourceSnippets.breadcrumbs),

        // ---------------------------------------------------------- Forms
        GalleryWidgetModel("app-dropdown-field", "AppDropdownField",
            "Generic labelled dropdown / select field.",
            "Forms", WidgetSourceSnippets.appDropdownField),
        GalleryWidgetModel("labeled-slider", "LabeledSlider",
            "Slider with a label and a live value readout.",
            "Forms", WidgetSourceSnippets.labeledSlider),
        GalleryWidgetModel("checkbox-tile", "CheckboxTile",
            "Tappable checkbox row with title and subtitle.",
            "Forms", WidgetSourceSnippets.checkboxTile),
        GalleryWidgetModel("radio-group", "AppRadioGroup",
            "Single-select option group with a custom indicator.",
            "Forms", WidgetSourceSnippets.radioGroup),
        GalleryWidgetModel("switch-tile", "SwitchTile",
            "Settings-style row with icon, text and a switch.",
            "Forms", WidgetSourceSnippets.switchTile),
        GalleryWidgetModel("date-picker-field", "DatePickerField",
            "Read-only field that opens a date picker on tap.",
            "Forms", WidgetSourceSnippets.datePickerField),

        // --------------------------------------------------------- Layout
        GalleryWidgetModel("labeled-divider", "LabeledDivider",
            "Horizontal divider with centered text (e.g. OR).",
            "Layout", WidgetSourceSnippets.labeledDivider),
        GalleryWidgetModel("key-value-table", "KeyValueTable",
            "Label / value spec table for detail screens.",
            "Layout", WidgetSourceSnippets.keyValueTable),
        GalleryWidgetModel("responsive-grid", "ResponsiveGrid",
            "Auto-fitting grid that adapts column count to width.",
            "Layout", WidgetSourceSnippets.responsiveGrid),

        // ----------------------------------------------------------- Lists
        GalleryWidgetModel("swipeable-list-item", "SwipeableListItem",
            "List row with swipe-to-delete.",
            "Lists", WidgetSourceSnippets.swipeableListItem),
        GalleryWidgetModel("selectable-list-tile", "SelectableListTile",
            "List tile that highlights and checks when selected.",
            "Lists", WidgetSourceSnippets.selectableListTile),
    )
}

class GalleryRepositoryImpl(
    private val local: GalleryLocalDataSource,
) : GalleryRepository {
    override fun getWidgets(): List<GalleryWidget> =
        local.getWidgets().map { it.toEntity() }
}
