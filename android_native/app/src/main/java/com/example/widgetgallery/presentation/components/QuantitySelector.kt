package com.example.widgetgallery.presentation.components

import androidx.compose.animation.AnimatedContent
import androidx.compose.animation.scaleIn
import androidx.compose.animation.scaleOut
import androidx.compose.animation.togetherWith
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Remove
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/** Integer stepper clamped between [min] and [max]. */
@Composable
fun QuantitySelector(
    value: Int,
    onValueChange: (Int) -> Unit,
    modifier: Modifier = Modifier,
    min: Int = 0,
    max: Int = 99,
) {
    val scheme = MaterialTheme.colorScheme
    Row(
        modifier
            .clip(RoundedCornerShape(12.dp))
            .background(scheme.surfaceContainerHighest),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        StepBtn(Icons.Filled.Remove, value > min) { onValueChange(value - 1) }
        AnimatedContent(
            targetState = value,
            transitionSpec = { scaleIn() togetherWith scaleOut() },
            label = "qty",
        ) { v ->
            Text("$v", Modifier.width(44.dp), textAlign = TextAlign.Center,
                fontSize = 16.sp, fontWeight = FontWeight.Bold)
        }
        StepBtn(Icons.Filled.Add, value < max) { onValueChange(value + 1) }
    }
}

@Composable
private fun StepBtn(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    enabled: Boolean,
    onClick: () -> Unit,
) {
    val scheme = MaterialTheme.colorScheme
    Box(
        Modifier
            .clip(RoundedCornerShape(12.dp))
            .clickable(enabled = enabled, onClick = onClick)
            .padding(12.dp),
    ) {
        Icon(icon, null, Modifier.size(20.dp),
            tint = if (enabled) scheme.onSurface else scheme.outline)
    }
}
