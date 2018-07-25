###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_K92859602.nasl 6826 2017-08-01 08:56:22Z ckuersteiner $
#
# F5 BIG-IP - TMM iRules vulnerability CVE-2016-5024
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
 script_oid("1.3.6.1.4.1.25623.1.0.140115");
 script_cve_id("CVE-2016-5024");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P"); 
 script_version ("$Revision: 6826 $");

 script_name("F5 BIG-IP - BIG-IP TMM iRules vulnerability CVE-2016-5024");

 script_xref(name:"URL", value:"https://support.f5.com/csp/#/article/K92859602");

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "solution", value:"See the referenced vendor advisory for a solution.");
 script_tag(name: "summary", value:"On a BIG-IP LTM with a virtual server configured to parse RADIUS messages via an iRule, a remote attacker may be able to cause TMM to restart using malicious network traffic.");
 script_tag(name: "impact", value:"On a BIG-IP system that is configured for high-availability, this vulnerability would result in a failover event and may temporarily disrupt services. Where no failover device is available, traffic would be disrupted until the Traffic Management Microkernel (TMM) process has restarted.");
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-08-01 10:56:22 +0200 (Tue, 01 Aug 2017) $");
 script_tag(name:"creation_date", value:"2017-01-04 10:11:43 +0100 (Wed, 04 Jan 2017)");
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

check_f5['LTM'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;11.2.1;10.2.1-10.2.4;');

check_f5['AAM'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;');

check_f5['AFM'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;');

check_f5['AVR'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;11.2.1;');

check_f5['APM'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;11.2.1;10.2.1-10.2.4;');

check_f5['ASM'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;11.2.1;10.2.1-10.2.4;');

check_f5['GTM'] = make_array( 'affected',   '11.6.1;',
                              'unaffected', '11.6.1_HF1;11.4.0-11.6.0;11.2.1;10.2.1-10.2.4;');

check_f5['LC'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;11.2.1;10.2.1-10.2.4;');

check_f5['PEM'] = make_array( 'affected',   '12.1.0-12.1.1;11.6.1;',
                              'unaffected', '13.0.0;12.1.2;12.0.0;11.6.1_HF1;11.4.0-11.6.0;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

