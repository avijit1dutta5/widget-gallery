package com.example.widgetgallery.presentation.components

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.unit.dp

/** Single-select option group with a custom indicator. */
@Composable
fun <T> AppRadioGroup(
    options: List<T>,
    value: T?,
    onSelected: (T) -> Unit,
    modifier: Modifier = Modifier,
    optionLabel: (T) -> String = { it.toString() },
) {
    Column(modifier) {
        options.forEach { option ->
            Row(
                Modifier
                    .fillMaxWidth()
                    .clickable { onSelected(option) }
                    .padding(vertical = 10.dp),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                RadioIndicator(selected = option == value)
                Spacer(Modifier.width(14.dp))
                Text(optionLabel(option),
                    style = MaterialTheme.typography.bodyLarge)
            }
        }
    }
}

@Composable
private fun RadioIndicator(selected: Boolean) {
    val scheme = MaterialTheme.colorScheme
    val s by animateFloatAsState(if (selected) 1f else 0f, label = "dot")
    Box(
        Modifier.size(22.dp).clip(CircleShape)
            .border(2.dp, if (selected) scheme.primary else scheme.outline,
                CircleShape),
        contentAlignment = Alignment.Center,
    ) {
        Box(
            Modifier.size(10.dp).scale(s).clip(CircleShape)
                .background(scheme.primary)
        )
    }
}
