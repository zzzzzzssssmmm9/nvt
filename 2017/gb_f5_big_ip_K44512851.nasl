###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_K44512851.nasl 9286 2018-04-04 03:29:40Z ckuersteiner $
#
# F5 BIG-IP - OpenSSL vulnerability CVE-2017-3732
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.140168");
 script_cve_id("CVE-2017-3732","CVE-2016-9244");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_version ("$Revision: 9286 $");

 script_name("F5 BIG-IP - OpenSSL vulnerability CVE-2017-3732");

 script_xref(name:"URL", value:"https://support.f5.com/csp/article/K44512851");

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "solution", value:"See the referenced vendor advisory for a solution.");
 script_tag(name: "summary", value:"Multiple vulnerabilities in OpenSSL affecting F5 Big IP.");
 script_tag(name: "impact", value:"A truncated packet may cause a server or client to perform an out-of-bounds read, possibly resulting in a crash.");
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2018-04-04 05:29:40 +0200 (Wed, 04 Apr 2018) $");
 script_tag(name:"creation_date", value:"2017-02-21 11:08:12 +0100 (Tue, 21 Feb 2017)");
 script_category(ACT_GATHER_INFO);
 script_family("F5 Local Security Checks");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
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

check_f5['LTM'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;11.2.1;');

check_f5['AAM'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;');

check_f5['AFM'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;');

check_f5['AVR'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;');

check_f5['APM'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;');

check_f5['ASM'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;11.2.1;');

check_f5['LC'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;11.2.1;');

check_f5['PEM'] = make_array( 'affected',   '13.0.0;12.1.0-12.1.2;',
                              'unaffected', '13.1.0;13.0.1;12.1.3;12.0.0;11.4.0-11.6.1;11.2.1;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

