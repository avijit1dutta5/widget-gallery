package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlin.math.abs

private val palette = listOf(
    Color(0xFF1A5DC7), Color(0xFF1E7E34), Color(0xFFB26A00),
    Color(0xFFC62828), Color(0xFF6A1B9A),
)

/** Small colored status pill with optional icon. */
@Composable
fun StatusBadge(
    label: String,
    modifier: Modifier = Modifier,
    color: Color? = null,
    icon: ImageVector? = null,
) {
    val c = color ?: palette[abs(label.hashCode()) % palette.size]
    Row(
        modifier
            .clip(RoundedCornerShape(999.dp))
            .background(c.copy(alpha = 0.12f))
            .padding(horizontal = 12.dp, vertical = 6.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        if (icon != null) {
            Icon(icon, null, tint = c, modifier = Modifier.size(14.dp))
            Spacer(Modifier.width(6.dp))
        }
        Text(label, color = c, fontWeight = FontWeight.SemiBold, fontSize = 12.sp)
    }
}

/** Selectable / removable tag chip. */
@Composable
fun TagChip(
    label: String,
    modifier: Modifier = Modifier,
    selected: Boolean = false,
    onClick: () -> Unit = {},
    onRemove: (() -> Unit)? = null,
) {
    val scheme = MaterialTheme.colorScheme
    Row(
        modifier
            .clip(RoundedCornerShape(999.dp))
            .background(
                if (selected) scheme.primary
                else scheme.surfaceContainerHighest
            )
            .clickable(onClick = onClick)
            .padding(horizontal = 14.dp, vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Text(
            label,
            color = if (selected) scheme.onPrimary else scheme.onSurface,
            fontWeight = FontWeight.Medium,
        )
        if (onRemove != null) {
            Spacer(Modifier.width(6.dp))
            Icon(
                Icons.Filled.Close, null,
                tint = if (selected) scheme.onPrimary else scheme.onSurfaceVariant,
                modifier = Modifier.size(16.dp).clickable(onClick = onRemove),
            )
        }
    }
}
