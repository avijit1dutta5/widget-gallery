package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.material3.FilterChip
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/** A wrap of multi-selectable filter chips. */
@OptIn(ExperimentalLayoutApi::class)
@Composable
fun FilterChipGroup(
    options: List<String>,
    selected: Set<String>,
    onChange: (Set<String>) -> Unit,
    modifier: Modifier = Modifier,
) {
    FlowRow(
        modifier,
        horizontalArrangement = Arrangement.spacedBy(10.dp),
        verticalArrangement = Arrangement.spacedBy(10.dp),
    ) {
        options.forEach { option ->
            val isSel = option in selected
            FilterChip(
                selected = isSel,
                onClick = {
                    onChange(
                        if (isSel) selected - option else selected + option
                    )
                },
                label = { Text(option) },
            )
        }
    }
}
