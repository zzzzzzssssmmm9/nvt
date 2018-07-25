###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_panos_pan_sa-2017_0010.nasl 8721 2018-02-08 13:40:24Z cfischer $
#
# Palo Alto PAN-OS  Information Disclosure in the Management Web Interface
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

CPE = 'cpe:/o:paloaltonetworks:pan-os';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.140253");
 script_cve_id("CVE-2017-7216");
 script_tag(name:"cvss_base", value:"4.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
 script_version ("$Revision: 8721 $");

 script_name("Palo Alto PAN-OS Information Disclosure in the Management Web Interface");

 script_xref(name:"URL", value:"https://securityadvisories.paloaltonetworks.com/Home/Detail/80");

 script_tag(name: "summary" , value:"A vulnerability exists in the Management Web Interface that could allow for Information Disclosure. The Management Web Interface does not properly validate specific request parameters which can potentially allow for Information Disclosure.");

 script_tag(name: "vuldetect" , value:"Check the version.");
 script_tag(name: "solution" , value:"Update to PAN-OS 7.1.9 or later");

 script_tag(name:"affected" , value:"PAN-OS 7.1.8 and earlier");
 script_tag(name:"solution_type", value: "VendorFix");

 script_tag(name:"qod_type", value:"package");

 script_tag(name:"last_modification", value:"$Date: 2018-02-08 14:40:24 +0100 (Thu, 08 Feb 2018) $");
 script_tag(name:"creation_date", value:"2017-04-12 16:25:31 +0200 (Wed, 12 Apr 2017)");
 script_category(ACT_GATHER_INFO);
 script_family("Palo Alto PAN-OS Local Security Checks");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_palo_alto_panOS_version.nasl");
 script_mandatory_keys("palo_alto_pan_os/version");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

model = get_kb_item( "palo_alto_pan_os/model" );

fix = '7.1.9';

if( version_is_less( version:version, test_version:fix ) )
{
  report = 'Installed version: ' + version + '\n' +
           'Fixed version:     ' + fix;

  if( model )
    report += '\nModel:             ' + model;

  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

