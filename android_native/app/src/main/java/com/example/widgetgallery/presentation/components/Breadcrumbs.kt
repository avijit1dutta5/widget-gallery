package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ChevronRight
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/** Tappable path breadcrumb trail. */
@OptIn(ExperimentalLayoutApi::class)
@Composable
fun Breadcrumbs(
    crumbs: List<String>,
    modifier: Modifier = Modifier,
    onClick: (Int) -> Unit = {},
) {
    val scheme = MaterialTheme.colorScheme
    FlowRow(
        modifier,
        verticalArrangement = Arrangement.Center,
    ) {
        crumbs.forEachIndexed { i, crumb ->
            val last = i == crumbs.lastIndex
            Text(
                crumb,
                color = if (last) scheme.onSurface else scheme.primary,
                fontWeight = if (last) FontWeight.Bold else FontWeight.Medium,
                modifier = Modifier
                    .then(if (last) Modifier else Modifier.clickable { onClick(i) })
                    .padding(horizontal = 4.dp, vertical = 2.dp),
            )
            if (!last) {
                Icon(
                    Icons.Filled.ChevronRight, null,
                    tint = scheme.onSurfaceVariant,
                    modifier = Modifier.padding(top = 2.dp),
                )
            }
        }
    }
}
