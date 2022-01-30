#!/bin/bash

echo "Enabling HIDPI..."
# Enable HiDPI
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true

PRODUCT_NAME="Dell G7 Display"
VENDOR_DEC=$(ioreg -lw0 | grep DisplayVendorID | sed 's/.*= //g')
PRODUCT_DEC=$(ioreg -lw0 | grep DisplayProductID | sed 's/.*= //g')
VENDOR=$(printf "%x\n" $VENDOR_DEC)
PRODUCT=$(printf "%x\n" $PRODUCT_DEC)

# if [ -d "/Library/Displays/Contents/Resources/Overrides" ]; then
#     DISPLAYS_PATH=/Library/Displays/Contents/Resources/Overrides
# fi

sudo mkdir -p /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-$VENDOR/
sudo mv ~/Desktop/HiDPI/Icons.plist /Library/Displays/Contents/Resources/Overrides/
sudo mv ~/Desktop/HiDPI/DisplayProductID-xxx.icns /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-$VENDOR/DisplayProductID-$PRODUCT.icns

cat > DisplayProductID-$PRODUCT << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>DisplayProductID</key>
        <integer>$PRODUCT_DEC</integer>
    <key>DisplayVendorID</key>
        <integer>$VENDOR_DEC</integer>
    <key>DisplayProductName</key>
        <string>$PRODUCT_NAME</string>
    <key>scale-resolutions</key>
        <array>
            <data>AAANIAAAB2IA</data>
            <data>AAALIAAABkQA</data>
            <data>AAAKAAAABaAA</data>
            <data>AAAIAAAABIAA</data>
            <data>AAAKAAAABkAAAAABACAAAA==</data>
            <data>AAAKAAAABaAAAAABACAAAA==</data>
            <data>AAAHgAAABLAAAAABACAAAA==</data>
            <data>AAAHgAAABDgAAAABACAAAA==</data>
            <data>AAAFAAAAAtAAAAABACAAAA==</data>
            <data>AAAGkAAAA7AAAAAB</data>
            <data>AAAGQAAAA4QAAAAB</data>
            <data>AAAFoAAAAyoAAAAB</data>
            <data>AAAFAAAAAtAAAAAB</data>
            <data>AAAEgAAAAogAAAAB</data>
            <data>AAAEAAAAAkAAAAAB</data>
            <data>AAADSAAAAdQAAAAB</data>
            <data>AAADIAAAAcIAAAAB</data>
            <data>AAACgAAAAWgAAAAB</data>
            <data>AAANIAAAB2IAAAAJAKAAAA==</data>
            <data>AAALQAAABlQAAAAJAKAAAA==</data>
            <data>AAAKAAAABaAAAAAJAKAAAA==</data>
            <data>AAAIAAAABIAAAAAJAKAAAA==</data>
            <data>AAAHgAAABDgAAAAJAKAAAA==</data>
            <data>AAAGkAAAA7AAAAAJAKAAAA==</data>
            <data>AAAGQAAAA4QAAAAJAKAAAA==</data>
            <data>AAAFAAAAAtAAAAAJAKAAAA==</data>
        </array>
    <key>target-default-ppmm</key>
        <real>10.0699301</real>
</dict>
</plist>
EOF

echo "Moving files to destination folder..."
# Move file to Overrides folder
sudo mv DisplayProductID-$PRODUCT /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-$VENDOR/

echo "Finished. Please reboot to take effect!"
echo
exit 1