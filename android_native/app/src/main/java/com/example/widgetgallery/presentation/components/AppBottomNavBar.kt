package com.example.widgetgallery.presentation.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.animateColorAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

data class BottomNavItem(val icon: ImageVector, val label: String)

/** Pill-style bottom nav where the selected item shows its label. */
@Composable
fun AppBottomNavBar(
    items: List<BottomNavItem>,
    currentIndex: Int,
    onSelect: (Int) -> Unit,
    modifier: Modifier = Modifier,
) {
    val scheme = MaterialTheme.colorScheme
    Row(
        modifier
            .clip(RoundedCornerShape(24.dp))
            .background(scheme.surfaceContainerHighest)
            .padding(horizontal = 12.dp, vertical = 10.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        items.forEachIndexed { i, item ->
            val selected = i == currentIndex
            val bg by animateColorAsState(
                if (selected) scheme.primary else Color.Transparent,
                label = "bg",
            )
            Row(
                Modifier
                    .padding(horizontal = 4.dp)
                    .clip(RoundedCornerShape(18.dp))
                    .background(bg)
                    .clickable { onSelect(i) }
                    .padding(horizontal = 16.dp, vertical = 12.dp),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                Icon(
                    item.icon, null,
                    tint = if (selected) scheme.onPrimary
                    else scheme.onSurfaceVariant,
                    modifier = Modifier.size(22.dp),
                )
                AnimatedVisibility(visible = selected) {
                    Text(
                        "  ${item.label}",
                        color = scheme.onPrimary,
                        fontWeight = FontWeight.SemiBold,
                    )
                }
            }
        }
    }
}
