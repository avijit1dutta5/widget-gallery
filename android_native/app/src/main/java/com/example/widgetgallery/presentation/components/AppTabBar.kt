package com.example.widgetgallery.presentation.components

import androidx.compose.animation.animateColorAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp

/** Controlled segmented top tab bar with an animated pill. */
@Composable
fun AppTabBar(
    tabs: List<String>,
    currentIndex: Int,
    onChange: (Int) -> Unit,
    modifier: Modifier = Modifier,
) {
    val scheme = MaterialTheme.colorScheme
    Row(
        modifier
            .clip(RoundedCornerShape(14.dp))
            .background(scheme.surfaceContainerHighest)
            .padding(4.dp),
    ) {
        tabs.forEachIndexed { i, tab ->
            val selected = i == currentIndex
            val bg by animateColorAsState(
                if (selected) scheme.surface else Color.Transparent,
                label = "tab",
            )
            Box(
                Modifier
                    .weight(1f)
                    .clip(RoundedCornerShape(10.dp))
                    .background(bg)
                    .clickable { onChange(i) }
                    .padding(vertical = 10.dp),
            ) {
                Text(
                    tab,
                    Modifier.fillMaxWidth(),
                    textAlign = TextAlign.Center,
                    fontWeight = FontWeight.SemiBold,
                    color = if (selected) scheme.primary
                    else scheme.onSurfaceVariant,
                )
            }
        }
    }
}
