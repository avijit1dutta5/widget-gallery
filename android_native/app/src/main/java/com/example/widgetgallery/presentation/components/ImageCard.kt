package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Image
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/**
 * Image card with a gradient title overlay. To keep the project
 * dependency-free this renders a themed gradient placeholder; swap in
 * Coil's AsyncImage to load [imageUrl] for real.
 */
@Composable
fun ImageCard(
    imageUrl: String,
    title: String,
    modifier: Modifier = Modifier,
    subtitle: String? = null,
    height: Dp = 180.dp,
) {
    val scheme = MaterialTheme.colorScheme
    Box(
        modifier
            .fillMaxWidth()
            .height(height)
            .clip(RoundedCornerShape(16.dp))
            .clickable {}
            .background(
                Brush.linearGradient(
                    listOf(scheme.primary, scheme.tertiary)
                )
            ),
    ) {
        Icon(
            Icons.Filled.Image, null,
            tint = Color.White.copy(alpha = 0.5f),
            modifier = Modifier.align(Alignment.Center).size(48.dp),
        )
        Box(
            Modifier
                .matchParentSize()
                .background(
                    Brush.verticalGradient(
                        listOf(Color.Transparent, Color.Black.copy(alpha = 0.7f))
                    )
                )
        )
        Column(
            Modifier.align(Alignment.BottomStart)
                .padding(start = 16.dp, end = 16.dp, bottom = 14.dp),
        ) {
            Text(title, color = Color.White, fontSize = 18.sp,
                fontWeight = FontWeight.Bold)
            if (subtitle != null) {
                Text(subtitle, color = Color.White.copy(alpha = 0.8f),
                    fontSize = 13.sp)
            }
        }
    }
}
