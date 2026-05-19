package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.defaultMinSize
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/** Count badge overlaid on any content, with a 99+ cap. */
@Composable
fun NotificationBadge(
    count: Int,
    modifier: Modifier = Modifier,
    color: Color = Color(0xFFE53935),
    content: @Composable () -> Unit,
) {
    Box(modifier) {
        content()
        if (count > 0) {
            Box(
                Modifier
                    .align(Alignment.TopEnd)
                    .offset(x = 6.dp, y = (-6).dp)
                    .defaultMinSize(20.dp, 20.dp)
                    .clip(RoundedCornerShape(20.dp))
                    .background(color)
                    .border(2.dp, MaterialTheme.colorScheme.surface,
                        RoundedCornerShape(20.dp))
                    .padding(horizontal = 5.dp, vertical = 2.dp),
                contentAlignment = Alignment.Center,
            ) {
                Text(
                    if (count > 99) "99+" else "$count",
                    color = Color.White, fontSize = 11.sp,
                    fontWeight = FontWeight.Bold, textAlign = TextAlign.Center,
                )
            }
        }
    }
}
