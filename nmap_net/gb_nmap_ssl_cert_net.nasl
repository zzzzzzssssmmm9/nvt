###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_ssl_cert_net.nasl 8087 2017-12-12 13:12:04Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: David Fifield
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "Retrieves a server's SSL certificate. The amount of information printed about the certificate
depends on the verbosity level. With no extra verbosity, the script prints the validity period and
the commonName, organizationName, stateOrProvinceName, and countryName of the subject.

'443/tcp open  https

  ssl-cert:

   Subject: commonName=www.paypal.com/organizationName=PayPal, Inc.\ /stateOrProvinceName=California/countryName=US

   Not valid before: 2009-05-28 00:00:00

   Not valid after:  2010-05-01 23:59:59'

With '-v' it adds the issuer name and fingerprints.

'443/tcp open  https

  ssl-cert:

   Subject: commonName=www.paypal.com/organizationName=PayPal, Inc.\ /stateOrProvinceName=California/countryName=US

   Issuer: commonName=VeriSign Class 3 Extended Validation SSL CA\ /organizationName=VeriSign, Inc./countryName=US

   Not valid before: 2009-05-28 00:00:00

   Not valid after:  2010-05-01 23:59:59

   MD5:   c5b8 7ddd ccc7 537f 8861 b476 078d e8fd

   SHA-1: dc5a cb8b 9eb9 b5de 7117 c536 8c15 0e75 ba88 702e'

With '-vv' it adds the PEM-encoded contents of the entire certificate.

'443/tcp open  https

  ssl-cert:

   Subject: commonName=www.paypal.com/organizationName=PayPal, Inc.\ /stateOrProvinceName=California/countryName=US/serialNumber=3014267\ /1.3.6.1.4.1.311.60.2.1.3=US/streetAddress=2211 N 1st St\ /1.3.6.1.4.1.311.60.2.1.2=Delaware/postalCode=95131-2021\ /localityName=San Jose/organizationalUnitName=Information Systems\ /2.5.4.15=V1.0, Clause 5.(b)

   Issuer: commonName=VeriSign Class 3 Extended Validation SSL CA\ /organizationName=VeriSign, Inc./countryName=US\ /organizationalUnitName=Terms of use at https://www.verisign.com/rpa (c)06

   Not valid before: 2009-05-28 00:00:00

   Not valid after:  2010-05-01 23:59:59

   MD5:   c5b8 7ddd ccc7 537f 8861 b476 078d e8fd

   SHA-1: dc5a cb8b 9eb9 b5de 7117 c536 8c15 0e75 ba88 702e

   -----BEGIN CERTIFICATE-----
   MIIFxzCCBK+gAwIBAgIQX02QuADDB7CVjZdooVge+zANBgkqhkiG9w0BAQUFADCB ...'";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.104002");
    script_version("$Revision: 8087 $");
    script_tag(name:"last_modification", value:"$Date: 2017-12-12 14:12:04 +0100 (Tue, 12 Dec 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
    script_name("Nmap NSE net: ssl-cert");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");


    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");


phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();


    nmap_nse_register(script:"ssl-cert", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"ssl-cert");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (ssl-cert.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
