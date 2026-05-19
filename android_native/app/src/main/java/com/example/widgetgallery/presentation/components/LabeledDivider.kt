package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/** Horizontal divider with centered text (e.g. OR). */
@Composable
fun LabeledDivider(label: String, modifier: Modifier = Modifier) {
    val scheme = MaterialTheme.colorScheme
    Row(modifier, verticalAlignment = Alignment.CenterVertically) {
        HorizontalDivider(Modifier.weight(1f), color = scheme.outlineVariant)
        Text(
            label,
            Modifier.padding(horizontal = 14.dp),
            color = scheme.onSurfaceVariant,
            fontWeight = FontWeight.SemiBold,
            fontSize = 12.sp,
        )
        HorizontalDivider(Modifier.weight(1f), color = scheme.outlineVariant)
    }
}
