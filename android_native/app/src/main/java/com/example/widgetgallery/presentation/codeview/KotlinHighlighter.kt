package com.example.widgetgallery.presentation.codeview

import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.withStyle

/** Catppuccin Mocha code-editor palette. */
object CodePalette {
    val background = Color(0xFF1E1E2E)
    val surface = Color(0xFF313244)
    val gutter = Color(0xFF45475A)
    val text = Color(0xFFCDD6F4)
    val comment = Color(0xFF7F849C)
    val keyword = Color(0xFFCBA6F7)
    val string = Color(0xFFA6E3A1)
    val number = Color(0xFFFAB387)
    val type = Color(0xFFF9E2AF)
    val annotation = Color(0xFF89B4FA)
    val punctuation = Color(0xFFBAC2DE)
}

private val keywords = setOf(
    "abstract", "actual", "annotation", "as", "break", "by", "catch",
    "class", "companion", "const", "constructor", "continue", "crossinline",
    "data", "do", "else", "enum", "expect", "external", "false", "final",
    "finally", "for", "fun", "get", "if", "import", "in", "infix", "init",
    "inline", "inner", "interface", "internal", "is", "lateinit", "lazy",
    "noinline", "null", "object", "open", "operator", "out", "override",
    "package", "private", "protected", "public", "reified", "return",
    "sealed", "set", "super", "suspend", "tailrec", "this", "throw", "true",
    "try", "typealias", "val", "var", "vararg", "when", "where", "while",
)

private val token = Regex(
    "(/\\*[\\s\\S]*?\\*/|//[^\\n]*)" +              // 1 comment
        "|(\"\"\"[\\s\\S]*?\"\"\"|\"(?:\\\\.|[^\"\\\\\\n])*\")" + // 2 string
        "|(@[A-Za-z_][\\w]*)" +                     // 3 annotation
        "|(\\b\\d[\\d_]*\\.?\\d*[fLuU]?\\b)" +      // 4 number
        "|([A-Za-z_$][\\w$]*)" +                    // 5 identifier
        "|(\\s+)" +                                  // 6 whitespace
        "|(.)"                                       // 7 other
)

fun highlightKotlin(code: String): AnnotatedString = buildAnnotatedString {
    for (m in token.findAll(code)) {
        val g = m.groups
        when {
            g[1] != null -> styled(CodePalette.comment, m.value, italic = true)
            g[2] != null -> styled(CodePalette.string, m.value)
            g[3] != null -> styled(CodePalette.annotation, m.value)
            g[4] != null -> styled(CodePalette.number, m.value)
            g[5] != null -> {
                val w = m.value
                val c = when {
                    w in keywords -> CodePalette.keyword
                    w.first().isUpperCase() -> CodePalette.type
                    else -> CodePalette.text
                }
                styled(c, w)
            }
            g[6] != null -> append(m.value)
            else -> styled(CodePalette.punctuation, m.value)
        }
    }
}

private fun AnnotatedString.Builder.styled(
    color: Color,
    text: String,
    italic: Boolean = false,
) {
    withStyle(
        SpanStyle(
            color = color,
            fontStyle = if (italic) FontStyle.Italic else FontStyle.Normal,
        )
    ) { append(text) }
}
