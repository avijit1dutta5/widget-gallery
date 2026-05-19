package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.filled.StarBorder
import androidx.compose.material.icons.filled.StarHalf
import androidx.compose.material3.Icon
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import kotlin.math.floor

/** Read-only or interactive star rating. */
@Composable
fun RatingStars(
    rating: Float,
    modifier: Modifier = Modifier,
    max: Int = 5,
    size: Dp = 28.dp,
    color: Color = Color(0xFFFFB300),
    onRatingChange: ((Int) -> Unit)? = null,
) {
    Row(modifier) {
        for (i in 0 until max) {
            val filled = i < floor(rating).toInt()
            val half = !filled && i < rating
            val icon = when {
                filled -> Icons.Filled.Star
                half -> Icons.Filled.StarHalf
                else -> Icons.Filled.StarBorder
            }
            Icon(
                icon, null, tint = color,
                modifier = Modifier
                    .size(size)
                    .then(
                        if (onRatingChange != null)
                            Modifier.clickable { onRatingChange(i + 1) }
                        else Modifier
                    ),
            )
        }
    }
}
