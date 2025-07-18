#!/bin/bash

EMAILS=(
    "lcummings73@outlook.com"
    "prcsmama@gmail.com"
    "binxboxall@yahoo.com"
    "patricksquarepants@hotmail.com"
    "brcsmama@hotmail.com"
    "lcummings@clarkdietrich.com"
)

USERNAMES=(
    "prcsmama"
    "prcsmama2"
    "lcummings73"
    "ehlc73"
    "guessbaby"
    "silver_06"
)

PLATFORMS=(
    "tinder.com"
    "plentyoffish.com"
    "bumble.com"
    "badoo.com"
    "ashleymadison.com"
    "okcupid.com"
    "skype.com"
    "teams.microsoft.com"
    "line.me"
    "twilio.com"
    "facebook.com"
    "snapchat.com"
    "instagram.com"
    "pof.com"
    "zoosk.com"
    "tagged.com"
    "fetlife.com"
    "grindr.com"
    "kik.com"
    "blackpeoplemeet.com"
    "adultfriendfinder.com"
    "hinge.co"
    "tawk.to"
    "hily.com"
    "telegram.org"
    "match.com"
    "seeking.com"
    "recon.com"
    "flirt.com"
    "sdc.com"
)

mkdir -p super_osint_logs/email_logs
mkdir -p super_osint_logs/username_logs

check_email() {
    email=$1
    echo "Checking email: $email"
    for site in "${PLATFORMS[@]}"; do
        response=$(curl -s -I -L -m 15 -A "Mozilla/5.0" "https://$site/forgot-password" 2>/dev/null)
        status=$(echo "$response" | grep HTTP | tail -n1 | awk '{print $2}')
        redirect=$(echo "$response" | grep -i 'Location:' | tail -n1 | awk '{print $2}')
        echo "[EMAIL: $email] [$site] Status: $status Redirect: $redirect" | tee -a "super_osint_logs/email_logs/$email.log"
    done
}

check_username() {
    user=$1
    echo "Checking username: $user"
    for site in "${PLATFORMS[@]}"; do
        url="https://$site/$user"
        response=$(curl -s -I -L -m 15 -A "Mozilla/5.0" "$url" 2>/dev/null)
        status=$(echo "$response" | grep HTTP | tail -n1 | awk '{print $2}')
        redirect=$(echo "$response" | grep -i 'Location:' | tail -n1 | awk '{print $2}')
        echo "[USERNAME: $user] [$site] Status: $status Redirect: $redirect" | tee -a "super_osint_logs/username_logs/$user.log"
    done
}

main() {
    echo "Running Super OSINT Scanner at $(date)" > super_osint_logs/summary_report.txt
    for email in "${EMAILS[@]}"; do
        check_email "$email"
    done

    for user in "${USERNAMES[@]}"; do
        check_username "$user"
    done
    echo "Scan complete. Logs saved to super_osint_logs/."
}

main



