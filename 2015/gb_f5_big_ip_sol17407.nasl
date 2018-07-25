###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_sol17407.nasl 6333 2017-06-14 10:00:49Z teissa $
#
# F5 BIG-IP - SOL17407 - Datastor kernel vulnerability CVE-2015-7394
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
 script_oid("1.3.6.1.4.1.25623.1.0.105426");
 script_cve_id("CVE-2015-7394");
 script_tag(name:"cvss_base", value:"9.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
 script_version ("$Revision: 6333 $");

 script_name("F5 BIG-IP - SOL17407 - Datastor kernel vulnerability CVE-2015-7394");

 script_xref(name:"URL", value:"https://support.f5.com/kb/en-us/solutions/public/17000/400/sol17407.html");

 script_tag(name: "impact" , value:"An authenticated attacker who can upload and execute customized code on the BIG-IP system may be able to cause a denial-of-service (DoS) attack and/or gain administrative access to the system.");

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "insight" , value:"The datastor kernel module flaw in BIG-IP 11.1.0 through 11.6.0 can lead to a denial of service and/or elevation of privileges. (CVE-2015-7394)");

 script_tag(name: "solution" , value:"See the referenced vendor advisory for a solution.");
 script_tag(name: "summary" , value:"The remote host is missing a security patch.");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-06-14 12:00:49 +0200 (Wed, 14 Jun 2017) $");
 script_tag(name:"creation_date", value:"2015-10-28 11:06:18 +0100 (Wed, 28 Oct 2015)");
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

check_f5['LTM'] = make_array( 'affected',   '11.6.0;11.1.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;11.0.0;10.1.0-10.2.4;');

check_f5['AAM'] = make_array( 'affected',   '11.6.0;11.4.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;');

check_f5['AFM'] = make_array( 'affected',   '11.6.0;11.3.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;');

check_f5['AVR'] = make_array( 'affected',   '11.6.0;11.1.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;11.0.0;');

check_f5['APM'] = make_array( 'affected',   '11.6.0;11.1.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;11.0.0;10.1.0-10.2.4;');

check_f5['ASM'] = make_array( 'affected',   '11.6.0;11.1.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;11.0.0;10.1.0-10.2.4;');

check_f5['GTM'] = make_array( 'affected',   '11.6.0;11.1.0-11.5.3;',
                              'unaffected', '11.6.1;11.5.4;11.4.1_HF10;11.0.0;10.1.0-10.2.4;');

check_f5['LC'] = make_array( 'affected',   '11.6.0;11.1.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;11.0.0;10.1.0-10.2.4;');

check_f5['PEM'] = make_array( 'affected',   '11.6.0;11.3.0-11.5.3;',
                              'unaffected', '12.0.0;11.6.1;11.5.4;11.4.1_HF10;');

check_f5['PSM'] = make_array( 'affected',   '11.1.0-11.4.1;',
                              'unaffected', '11.4.1_HF10;11.0.0;10.1.0-10.2.4;');

check_f5['WAM'] = make_array( 'affected',   '11.1.0-11.3.0;',
                              'unaffected', '11.0.0;10.1.0-10.2.4;');

check_f5['WOM'] = make_array( 'affected',   '11.1.0-11.3.0;',
                              'unaffected', '11.0.0;10.1.0-10.2.4;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

