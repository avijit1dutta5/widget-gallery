package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import kotlin.math.ceil

/** Auto-fitting grid that adapts column count to available width. */
@Composable
fun ResponsiveGrid(
    items: List<@Composable () -> Unit>,
    modifier: Modifier = Modifier,
    maxTileWidth: Dp = 220.dp,
    spacing: Dp = 12.dp,
    aspectRatio: Float = 1.4f,
) {
    BoxWithConstraints(modifier.fillMaxWidth()) {
        val columns = ceil(maxWidth.value / maxTileWidth.value)
            .toInt().coerceIn(1, 6)
        val tileWidth = (maxWidth - spacing * (columns - 1)) / columns
        val rows = items.chunked(columns)
        Column(verticalArrangement = Arrangement.spacedBy(spacing)) {
            rows.forEach { rowItems ->
                Row(horizontalArrangement = Arrangement.spacedBy(spacing)) {
                    rowItems.forEach { item ->
                        Column(
                            Modifier
                                .width(tileWidth)
                                .height(tileWidth / aspectRatio)
                        ) { item() }
                    }
                }
            }
        }
    }
}
