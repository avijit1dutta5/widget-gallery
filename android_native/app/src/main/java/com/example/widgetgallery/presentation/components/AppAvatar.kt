package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

internal fun initialsOf(name: String): String {
    val p = name.trim().split(Regex("\\s+"))
    if (p.isEmpty() || p[0].isEmpty()) return "?"
    return if (p.size == 1) p[0].first().uppercase()
    else (p.first().first().toString() + p.last().first()).uppercase()
}

/** Avatar with initials fallback and an optional online status dot. */
@Composable
fun AppAvatar(
    name: String,
    modifier: Modifier = Modifier,
    radius: Dp = 28.dp,
    online: Boolean? = null,
) {
    val scheme = MaterialTheme.colorScheme
    Box(modifier.size(radius * 2)) {
        Box(
            Modifier.size(radius * 2).clip(CircleShape)
                .background(scheme.primaryContainer),
            contentAlignment = Alignment.Center,
        ) {
            Text(initialsOf(name), color = scheme.onPrimaryContainer,
                fontWeight = FontWeight.Bold,
                fontSize = (radius.value * 0.7f).sp)
        }
        if (online != null) {
            Box(
                Modifier
                    .align(Alignment.BottomEnd)
                    .size(radius * 0.55f)
                    .clip(CircleShape)
                    .background(scheme.surface),
                contentAlignment = Alignment.Center,
            ) {
                Box(
                    Modifier.size(radius * 0.4f).clip(CircleShape)
                        .background(
                            if (online) Color(0xFF2E7D32)
                            else Color(0xFF9E9E9E)
                        )
                )
            }
        }
    }
}
