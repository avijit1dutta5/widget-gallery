package com.example.widgetgallery.presentation.components

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import kotlin.math.roundToInt

/** Animated labelled progress bar with a percentage readout. */
@Composable
fun LabeledProgressBar(
    label: String,
    value: Float,
    modifier: Modifier = Modifier,
) {
    val animated by animateFloatAsState(
        targetValue = value.coerceIn(0f, 1f),
        animationSpec = tween(600), label = "progress",
    )
    Column(modifier) {
        Row(
            Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
        ) {
            Text(label, fontWeight = FontWeight.SemiBold)
            Text("${(animated * 100).roundToInt()}%",
                color = MaterialTheme.colorScheme.onSurfaceVariant)
        }
        Spacer(Modifier.height(8.dp))
        LinearProgressIndicator(
            progress = { animated },
            modifier = Modifier.fillMaxWidth().height(10.dp)
                .clip(RoundedCornerShape(8.dp)),
        )
    }
}

/** Centered spinner with an optional message. */
@Composable
fun LoadingIndicator(
    modifier: Modifier = Modifier,
    message: String? = null,
) {
    Column(
        modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        CircularProgressIndicator()
        if (message != null) {
            Spacer(Modifier.height(16.dp))
            Text(message, color = MaterialTheme.colorScheme.onSurfaceVariant)
        }
    }
}
