#!/bin/bash

echo "root=info
mailhub=${SMTP_HOST}
rewriteDomain=${SMTP_DOMAIN}
hostname=${SMTP_DOMAIN}
UseTLS=${SMTP_TLS}
UseSTARTTLS=${SMTP_STARTTLS}
AuthUser=${SMTP_USERNAME}
AuthPass=${SMTP_PASSWORD}
FromLineOverride=YES" > /etc/ssmtp/ssmtp.conf

exit 0