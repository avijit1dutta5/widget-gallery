package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.TrendingDown
import androidx.compose.material.icons.filled.TrendingUp
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

/** Compact metric card with icon, value, label and trend delta. */
@Composable
fun StatCard(
    icon: ImageVector,
    value: String,
    label: String,
    modifier: Modifier = Modifier,
    trend: String? = null,
) {
    val scheme = MaterialTheme.colorScheme
    val negative = trend?.trim()?.startsWith("-") == true
    Column(
        modifier
            .width(200.dp)
            .clip(RoundedCornerShape(16.dp))
            .background(scheme.surface)
            .border(1.dp, scheme.outlineVariant, RoundedCornerShape(16.dp))
            .padding(20.dp),
    ) {
        Box(
            Modifier
                .clip(RoundedCornerShape(12.dp))
                .background(scheme.primary.copy(alpha = 0.12f))
                .padding(10.dp),
        ) { Icon(icon, null, tint = scheme.primary) }
        Spacer(Modifier.height(16.dp))
        Text(value, style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold)
        Spacer(Modifier.height(4.dp))
        Text(label, color = scheme.onSurfaceVariant,
            style = MaterialTheme.typography.bodyMedium)
        if (trend != null) {
            Spacer(Modifier.height(12.dp))
            val c = if (negative) Color(0xFFD32F2F) else Color(0xFF2E7D32)
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    if (negative) Icons.Filled.TrendingDown
                    else Icons.Filled.TrendingUp,
                    null, tint = c, modifier = Modifier.size(16.dp),
                )
                Spacer(Modifier.width(4.dp))
                Text(trend, color = c, fontWeight = FontWeight.SemiBold)
            }
        }
    }
}
