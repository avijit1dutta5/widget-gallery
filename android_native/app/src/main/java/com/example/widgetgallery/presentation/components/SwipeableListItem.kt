package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.DeleteOutline
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.ListItem
import androidx.compose.material3.ListItemDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.SwipeToDismissBox
import androidx.compose.material3.SwipeToDismissBoxValue
import androidx.compose.material3.Text
import androidx.compose.material3.rememberSwipeToDismissBoxState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/** List row with swipe-to-delete. */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SwipeableListItem(
    title: String,
    onDismissed: () -> Unit,
    modifier: Modifier = Modifier,
    subtitle: String? = null,
    leading: (@Composable () -> Unit)? = null,
) {
    val scheme = MaterialTheme.colorScheme
    val state = rememberSwipeToDismissBoxState()

    LaunchedEffect(state.currentValue) {
        if (state.currentValue == SwipeToDismissBoxValue.EndToStart) {
            onDismissed()
        }
    }

    SwipeToDismissBox(
        state = state,
        modifier = modifier.clip(RoundedCornerShape(14.dp)),
        enableDismissFromStartToEnd = false,
        backgroundContent = {
            Box(
                Modifier.fillMaxSize()
                    .clip(RoundedCornerShape(14.dp))
                    .background(scheme.errorContainer)
                    .padding(end = 24.dp),
                contentAlignment = Alignment.CenterEnd,
            ) {
                Icon(Icons.Filled.DeleteOutline, null,
                    tint = scheme.onErrorContainer)
            }
        },
    ) {
        ListItem(
            headlineContent = {
                Text(title, fontWeight = FontWeight.SemiBold)
            },
            supportingContent = subtitle?.let { { Text(it) } },
            leadingContent = leading,
            colors = ListItemDefaults.colors(
                containerColor = scheme.surfaceContainerLow,
            ),
            modifier = Modifier
                .clip(RoundedCornerShape(14.dp))
                .border(1.dp, scheme.outlineVariant,
                    RoundedCornerShape(14.dp)),
        )
    }
}
