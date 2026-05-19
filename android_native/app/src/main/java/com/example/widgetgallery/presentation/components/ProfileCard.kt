package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

private fun initials(name: String): String {
    val p = name.trim().split(Regex("\\s+"))
    if (p.isEmpty() || p[0].isEmpty()) return "?"
    return if (p.size == 1) p[0].first().uppercase()
    else (p.first().first().toString() + p.last().first()).uppercase()
}

/** Profile card with initials avatar, name, role and a primary action. */
@Composable
fun ProfileCard(
    name: String,
    role: String,
    modifier: Modifier = Modifier,
    actionLabel: String? = null,
    onAction: () -> Unit = {},
) {
    val scheme = MaterialTheme.colorScheme
    Column(
        modifier
            .width(260.dp)
            .clip(RoundedCornerShape(20.dp))
            .background(scheme.surface)
            .border(1.dp, scheme.outlineVariant, RoundedCornerShape(20.dp))
            .padding(24.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Box(
            Modifier.size(80.dp).clip(CircleShape)
                .background(scheme.primaryContainer),
            contentAlignment = Alignment.Center,
        ) {
            Text(initials(name), color = scheme.onPrimaryContainer,
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold)
        }
        Spacer(Modifier.height(16.dp))
        Text(name, style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold)
        Spacer(Modifier.height(4.dp))
        Text(role, color = scheme.onSurfaceVariant,
            style = MaterialTheme.typography.bodyMedium)
        if (actionLabel != null) {
            Spacer(Modifier.height(20.dp))
            Button(onClick = onAction, modifier = Modifier.fillMaxWidth()) {
                Text(actionLabel)
            }
        }
    }
}
