package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlin.math.roundToInt

/** Price with optional old price and a discount badge. */
@Composable
fun PriceTag(
    price: Double,
    modifier: Modifier = Modifier,
    oldPrice: Double? = null,
    currency: String = "$",
) {
    val scheme = MaterialTheme.colorScheme
    val hasDiscount = oldPrice != null && oldPrice > price
    val percent = if (hasDiscount)
        (((oldPrice!! - price) / oldPrice) * 100).roundToInt() else 0
    Row(modifier, verticalAlignment = Alignment.Bottom) {
        Text("$currency${"%.2f".format(price)}",
            fontSize = 24.sp, fontWeight = FontWeight.Bold,
            color = scheme.primary)
        if (hasDiscount) {
            Spacer(Modifier.width(8.dp))
            Text("$currency${"%.2f".format(oldPrice)}",
                fontSize = 15.sp, color = scheme.onSurfaceVariant,
                textDecoration = TextDecoration.LineThrough,
                modifier = Modifier.padding(bottom = 3.dp))
            Spacer(Modifier.width(8.dp))
            Box(
                Modifier
                    .padding(bottom = 3.dp)
                    .clip(RoundedCornerShape(6.dp))
                    .background(scheme.errorContainer)
                    .padding(horizontal = 8.dp, vertical = 3.dp),
            ) {
                Text("-$percent%", color = scheme.onErrorContainer,
                    fontWeight = FontWeight.Bold, fontSize = 12.sp)
            }
        }
    }
}
