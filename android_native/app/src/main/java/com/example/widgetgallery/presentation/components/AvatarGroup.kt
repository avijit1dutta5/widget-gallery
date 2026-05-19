package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/** Overlapping stacked avatars with a +N overflow. */
@Composable
fun AvatarGroup(
    names: List<String>,
    modifier: Modifier = Modifier,
    max: Int = 4,
    radius: Dp = 20.dp,
) {
    val scheme = MaterialTheme.colorScheme
    val shown = names.take(max)
    val overflow = names.size - shown.size
    val step = radius * 1.4f
    Box(modifier) {
        shown.forEachIndexed { i, name ->
            Box(
                Modifier
                    .offset(x = step * i)
                    .size(radius * 2 + 4.dp)
                    .clip(CircleShape)
                    .background(scheme.surface),
                contentAlignment = Alignment.Center,
            ) {
                Box(
                    Modifier.size(radius * 2).clip(CircleShape)
                        .background(scheme.primaryContainer),
                    contentAlignment = Alignment.Center,
                ) {
                    Text(initialsOf(name), color = scheme.onPrimaryContainer,
                        fontWeight = FontWeight.Bold,
                        fontSize = (radius.value * 0.7f).sp)
                }
            }
        }
        if (overflow > 0) {
            Box(
                Modifier
                    .offset(x = step * shown.size)
                    .size(radius * 2 + 4.dp)
                    .clip(CircleShape)
                    .background(scheme.surface),
                contentAlignment = Alignment.Center,
            ) {
                Box(
                    Modifier.size(radius * 2).clip(CircleShape)
                        .background(scheme.secondaryContainer),
                    contentAlignment = Alignment.Center,
                ) {
                    Text("+$overflow", color = scheme.onSecondaryContainer,
                        fontWeight = FontWeight.Bold,
                        fontSize = (radius.value * 0.7f).sp)
                }
            }
        }
    }
}
