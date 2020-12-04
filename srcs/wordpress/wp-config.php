<?php
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '${MYSQL_DB}' );

/** MySQL database username */
define( 'DB_USER', '${WP_USER}' );

/** MySQL database password */
define( 'DB_PASSWORD', '${WP_PASS}' );

define('WP_HOME', 'http://${EXTERNAL_IP}:5050');
define('WP_SITEURL', 'http://${EXTERNAL_IP}:5050');

/** MySQL hostname */
define( 'DB_HOST', '${MYSQL_SERVNAME}' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '+9-y>l|8.qg_l P%yI}2kCElH5Rl@:ma{X_AW7/?DQrq-PjBn[A3@n.Ao<xfn(=h');
define('SECURE_AUTH_KEY',  '-QwfIk>MBk(d;hSVUzS/vgs`4D[M<:c{?eF0ugun;i<x<+|GVFsQMncn&Mm#MoGs');
define('LOGGED_IN_KEY',    'Hk!(A-Hzs-nl3`Xu`@=Y?Lfl3g7Mz@D7n#zp5{ZoSi.|`*56|^}2y`u<_,)z*91C');
define('NONCE_KEY',        '}dmK&8o{P $pUeE$z wz3]b!hG,&6kjo-(Uaj.W;4D_nc#:{|V^Y}vlUo+IR:W99');
define('AUTH_SALT',        '+Akf;1qb=eiN@UP!Z(4JOfnguWNy<-kGpzzFt>EMOuGO]k,0?&+(<x[iXdx1z_`]');
define('SECURE_AUTH_SALT', 'b6;8x2U>z0;z{F )6)}4mv7buB~|5c|Yuuv|-t4I=v1 |r)|o1IBR;)?Za^Q[?P2');
define('LOGGED_IN_SALT',   'oF-~9DMc{|HO1 S5am-K}e4Jk6;~.N|71pTaS)<Z^CT)qKG_-F>;Ar82r`h!;[SV');
define('NONCE_SALT',       '|%RRo+DY-$o*|94XnXe_0]z`<Vzav<HEfb9E3T#kc@G%78eOR3am]]6p~8-Vs5T/');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* FTP information */

define('FTP_USER', '${FTP_USER}');
define('FTP_PASS', '${FTP_PASS}');
define('FTP_HOST', '${EXTERNAL_IP}:21');
define('FTP_SSL', false);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
