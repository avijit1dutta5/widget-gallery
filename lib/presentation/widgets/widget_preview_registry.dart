import 'package:flutter/material.dart';

import 'app_avatar.dart';
import 'app_banner.dart';
import 'app_bottom_nav_bar.dart';
import 'app_button.dart';
import 'app_dropdown_field.dart';
import 'app_search_bar.dart';
import 'app_tab_bar.dart';
import 'app_text_field.dart';
import 'avatar_group.dart';
import 'breadcrumbs.dart';
import 'checkbox_tile.dart';
import 'circular_percent.dart';
import 'confirm_dialog.dart';
import 'date_picker_field.dart';
import 'empty_state.dart';
import 'expandable_panel.dart';
import 'filter_chip_group.dart';
import 'gradient_button.dart';
import 'image_card.dart';
import 'info_card.dart';
import 'key_value_table.dart';
import 'labeled_divider.dart';
import 'labeled_progress_bar.dart';
import 'labeled_slider.dart';
import 'notification_badge.dart';
import 'otp_input.dart';
import 'price_tag.dart';
import 'profile_card.dart';
import 'quantity_selector.dart';
import 'radio_group.dart';
import 'rating_stars.dart';
import 'responsive_grid.dart';
import 'section_header.dart';
import 'selectable_list_tile.dart';
import 'skeleton_loader.dart';
import 'stat_card.dart';
import 'status_badge.dart';
import 'step_progress.dart';
import 'swipeable_list_item.dart';
import 'switch_tile.dart';
import 'timeline.dart';

/// Maps a gallery widget id to its live, interactive preview.
///
/// Previews are a presentation concern, so they live here rather than in
/// the domain entity or the data layer (which stay pure Dart).
class WidgetPreviewRegistry {
  WidgetPreviewRegistry._();

