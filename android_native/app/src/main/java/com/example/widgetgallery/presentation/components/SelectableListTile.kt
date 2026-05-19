package com.example.widgetgallery.presentation.components

import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material3.Icon
import androidx.compose.material3.ListItem
import androidx.compose.material3.ListItemDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/** List tile that highlights and checks when selected. */
@Composable
fun SelectableListTile(
    title: String,
    selected: Boolean,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    subtitle: String? = null,
    leading: (@Composable () -> Unit)? = null,
) {
    val scheme = MaterialTheme.colorScheme
    val bg by animateColorAsState(
        if (selected) scheme.primaryContainer.copy(alpha = 0.5f)
        else scheme.surfaceContainerLow,
        label = "bg",
    )
    val s by animateFloatAsState(if (selected) 1f else 0f, label = "check")
    ListItem(
        headlineContent = { Text(title, fontWeight = FontWeight.SemiBold) },
        supportingContent = subtitle?.let { { Text(it) } },
        leadingContent = leading,
        trailingContent = {
            Icon(Icons.Filled.CheckCircle, null,
                tint = scheme.primary, modifier = Modifier.scale(s))
        },
        colors = ListItemDefaults.colors(containerColor = bg),
        modifier = modifier
            .clip(RoundedCornerShape(14.dp))
            .border(
                if (selected) 1.5.dp else 1.dp,
                if (selected) scheme.primary else scheme.outlineVariant,
                RoundedCornerShape(14.dp),
            )
            .clickable(onClick = onClick),
    )
}
