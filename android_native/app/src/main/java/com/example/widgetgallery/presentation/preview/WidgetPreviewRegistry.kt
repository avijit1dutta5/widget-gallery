package com.example.widgetgallery.presentation.preview

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.widgetgallery.presentation.components.*

/** Maps a gallery widget id to its live, interactive preview. */
@Composable
fun WidgetPreview(id: String) {
    when (id) {
        "app-button" -> Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            AppButton("Continue", {})
            AppButton("Save", {}, icon = Icons.Filled.Save)
            AppButton("Loading", {}, loading = true)
        }
        "app-outlined-button" -> Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            AppOutlinedButton("Cancel", {})
            AppOutlinedButton("Share", {}, icon = Icons.Filled.Share)
        }
        "gradient-button" -> Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            GradientButton("Get started", {})
            GradientButton("Upgrade", {}, icon = Icons.Filled.Bolt)
        }
        "stat-card" -> Row(horizontalArrangement = Arrangement.spacedBy(16.dp)) {
            StatCard(Icons.Filled.AttachMoney, "\$48.2k", "Revenue", trend = "+12.4%")
            StatCard(Icons.Filled.People, "1,204", "New users", trend = "-3.1%")
        }
        "info-card" -> InfoCard(Icons.Filled.Notifications, "Push notifications",
            "Get notified about activity", onClick = {}) {
            Icon(Icons.Filled.ChevronRight, null)
        }
        "profile-card" -> ProfileCard("Avijit Dutta", "Android Developer",
            actionLabel = "Follow")
        "app-text-field" -> {
            var v by remember { mutableStateOf("") }
            Box(Modifier.width(340.dp)) {
                AppTextField(v, { v = it }, "Email",
                    leadingIcon = Icons.Filled.Email,
                    helperText = "We'll never share your email.")
            }
        }
        "password-field" -> {
            var v by remember { mutableStateOf("") }
            Box(Modifier.width(340.dp)) { PasswordField(v, { v = it }) }
        }
        "app-search-bar" -> {
            var v by remember { mutableStateOf("") }
            Box(Modifier.width(340.dp)) { AppSearchBar(v, { v = it }) }
        }
        "quantity-selector" -> {
            var v by remember { mutableIntStateOf(1) }
            QuantitySelector(v, { v = it }, min = 1, max = 10)
        }
        "otp-input" -> OtpInput(length = 4)
        "filter-chip-group" -> {
            var sel by remember { mutableStateOf(setOf("Flutter")) }
            FilterChipGroup(listOf("Flutter", "Dart", "Compose", "Kotlin"),
                sel, { sel = it })
        }
        "app-banner" -> Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
            AppBanner("Profile updated successfully.", type = BannerType.Success)
            AppBanner("Your trial ends in 3 days.", type = BannerType.Warning)
            AppBanner("Could not connect to server.", type = BannerType.Error)
        }
        "labeled-progress-bar" -> Column(Modifier.width(340.dp)) {
            LabeledProgressBar("Upload", 0.72f)
            Spacer(Modifier.height(20.dp))
            LabeledProgressBar("Storage used", 0.35f)
        }
        "loading-indicator" -> LoadingIndicator(message = "Loading your data…")
        "empty-state" -> EmptyState(Icons.Filled.Inbox, "No messages yet",
            "When you receive messages they will show up here.",
            actionLabel = "Refresh")
        "skeleton-loader" -> Column(Modifier.width(320.dp),
            verticalArrangement = Arrangement.spacedBy(10.dp)) {
            SkeletonLoader(height = 20.dp, modifier = Modifier.width(180.dp))
            SkeletonLoader(); SkeletonLoader()
            SkeletonLoader(modifier = Modifier.width(220.dp))
        }
        "app-avatar" -> Row(horizontalArrangement = Arrangement.spacedBy(20.dp),
            verticalAlignment = Alignment.CenterVertically) {
            AppAvatar("Avijit Dutta", online = true)
            AppAvatar("Sara Khan", radius = 36.dp, online = false)
            AppAvatar("M", radius = 24.dp)
        }
        "status-badge" -> Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
            StatusBadge("Active", icon = Icons.Filled.CheckCircle)
            StatusBadge("Pending")
            StatusBadge("Failed", color = androidx.compose.ui.graphics.Color(0xFFC62828))
        }
        "tag-chip" -> Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
            TagChip("Compose", selected = true)
            TagChip("Kotlin")
            TagChip("Removable", onRemove = {})
        }
        "rating-stars" -> Column {
            RatingStars(3.5f); Spacer(Modifier.height(12.dp)); RatingStars(5f)
        }
        "section-header" -> Box(Modifier.width(400.dp)) {
            SectionHeader("Recent activity",
                subtitle = "Updates from the last 7 days",
                actionLabel = "See all")
        }
        "notification-badge" -> Row(horizontalArrangement = Arrangement.spacedBy(28.dp)) {
            NotificationBadge(3) { Icon(Icons.Filled.Notifications, null,
                Modifier.size(32.dp)) }
            NotificationBadge(128) { Icon(Icons.Filled.MailOutline, null,
                Modifier.size(32.dp)) }
        }
        "timeline" -> Box(Modifier.width(360.dp)) {
            Timeline(listOf(
                TimelineEntry("Order placed", "Today, 9:24 AM", true),
                TimelineEntry("Shipped", "Today, 2:10 PM", true),
                TimelineEntry("Out for delivery", "Pending"),
                TimelineEntry("Delivered", "Pending"),
            ))
        }
        "expandable-panel" -> Box(Modifier.width(400.dp)) {
            ExpandablePanel("What is your refund policy?",
                initiallyExpanded = true) {
                Text("You can request a full refund within 30 days of purchase.")
            }
        }
        "avatar-group" -> AvatarGroup(
            listOf("Avijit Dutta", "Sara Khan", "Mo Li", "Ravi P", "Ana B"))
        "circular-percent" -> Row(horizontalArrangement = Arrangement.spacedBy(24.dp)) {
            CircularPercent(0.72f, label = "Storage")
            CircularPercent(0.4f, label = "Goal")
        }
        "price-tag" -> Column {
            PriceTag(79.0, oldPrice = 129.0)
            Spacer(Modifier.height(12.dp)); PriceTag(19.99)
        }
        "image-card" -> Box(Modifier.width(320.dp)) {
            ImageCard("", "Mountain escape", subtitle = "Swiss Alps · 3 nights")
        }
        "confirm-dialog" -> {
            var open by remember { mutableStateOf(false) }
            Button(onClick = { open = true }) { Text("Open dialog") }
            if (open) ConfirmDialog("Delete item?",
                "This action cannot be undone.",
                onConfirm = { open = false }, onDismiss = { open = false },
                confirmLabel = "Delete", destructive = true)
        }
        "app-bottom-nav-bar" -> {
            var i by remember { mutableIntStateOf(0) }
            AppBottomNavBar(listOf(
                BottomNavItem(Icons.Filled.Home, "Home"),
                BottomNavItem(Icons.Filled.Search, "Search"),
                BottomNavItem(Icons.Filled.FavoriteBorder, "Saved"),
                BottomNavItem(Icons.Filled.PersonOutline, "Profile"),
            ), i, { i = it })
        }
        "app-tab-bar" -> {
            var i by remember { mutableIntStateOf(0) }
            Box(Modifier.width(380.dp)) {
                AppTabBar(listOf("Overview", "Reviews", "Specs"), i, { i = it })
            }
        }
        "step-progress" -> Box(Modifier.width(420.dp)) {
            StepProgress(listOf("Cart", "Address", "Payment", "Done"), 1)
        }
        "breadcrumbs" -> Breadcrumbs(listOf("Home", "Catalog", "Shoes", "Running"))
        "app-dropdown-field" -> {
            var v by remember { mutableStateOf<String?>("Medium") }
            Box(Modifier.width(320.dp)) {
                AppDropdownField("Size", v,
                    listOf("Small", "Medium", "Large", "X-Large"),
                    { v = it }, leadingIcon = Icons.Filled.Straighten)
            }
        }
        "labeled-slider" -> {
            var v by remember { mutableFloatStateOf(40f) }
            Box(Modifier.width(340.dp)) {
                LabeledSlider("Budget", v, { v = it }, unit = "k")
            }
        }
        "checkbox-tile" -> {
            var a by remember { mutableStateOf(true) }
            var b by remember { mutableStateOf(false) }
            Column(Modifier.width(340.dp)) {
                CheckboxTile("Email notifications", a, { a = it },
                    subtitle = "Product news and tips")
                CheckboxTile("SMS notifications", b, { b = it })
            }
        }
        "radio-group" -> {
            var v by remember { mutableStateOf("Standard") }
            Box(Modifier.width(320.dp)) {
                AppRadioGroup(listOf("Standard", "Express", "Overnight"),
                    v, { v = it })
            }
        }
        "switch-tile" -> {
            var w by remember { mutableStateOf(true) }
            var bt by remember { mutableStateOf(false) }
            Column(Modifier.width(360.dp)) {
                SwitchTile("Wi-Fi", w, { w = it },
                    subtitle = "Connected to \"Home\"", icon = Icons.Filled.Wifi)
                SwitchTile("Bluetooth", bt, { bt = it },
                    icon = Icons.Filled.Bluetooth)
            }
        }
        "date-picker-field" -> {
            var d by remember { mutableStateOf<Long?>(null) }
            Box(Modifier.width(320.dp)) {
                DatePickerField("Date of birth", d, { d = it })
            }
        }
        "labeled-divider" -> Box(Modifier.width(360.dp)) { LabeledDivider("OR") }
        "key-value-table" -> Box(Modifier.width(380.dp)) {
            KeyValueTable(listOf(
                KeyValue("Order ID", "#A1B2C3"),
                KeyValue("Status", "Shipped"),
                KeyValue("Total", "\$129.00"),
                KeyValue("Delivery", "May 24, 2026"),
            ))
        }
        "responsive-grid" -> Box(Modifier.width(420.dp)) {
            ResponsiveGrid(
                items = List(6) { idx -> { Box(
                    Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center,
                ) { Text("Tile ${idx + 1}") } } },
                maxTileWidth = 130.dp,
            )
        }
        "swipeable-list-item" -> Box(Modifier.width(360.dp)) {
            SwipeableListItem("Swipe me left", {},
                subtitle = "Removes the row",
                leading = { Icon(Icons.Filled.Email, null) })
        }
        "selectable-list-tile" -> {
            var sel by remember { mutableIntStateOf(0) }
            Column(Modifier.width(360.dp),
                verticalArrangement = Arrangement.spacedBy(10.dp)) {
                repeat(3) { idx ->
                    SelectableListTile("Option ${idx + 1}", sel == idx,
                        { sel = idx }, subtitle = "Tap to select")
                }
            }
        }
        else -> Text("No preview available")
    }
}