  static final Map<String, WidgetBuilder> _previews = {
    'app-button': (_) => Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AppButton(label: 'Continue', onPressed: () {}),
            AppButton(label: 'Save', icon: Icons.save, onPressed: () {}),
            const AppButton(label: 'Loading', isLoading: true),
          ],
        ),
    'app-outlined-button': (_) => Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AppOutlinedButton(label: 'Cancel', onPressed: () {}),
            AppOutlinedButton(
                label: 'Share', icon: Icons.share, onPressed: () {}),
          ],
        ),
    'stat-card': (_) => const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            StatCard(
                icon: Icons.attach_money,
                value: '\$48.2k',
                label: 'Revenue',
                trend: '+12.4%'),
            StatCard(
                icon: Icons.people,
                value: '1,204',
                label: 'New users',
                trend: '-3.1%'),
          ],
        ),
    'info-card': (_) => InfoCard(
          icon: Icons.notifications,
          title: 'Push notifications',
          subtitle: 'Get notified about activity',
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
    'profile-card': (_) => ProfileCard(
          name: 'Avijit Dutta',
          role: 'Flutter Developer',
          actionLabel: 'Follow',
          onAction: () {},
        ),
    'app-text-field': (_) => const SizedBox(
          width: 360,
          child: AppTextField(
            label: 'Email',
            hint: 'you@example.com',
            prefixIcon: Icons.email_outlined,
            helperText: "We'll never share your email.",
          ),
        ),
    'password-field': (_) =>
        const SizedBox(width: 360, child: PasswordField()),
    'app-search-bar': (_) =>
        const SizedBox(width: 360, child: AppSearchBar()),
    'app-banner': (_) => const Column(
          children: [
            AppBanner(
                message: 'Profile updated successfully.',
                type: BannerType.success),
            SizedBox(height: 12),
            AppBanner(
                message: 'Your trial ends in 3 days.',
                type: BannerType.warning),
            SizedBox(height: 12),
            AppBanner(
                message: 'Could not connect to server.',
                type: BannerType.error),
          ],
        ),
    'labeled-progress-bar': (_) => const SizedBox(
          width: 360,
          child: Column(
            children: [
              LabeledProgressBar(label: 'Upload', value: 0.72),
              SizedBox(height: 20),
              LabeledProgressBar(label: 'Storage used', value: 0.35),
            ],
          ),
        ),
    'loading-indicator': (_) => const SizedBox(
          height: 120,
          child: LoadingIndicator(message: 'Loading your data…'),
        ),
    'empty-state': (_) => SizedBox(
          height: 360,
          child: EmptyState(
            icon: Icons.inbox_outlined,
            title: 'No messages yet',
            message: 'When you receive messages they will show up here.',
            actionLabel: 'Refresh',
            onAction: () {},
          ),
        ),
    'app-avatar': (_) => const Wrap(
          spacing: 20,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AppAvatar(name: 'Avijit Dutta', online: true),
            AppAvatar(name: 'Sara Khan', radius: 36, online: false),
            AppAvatar(name: 'M', radius: 24),
          ],
        ),
    'status-badge': (_) => const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            StatusBadge(label: 'Active', icon: Icons.check_circle),
            StatusBadge(label: 'Pending'),
            StatusBadge(label: 'Failed', color: Colors.red),
          ],
        ),
    'tag-chip': (_) => Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            TagChip(label: 'Flutter', selected: true, onTap: () {}),
            TagChip(label: 'Dart', onTap: () {}),
            TagChip(label: 'Removable', onRemove: () {}),
          ],
        ),
    'rating-stars': (_) => const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingStars(rating: 3.5),
            SizedBox(height: 12),
            RatingStars(rating: 5),
          ],
        ),
    'section-header': (_) => SizedBox(
          width: 400,
          child: SectionHeader(
            title: 'Recent activity',
            subtitle: 'Updates from the last 7 days',
            actionLabel: 'See all',
            onAction: () {},
          ),
        ),
    'notification-badge': (_) => const Wrap(
          spacing: 28,
          children: [
            NotificationBadge(
                count: 3, child: Icon(Icons.notifications, size: 32)),
            NotificationBadge(
                count: 128, child: Icon(Icons.mail_outline, size: 32)),
          ],
        ),
    'timeline': (_) => const SizedBox(
          width: 360,
          child: Timeline(
            entries: [
              TimelineEntry(
                  title: 'Order placed',
                  subtitle: 'Today, 9:24 AM',
                  done: true),
              TimelineEntry(
                  title: 'Shipped',
                  subtitle: 'Today, 2:10 PM',
                  done: true),
              TimelineEntry(
                  title: 'Out for delivery',
                  subtitle: 'Pending'),
              TimelineEntry(
                  title: 'Delivered', subtitle: 'Pending'),
            ],
          ),
        ),
    'expandable-panel': (_) => const SizedBox(
          width: 400,
          child: ExpandablePanel(
            title: 'What is your refund policy?',
            initiallyExpanded: true,
            child: Text(
                'You can request a full refund within 30 days of purchase, '
                'no questions asked.'),
          ),
        ),
    'gradient-button': (_) => Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            GradientButton(label: 'Get started', onPressed: () {}),
            GradientButton(
                label: 'Upgrade',
                icon: Icons.bolt,
                onPressed: () {}),
          ],
        ),
    'quantity-selector': (_) => _QuantityDemo(),
    'otp-input': (_) => const OtpInput(length: 4),
    'filter-chip-group': (_) => _FilterDemo(),
    'skeleton-loader': (_) => const SizedBox(
          width: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLoader(height: 20, width: 180),
              SizedBox(height: 12),
              SkeletonLoader(height: 14),
              SizedBox(height: 8),
              SkeletonLoader(height: 14),
              SizedBox(height: 8),
              SkeletonLoader(height: 14, width: 220),
            ],
          ),
        ),
    'confirm-dialog': (context) => FilledButton(
          onPressed: () => ConfirmDialog.show(
            context,
            title: 'Delete item?',
            message: 'This action cannot be undone.',
            confirmLabel: 'Delete',
            destructive: true,
          ),
          child: const Text('Open dialog'),
        ),
    'app-bottom-nav-bar': (_) => _BottomNavDemo(),
    'app-tab-bar': (_) => _TabBarDemo(),
    'step-progress': (_) => const SizedBox(
          width: 420,
          child: StepProgress(
            currentStep: 1,
            steps: ['Cart', 'Address', 'Payment', 'Done'],
          ),
        ),
    'breadcrumbs': (_) => const Breadcrumbs(
          crumbs: ['Home', 'Catalog', 'Shoes', 'Running'],
        ),
    'app-dropdown-field': (_) => _DropdownDemo(),
    'labeled-slider': (_) => _SliderDemo(),
    'checkbox-tile': (_) => _CheckboxDemo(),
    'radio-group': (_) => _RadioDemo(),
    'switch-tile': (_) => _SwitchDemo(),
    'date-picker-field': (_) => _DateDemo(),
    'labeled-divider': (_) => const SizedBox(
          width: 360,
          child: LabeledDivider(label: 'OR'),
        ),
    'key-value-table': (_) => const SizedBox(
          width: 380,
          child: KeyValueTable(
            rows: [
              KeyValue('Order ID', '#A1B2C3'),
              KeyValue('Status', 'Shipped'),
              KeyValue('Total', '\$129.00'),
              KeyValue('Delivery', 'May 24, 2026'),
            ],
          ),
        ),
    'responsive-grid': (_) => SizedBox(
          width: 420,
          child: ResponsiveGrid(
            maxTileWidth: 130,
            children: List.generate(
              6,
              (i) => Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[i % Colors.primaries.length]
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text('Tile ${i + 1}')),
              ),
            ),
          ),
        ),
    'avatar-group': (_) => const AvatarGroup(
          names: ['Avijit Dutta', 'Sara Khan', 'Mo Li', 'Ravi P', 'Ana B'],
        ),
    'circular-percent': (_) => const Wrap(
          spacing: 24,
          children: [
            CircularPercent(value: 0.72, label: 'Storage'),
            CircularPercent(value: 0.4, label: 'Goal'),
          ],
        ),
    'price-tag': (_) => const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PriceTag(price: 79.0, oldPrice: 129.0),
            SizedBox(height: 12),
            PriceTag(price: 19.99),
          ],
        ),
    'image-card': (_) => const SizedBox(
          width: 320,
          child: ImageCard(
            imageUrl:
                'https://picsum.photos/seed/widgetgallery/600/400',
            title: 'Mountain escape',
            subtitle: 'Swiss Alps · 3 night stay',
          ),
        ),
    'swipeable-list-item': (_) => SizedBox(
          width: 360,
          child: SwipeableListItem(
            itemKey: const ValueKey('demo'),
            title: 'Swipe me left',
            subtitle: 'Removes the row',
            leading: const Icon(Icons.email_outlined),
            onDismissed: () {},
          ),
        ),
    'selectable-list-tile': (_) => _SelectableDemo(),
  };

  static WidgetBuilder previewFor(String id) =>
      _previews[id] ??
      (_) => const Text('No preview available');
}

