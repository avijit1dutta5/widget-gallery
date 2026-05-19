package com.example.widgetgallery.presentation.components

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.size
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlin.math.roundToInt

/** Animated circular progress ring with a centered percentage label. */
@Composable
fun CircularPercent(
    value: Float,
    modifier: Modifier = Modifier,
    size: Dp = 96.dp,
    label: String? = null,
) {
    val animated by animateFloatAsState(
        targetValue = value.coerceIn(0f, 1f),
        animationSpec = tween(700), label = "ring",
    )
    Box(modifier.size(size), contentAlignment = Alignment.Center) {
        CircularProgressIndicator(
            progress = { animated },
            modifier = Modifier.fillMaxSize(),
            strokeWidth = 9.dp,
            trackColor = MaterialTheme.colorScheme.surfaceContainerHighest,
        )
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text("${(animated * 100).roundToInt()}%",
                fontSize = (size.value * 0.22f).sp,
                fontWeight = FontWeight.Bold)
            if (label != null) {
                Text(label, fontSize = (size.value * 0.12f).sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
        }
    }
}
