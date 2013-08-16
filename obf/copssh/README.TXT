COPSSH - A yet another SSH Server & Client for Windows
Version 3.1.4 - September 2010

README

1. WHAT IS COPSSH ? 

   COPSSH is an ssh server and client implementation for windows systems.
   It is a yet another packaging of portable openssh, cygwin, some popular 
   utilites, plus implementation of some best practices regarding security. 
   You can use COPSSH for remote administration of your systems or
   gathering remote information in a secure way.

2. HOW TO INSTALL COPSSH ?

   Supported platforms: Windows NT/2000/XP/2003/Vista/2008/7.

   COPSSH comes as a ZIP file containing an installer. Simply unzip your
   downloaded copy and run the package "Copssh_x.x.x_Installer.exe".

      1. Click Next.
	  
      2. Confirm accepting Licence Agreement.

      3. Specify an installation location.

      4. Specify a service account.

      5. Installation starts. By clicking 'Details' button, you can get
         more detailed information about installation. Check if everything
         seems ok.

      6. At the end of the installation, COPSSH gives you some information
         about the service and activation of users.


3. HOW TO USE COPSSH ?

   By default, as a security measure, no users are allowed to access your 
   machine via COPSSH. You can activate a user by choosing 'Activate a user'
   from Start menu. Deactivation can be done in the same way. Domain users
   are also supported.

   Activated users can use an ssh client to access to your machine. My favorite
   SSH client is PuTTY (http://www.chiark.greenend.org.uk/~sgtatham/putty)

   Password and public key authentication without agents are tested and
   function as expected.

4. HOW TO UNINSTALL COPSSH ?

   This one is easy too:

   1. Make sure that no clients are connected and all users are deactivated.

   2. Choose 'Uninstall COPSSH' from Start menu. Again, you can monitor
      uninstallation process by clicking 'Details' button.

6. LICENSE

   This package is licensed under following conditions:

      See LICENSE.OPENSSH.TXT for openssh license (free to use, MIT-license)
      See LICENSE.CYGWIN.TXT for cygwin license (free to use, GPL)
      See LICENSE.COPSSH.TXT for copssh license (free to use, GPL)

      Source code for openssh and cygwin are also available from the website.
 
7. VERSION INFO

   COPSSH  3.1.4
   OpenSSH 5.6p
   Openssl 0.9.8o
   Cygwin  1.7.7
   Zlib    1.2.3

8. CONTACT

   Feel free to contact me in case of problems, suggestions or other things.

   COPSSH website:     http://itefix.no/copssh
   e-mail:             post@itefix.no

9. DONATION

   Visit http://itefix.no/SupportItefix.html if you want to donate.
   