Seminario 1
===========

a) ntp

Seminario 2
===========

a)
-

Para hacer un fingerprint a toda la subred:

	# nmap -sS -T5 10.10.150.185/24

Los paquetes los podemos capturar con tcpdump:

	# tcpdump -i eth1 -n

Nota: Si no ponemos -n intentará resolver los dominios de las ips.

b,c,d)
-

Para comprobar el sistema de alertas configuraremos el programa fail2ban, que detecta intrusiones, por ejemplo en ssh. Si un atacante falla un numero máximo de veces la contraseña, será bloqueado, y enviará un mail a donde se haya especificado.

Para probar la contraseña podemos usar `medusa` o simplemente `ssh`:

	$ ssh rodrigo@lsi

Para comprobar que hayamos recibido la notificación:

	$ mail
	Mail version 8.1.2 01/15/2001.  Type ? for help.
	"/var/mail/rodrigo": 1 message 1 new
	>N  1 fail2ban@debian    Mon Nov 04 21:58   97/8211  [Fail2Ban] ssh: banned 10.10.5.121

