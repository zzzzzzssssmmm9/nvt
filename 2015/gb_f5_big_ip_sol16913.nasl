###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_sol16913.nasl 6453 2017-06-28 09:59:05Z teissa $
#
# F5 BIG-IP - SOL16913 - OpenSSL vulnerability CVE-2015-1789
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/h:f5:big-ip";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105364");
 script_cve_id("CVE-2015-1789");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
 script_version ("$Revision: 6453 $");

 script_name("F5 BIG-IP - SOL16913 - OpenSSL vulnerability CVE-2015-1789");

 script_xref(name:"URL", value:"https://support.f5.com/kb/en-us/solutions/public/16000/900/sol16913.html?sr=48315687");

 script_tag(name: "impact" , value:"An attacker can exploit this vulnerability by using crafted malformed certificates and Certificate Revocation Lists (CRLs); applications may stop responding when attempting to verify the malformed certificates or CRLs.");

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "insight" , value:"The X509_cmp_time function in crypto/x509/x509_vfy.c in OpenSSL before 0.9.8zg, 1.0.0 before 1.0.0s, 1.0.1 before 1.0.1n, and 1.0.2 before 1.0.2b allows remote attackers to cause a denial of service (out-of-bounds read and application crash) via a crafted length field in ASN1_TIME data, as demonstrated by an attack against a server that supports client authentication with a custom verification callback. (CVE-2015-1789)");

 script_tag(name: "solution" , value:"See the referenced vendor advisory for a solution.");
 script_tag(name: "summary" , value:"The remote host is missing a security patch.");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-06-28 11:59:05 +0200 (Wed, 28 Jun 2017) $");
 script_tag(name:"creation_date", value:"2015-09-18 15:05:03 +0200 (Fri, 18 Sep 2015)");
 script_category(ACT_GATHER_INFO);
 script_family("F5 Local Security Checks");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("gb_f5_big_ip_version.nasl");
 script_require_ports("Services/ssh", 22);
 script_mandatory_keys("f5/big_ip/version","f5/big_ip/active_modules");
 exit(0);
}

include("version_func.inc");
include("host_details.inc");
include("misc_func.inc");
include("f5.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

check_f5['LTM'] = make_array( 'affected',   '11.0.0-11.6.0;10.1.0-10.2.4;',
                              'unaffected', '12.0.0;');

check_f5['AAM'] = make_array( 'affected',   '11.4.0-11.6.0;',
                              'unaffected', '12.0.0;');

check_f5['AFM'] = make_array( 'affected',   '11.3.0-11.6.0;',
                              'unaffected', '12.0.0;');

check_f5['AVR'] = make_array( 'affected',   '11.0.0-11.6.0;',
                              'unaffected', '12.0.0;');

check_f5['APM'] = make_array( 'affected',   '11.0.0-11.6.0;10.1.0-10.2.4;',
                              'unaffected', '12.0.0;');

check_f5['ASM'] = make_array( 'affected',   '11.0.0-11.6.0;10.1.0-10.2.4;',
                              'unaffected', '12.0.0;');

check_f5['LC'] = make_array( 'affected',   '11.0.0-11.6.0;10.1.0-10.2.4;',
                              'unaffected', '12.0.0;');

check_f5['PEM'] = make_array( 'affected',   '11.3.0-11.6.0;',
                              'unaffected', '12.0.0;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