class _QuantityDemo extends StatefulWidget {
  @override
  State<_QuantityDemo> createState() => _QuantityDemoState();
}

class _QuantityDemoState extends State<_QuantityDemo> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return QuantitySelector(
      value: _value,
      min: 1,
      max: 10,
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _FilterDemo extends StatefulWidget {
  @override
  State<_FilterDemo> createState() => _FilterDemoState();
}

class _FilterDemoState extends State<_FilterDemo> {
  Set<String> _selected = {'Flutter'};

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup(
      options: const ['Flutter', 'Dart', 'Firebase', 'Riverpod', 'Bloc'],
      selected: _selected,
      onChanged: (s) => setState(() => _selected = s),
    );
  }
}

class _BottomNavDemo extends StatefulWidget {
  @override
  State<_BottomNavDemo> createState() => _BottomNavDemoState();
}

class _BottomNavDemoState extends State<_BottomNavDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return AppBottomNavBar(
      currentIndex: _index,
      onTap: (i) => setState(() => _index = i),
      items: const [
        BottomNavItem(icon: Icons.home_outlined, label: 'Home'),
        BottomNavItem(icon: Icons.search, label: 'Search'),
        BottomNavItem(icon: Icons.favorite_border, label: 'Saved'),
        BottomNavItem(icon: Icons.person_outline, label: 'Profile'),
      ],
    );
  }
}

