<?php

declare(strict_types=1);

/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie. Needs to be 32 chars long.
 */
$cfg['blowfish_secret'] = 'Di7kmA]KIAz{IlU3q.Cm6w6]CHAqFq9H';

/* Servers configuration */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = '${MYSQL_SERVNAME}';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = '${MYSQL_USERNAME}';
$cfg['Servers'][$i]['password'] = '${MYSQL_PASSWORD}';

/* Directories for saving/loading files from server */
$cfg['UploadDir'] = '';
$cfg['PmaAbsoluteUri'] = '${EXTERNAL_IP}:5000';
$cfg['SaveDir'] = '';

$cfg['TempDir'] = 'tmp';
