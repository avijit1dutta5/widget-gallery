package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

data class TimelineEntry(val title: String, val subtitle: String,
    val done: Boolean = false)

/** Vertical timeline / activity feed with connected nodes. */
@Composable
fun Timeline(entries: List<TimelineEntry>, modifier: Modifier = Modifier) {
    val scheme = MaterialTheme.colorScheme
    Column(modifier) {
        entries.forEachIndexed { i, e ->
            Row {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Box(
                        Modifier.size(18.dp).clip(CircleShape)
                            .background(
                                if (e.done) scheme.primary
                                else scheme.surfaceContainerHighest
                            )
                            .border(2.dp, scheme.primary, CircleShape),
                        contentAlignment = Alignment.Center,
                    ) {
                        if (e.done) Icon(Icons.Filled.Check, null,
                            tint = Color.White, modifier = Modifier.size(11.dp))
                    }
                    if (i != entries.lastIndex) {
                        Box(Modifier.width(2.dp).height(46.dp)
                            .background(scheme.outlineVariant))
                    }
                }
                Spacer(Modifier.width(14.dp))
                Column(Modifier.padding(bottom = 22.dp)) {
                    Text(e.title, fontWeight = FontWeight.SemiBold,
                        fontSize = 15.sp)
                    Spacer(Modifier.height(2.dp))
                    Text(e.subtitle, color = scheme.onSurfaceVariant,
                        fontSize = 13.sp)
                }
            }
        }
    }
}
