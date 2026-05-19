package com.example.widgetgallery.presentation.anim

import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.tween
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.layout.layout
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay

/** One-shot fade + upward slide when first composed. */
@Composable
fun FadeSlideIn(
    delayMillis: Int = 0,
    content: @Composable (Modifier) -> Unit,
) {
    val progress = remember { Animatable(0f) }
    LaunchedEffect(Unit) {
        if (delayMillis > 0) delay(delayMillis.toLong())
        progress.animateTo(1f, tween(durationMillis = 520))
    }
    val p = progress.value
    val offsetPx = ((1f - p) * 28).dp
    content(
        Modifier
            .alpha(p)
            .layout { measurable, constraints ->
                val placeable = measurable.measure(constraints)
                layout(placeable.width, placeable.height) {
                    placeable.placeRelative(0, offsetPx.roundToPx())
                }
            }
    )
}
