package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/** Section title with subtitle and a trailing action. */
@Composable
fun SectionHeader(
    title: String,
    modifier: Modifier = Modifier,
    subtitle: String? = null,
    actionLabel: String? = null,
    onAction: () -> Unit = {},
) {
    val scheme = MaterialTheme.colorScheme
    Row(modifier.fillMaxWidth()) {
        Box(
            Modifier
                .padding(end = 12.dp, top = 2.dp)
                .width(4.dp)
                .height(if (subtitle != null) 40.dp else 22.dp)
                .clip(RoundedCornerShape(2.dp))
                .background(scheme.primary)
        )
        Column(Modifier.weight(1f)) {
            Text(title, style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold)
            if (subtitle != null) {
                Spacer(Modifier.height(4.dp))
                Text(subtitle, color = scheme.onSurfaceVariant,
                    style = MaterialTheme.typography.bodyMedium)
            }
        }
        if (actionLabel != null) {
            TextButton(onClick = onAction) { Text(actionLabel) }
        }
    }
}
