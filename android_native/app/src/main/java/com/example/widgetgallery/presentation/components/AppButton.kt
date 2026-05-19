package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp

/** Primary button with optional icon, loading state and full-width. */
@Composable
fun AppButton(
    label: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: ImageVector? = null,
    loading: Boolean = false,
    fullWidth: Boolean = false,
) {
    Button(
        onClick = onClick,
        enabled = !loading,
        modifier = if (fullWidth) modifier.fillMaxWidth() else modifier,
    ) {
        if (loading) {
            CircularProgressIndicator(
                strokeWidth = 2.4.dp,
                modifier = Modifier.size(20.dp),
                color = MaterialTheme.colorScheme.onPrimary,
            )
        } else {
            if (icon != null) {
                Icon(icon, null, Modifier.size(20.dp))
                Spacer(Modifier.width(8.dp))
            }
            Text(label)
        }
    }
}

/** Secondary outlined action button. */
@Composable
fun AppOutlinedButton(
    label: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: ImageVector? = null,
    fullWidth: Boolean = false,
) {
    OutlinedButton(
        onClick = onClick,
        modifier = if (fullWidth) modifier.fillMaxWidth() else modifier,
    ) {
        if (icon != null) {
            Icon(icon, null, Modifier.size(20.dp))
            Spacer(Modifier.width(8.dp))
        }
        Text(label)
    }
}
