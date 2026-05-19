package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Error
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.WarningAmber
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

enum class BannerType { Info, Success, Warning, Error }

/** Inline info / success / warning / error banner with dismiss. */
@Composable
fun AppBanner(
    message: String,
    modifier: Modifier = Modifier,
    type: BannerType = BannerType.Info,
    onClose: (() -> Unit)? = null,
) {
    val (bg, fg, icon) = style(type)
    Row(
        modifier
            .clip(RoundedCornerShape(12.dp))
            .background(bg)
            .border(1.dp, fg.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .padding(horizontal = 16.dp, vertical = 14.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Icon(icon, null, tint = fg, modifier = Modifier.size(22.dp))
        Spacer(Modifier.width(12.dp))
        Text(message, color = fg, fontWeight = FontWeight.Medium,
            modifier = Modifier.weight(1f))
        if (onClose != null) {
            Spacer(Modifier.width(8.dp))
            Icon(Icons.Filled.Close, null, tint = fg,
                modifier = Modifier.size(18.dp).clickable(onClick = onClose))
        }
    }
}

private data class BannerStyle(val bg: Color, val fg: Color, val icon: ImageVector)

private fun style(t: BannerType): BannerStyle = when (t) {
    BannerType.Success -> BannerStyle(Color(0xFFE6F4EA), Color(0xFF1E7E34),
        Icons.Filled.CheckCircle)
    BannerType.Warning -> BannerStyle(Color(0xFFFFF4E5), Color(0xFFB26A00),
        Icons.Filled.WarningAmber)
    BannerType.Error -> BannerStyle(Color(0xFFFDECEA), Color(0xFFC62828),
        Icons.Filled.Error)
    BannerType.Info -> BannerStyle(Color(0xFFE8F0FE), Color(0xFF1A5DC7),
        Icons.Filled.Info)
}
