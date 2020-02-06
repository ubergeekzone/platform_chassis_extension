# A class for the Altis Platform requirements.
class platform_chassis_extension(
  $config
) {
	# Add an nginx config file that includes .config/nginx-additions*.conf
	file { "/etc/nginx/sites-available/${fqdn}.d/altis-additions.nginx.conf":
		ensure  => present,
		content => template('platform_chassis_extension/nginx.conf'),
		notify  => Service['nginx'],
		require => File["/etc/nginx/sites-available/${fqdn}.d"],
	}
}
