#!/bin/bash

# Variables
CERTS_DIR="$JAVA_HOME/certs"           # The directory containing the certificates
KEYSTORE_PATH="$JAVA_HOME/lib/security/cacerts"  # Path to Java KeyStore
KEYSTORE_PASSWORD="changeit"                # Password for KeyStore (default is 'changeit')
export PATH=$PATH;"$JAVA_HOME/bin/"
# Check if keytool is in PATH or specify the path manually
#KEYTOOL=$(which keytool)
KEYTOOL=$JAVA_HOME/bin/keytool
if [ -z "$KEYTOOL" ]; then
    echo "keytool not found. Please install Java or set keytool path."
    exit 1
fi

# Loop over all the certificate files in the directory
for certfile in "$CERTS_DIR"/*.crt "$CERTS_DIR"/*.pem "$CERTS_DIR"/*.cer; do
    # Check if file exists (skip non-matching patterns)
    if [ -f "$certfile" ]; then
        # Get the certificate alias (file name without extension)
        alias_name=$(basename "$certfile" | sed 's/\.[^.]*$//')

        # Check if the certificate is already in the keystore
        if "$KEYTOOL" -list -keystore "$KEYSTORE_PATH" -storepass "$KEYSTORE_PASSWORD" | grep -q "$alias_name"; then
            echo "Certificate $alias_name already exists in keystore, skipping..."
        else
            echo "Importing certificate $certfile with alias $alias_name..."
            # Import the certificate into the Java KeyStore
            "$KEYTOOL" -importcert -trustcacerts -file "$certfile" \
                       -alias "$alias_name" -keystore "$KEYSTORE_PATH" \
                       -storepass "$KEYSTORE_PASSWORD" -noprompt
            if [ $? -eq 0 ]; then
                echo "Successfully imported $certfile"
            else
                echo "Failed to import $certfile"
            fi
        fi
    fi
done