class _TabBarDemo extends StatefulWidget {
  @override
  State<_TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<_TabBarDemo> {
  int _i = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: AppTabBar(
        tabs: const ['Overview', 'Reviews', 'Specs'],
        currentIndex: _i,
        onChanged: (i) => setState(() => _i = i),
      ),
    );
  }
}

class _DropdownDemo extends StatefulWidget {
  @override
  State<_DropdownDemo> createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<_DropdownDemo> {
  String? _value = 'Medium';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: AppDropdownField<String>(
        label: 'Size',
        value: _value,
        prefixIcon: Icons.straighten,
        items: const ['Small', 'Medium', 'Large', 'X-Large'],
        onChanged: (v) => setState(() => _value = v),
      ),
    );
  }
}

class _SliderDemo extends StatefulWidget {
  @override
  State<_SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<_SliderDemo> {
  double _v = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: LabeledSlider(
        label: 'Budget',
        value: _v,
        unit: 'k',
        onChanged: (v) => setState(() => _v = v),
      ),
    );
  }
}

class _CheckboxDemo extends StatefulWidget {
  @override
  State<_CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<_CheckboxDemo> {
  bool _a = true;
  bool _b = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxTile(
            title: 'Email notifications',
            subtitle: 'Product news and tips',
            value: _a,
            onChanged: (v) => setState(() => _a = v),
          ),
          CheckboxTile(
            title: 'SMS notifications',
            value: _b,
            onChanged: (v) => setState(() => _b = v),
          ),
        ],
      ),
    );
  }
}

class _RadioDemo extends StatefulWidget {
  @override
  State<_RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<_RadioDemo> {
  String _v = 'Standard';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: AppRadioGroup<String>(
        options: const ['Standard', 'Express', 'Overnight'],
        value: _v,
        onChanged: (v) => setState(() => _v = v),
      ),
    );
  }
}

class _SwitchDemo extends StatefulWidget {
  @override
  State<_SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<_SwitchDemo> {
  bool _wifi = true;
  bool _bt = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchTile(
            title: 'Wi-Fi',
            subtitle: 'Connected to "Home"',
            icon: Icons.wifi,
            value: _wifi,
            onChanged: (v) => setState(() => _wifi = v),
          ),
          SwitchTile(
            title: 'Bluetooth',
            icon: Icons.bluetooth,
            value: _bt,
            onChanged: (v) => setState(() => _bt = v),
          ),
        ],
      ),
    );
  }
}

class _DateDemo extends StatefulWidget {
  @override
  State<_DateDemo> createState() => _DateDemoState();
}

class _DateDemoState extends State<_DateDemo> {
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: DatePickerField(
        label: 'Date of birth',
        value: _date,
        onChanged: (d) => setState(() => _date = d),
      ),
    );
  }
}

class _SelectableDemo extends StatefulWidget {
  @override
  State<_SelectableDemo> createState() => _SelectableDemoState();
}

class _SelectableDemoState extends State<_SelectableDemo> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SelectableListTile(
              title: 'Option ${i + 1}',
              subtitle: 'Tap to select',
              leading: CircleAvatar(child: Text('${i + 1}')),
              selected: _selected == i,
              onTap: () => setState(() => _selected = i),
            ),
          );
        }),
      ),
    );
  }
}
