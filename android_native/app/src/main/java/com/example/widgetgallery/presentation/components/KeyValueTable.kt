package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp

data class KeyValue(val label: String, val value: String)

/** Label / value spec table for detail screens. */
@Composable
fun KeyValueTable(rows: List<KeyValue>, modifier: Modifier = Modifier) {
    val scheme = MaterialTheme.colorScheme
    Column(
        modifier
            .clip(RoundedCornerShape(14.dp))
            .background(scheme.surfaceContainerLow)
            .border(1.dp, scheme.outlineVariant, RoundedCornerShape(14.dp)),
    ) {
        rows.forEachIndexed { i, row ->
            Row(
                Modifier.fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 14.dp),
            ) {
                Text(row.label, Modifier.weight(2f),
                    color = scheme.onSurfaceVariant)
                Text(row.value, Modifier.weight(3f),
                    textAlign = TextAlign.End,
                    fontWeight = FontWeight.SemiBold)
            }
            if (i != rows.lastIndex) {
                HorizontalDivider(color = scheme.outlineVariant)
            }
        }
    }
}
