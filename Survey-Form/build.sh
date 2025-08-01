#!/bin/bash

# Performance Optimization Build Script
echo "🚀 Starting performance optimization build..."

# Create backup of original files
echo "📦 Creating backups..."
cp Index.html Index.html.backup
cp Index.css Index.css.backup

# Minify CSS (basic minification)
echo "🎨 Minifying CSS..."
cat Index.css | sed 's/\/\*.*\*\///g' | tr -d '\n' | sed 's/  */ /g' | sed 's/;}/}/g' | sed 's/: /:/g' | sed 's/ {/{/g' > Index.min.css

# Minify HTML (basic minification)
echo "📄 Minifying HTML..."
cat Index.html | tr -d '\n' | sed 's/>  *</></g' > Index.min.html

# Check file sizes
echo "📊 File size comparison:"
echo "Original CSS: $(wc -c < Index.css) bytes"
echo "Minified CSS: $(wc -c < Index.min.css) bytes"
echo "Original HTML: $(wc -c < Index.html) bytes"
echo "Minified HTML: $(wc -c < Index.min.html) bytes"

# Calculate savings
CSS_ORIGINAL=$(wc -c < Index.css)
CSS_MINIFIED=$(wc -c < Index.min.css)
HTML_ORIGINAL=$(wc -c < Index.html)
HTML_MINIFIED=$(wc -c < Index.min.html)

CSS_SAVINGS=$((CSS_ORIGINAL - CSS_MINIFIED))
HTML_SAVINGS=$((HTML_ORIGINAL - HTML_MINIFIED))
TOTAL_SAVINGS=$((CSS_SAVINGS + HTML_SAVINGS))

echo "💰 Total savings: ${TOTAL_SAVINGS} bytes"
echo "✅ Build complete!"