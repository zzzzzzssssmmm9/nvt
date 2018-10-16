###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_cisco-sa-20160928-aaados.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# Cisco IOS Software AAA Login Denial of Service Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
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

CPE = "cpe:/o:cisco:ios";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106316");
  script_cve_id("CVE-2016-6393");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11523 $");

  script_name("Cisco IOS Software AAA Login Denial of Service Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160928-aaados");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the Authentication, Authorization, and Accounting (AAA)
service for remote Secure Shell Host (SSH) connections to the device for Cisco IOS Software could allow an
unauthenticated, remote attacker to cause the vulnerable device to reload.");

  script_tag(name:"insight", value:"The vulnerability is due to an error log message when a remote SSH
connection to the device fails AAA authentication. An attacker could exploit this vulnerability by attempting
to authenticate to the targeted device.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to cause a denial of service (DoS)
condition.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-09-29 15:56:34 +0700 (Thu, 29 Sep 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_ssh_cisco_ios_get_version.nasl");
  script_mandatory_keys("cisco_ios/version");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

affected = make_list(
		'12.0(5)DA',
		'12.0(5)DA1',
		'12.0(6)DA',
		'12.0(8)DA',
		'12.0(8)DA1',
		'12.0(8)DA3',
		'12.0(8)DA4',
		'12.0(1)DB',
		'12.0(2)DB',
		'12.0(3)DB',
		'12.0(4)DB',
		'12.0(5)DB',
		'12.0(7)DB',
		'12.0(7)DB1',
		'12.0(7)DB2',
		'12.0(3)DC',
		'12.0(3)DC1',
		'12.0(5)DC',
		'12.0(7)DC',
		'12.0(7)DC1',
		'12.0(26)S2c',
		'12.0(27)S4z',
		'12.0(28)S4z',
		'12.0(32)S11z',
		'12.0(32)S16',
		'12.0(32)S17',
		'12.0(32)S2a',
		'12.0(32)S6(c1)',
		'12.0(18)SL',
		'12.0(19)SP',
		'12.0(19)SP1',
		'12.0(20)SP',
		'12.0(20)SP1',
		'12.0(20)SP2',
		'12.0(21)SP',
		'12.0(21)SP1',
		'12.0(21)SP2',
		'12.0(21)SP3',
		'12.0(21)SP4',
		'12.0(31)SZ3',
		'12.0(1)XA',
		'12.0(1)XA1',
		'12.0(1)XA2',
		'12.0(1)XA3',
		'12.0(1)XA4',
		'12.0(1)XB',
		'12.0(1)XB1',
		'12.0(2)XC',
		'12.0(2)XC1',
		'12.0(2)XC2',
		'12.0(2)XD',
		'12.0(2)XD1',
		'12.0(2)XF',
		'12.0(2)XF1',
		'12.0(2)XF2',
		'12.0(7)XF',
		'12.0(7)XF1',
		'12.0(3)XG',
		'12.0(2)XH',
		'12.0(2)XH1',
		'12.0(4)XH',
		'12.0(4)XH1',
		'12.0(4)XH2',
		'12.0(4)XH3',
		'12.0(4)XH4',
		'12.0(4)XI',
		'12.0(4)XI1',
		'12.0(4)XI2',
		'12.0(4)XJ',
		'12.0(4)XJ1',
		'12.0(4)XJ2',
		'12.0(4)XJ3',
		'12.0(4)XJ4',
		'12.0(4)XJ5',
		'12.0(4)XJ6',
		'12.0(4)XL',
		'12.0(4)XL1',
		'12.0(4)XM',
		'12.0(4)XM1',
		'12.0(5)XN',
		'12.0(5)XQ',
		'12.0(5)XQ1',
		'12.0(6)XR',
		'12.0(7)XR',
		'12.0(7)XR1',
		'12.0(7)XR2',
		'12.0(7)XR3',
		'12.0(7)XR4',
		'12.0(5)XS',
		'12.0(5)XS1',
		'12.0(5)XS2',
		'12.0(7)XV',
		'12.0(5)XW',
		'12.1(3a)',
		'12.1(1)AA',
		'12.1(1)AA1',
		'12.1(1)AA2',
		'12.1(2a)AA',
		'12.1(3)AA',
		'12.1(4)AA',
		'12.1(5)AA',
		'12.1(6)AA',
		'12.1(7)AA',
		'12.1(8)AA',
		'12.1(8)AA1',
		'12.1(9)AA',
		'12.1(10)AA',
		'12.1(11)AX',
		'12.1(14)AX',
		'12.1(14)AX1',
		'12.1(14)AX2',
		'12.1(14)AX3',
		'12.1(14)AX4',
		'12.1(13)AY',
		'12.1(22)AY1',
		'12.1(4)CX',
		'12.1(7)CX',
		'12.1(7)CX1',
		'12.1(1)DA',
		'12.1(1)DA1',
		'12.1(2)DA',
		'12.1(3)DA',
		'12.1(4)DA',
		'12.1(5)DA',
		'12.1(5)DA1',
		'12.1(6)DA',
		'12.1(6)DA1',
		'12.1(6)DA2',
		'12.1(7)DA',
		'12.1(7)DA1',
		'12.1(7)DA2',
		'12.1(7)DA3',
		'12.1(1)DB',
		'12.1(1)DB1',
		'12.1(1)DB2',
		'12.1(3)DB',
		'12.1(3)DB1',
		'12.1(4)DB',
		'12.1(4)DB1',
		'12.1(4)DB2',
		'12.1(5)DB',
		'12.1(5)DB1',
		'12.1(5)DB2',
		'12.1(1)DC',
		'12.1(1)DC1',
		'12.1(1)DC2',
		'12.1(3)DC',
		'12.1(3)DC1',
		'12.1(3)DC2',
		'12.1(4)DC',
		'12.1(4)DC1',
		'12.1(4)DC2',
		'12.1(4)DC3',
		'12.1(5)DC',
		'12.1(5)DC1',
		'12.1(5)DC2',
		'12.1(5)DC3',
		'12.1(26)EB3',
		'12.1(27)EB',
		'12.1(14)EO',
		'12.1(14)EO1',
		'12.1(19)EO',
		'12.1(19)EO1',
		'12.1(19)EO2',
		'12.1(19)EO3',
		'12.1(19)EO4',
		'12.1(19)EO5',
		'12.1(19)EO6',
		'12.1(20)EO',
		'12.1(20)EO1',
		'12.1(20)EO2',
		'12.1(20)EO3',
		'12.1(20)EU',
		'12.1(20)EU1',
		'12.1(1)EY',
		'12.1(5)EY',
		'12.1(5)EY1',
		'12.1(5)EY2',
		'12.1(6)EY',
		'12.1(6)EY1',
		'12.1(7a)EY',
		'12.1(7a)EY1',
		'12.1(7a)EY2',
		'12.1(7a)EY3',
		'12.1(10)EY',
		'12.1(12c)EY',
		'12.1(6)EZ',
		'12.1(6)EZ1',
		'12.1(6)EZ2',
		'12.1(6)EZ3',
		'12.1(6)EZ4',
		'12.1(6)EZ5',
		'12.1(6)EZ6',
		'12.1(1)GA',
		'12.1(1)GA1',
		'12.1(1)XA',
		'12.1(1)XA1',
		'12.1(1)XA2',
		'12.1(1)XA3',
		'12.1(1)XA4',
		'12.1(1)XB',
		'12.1(1)XC',
		'12.1(1)XC1',
		'12.1(1)XD',
		'12.1(1)XD1',
		'12.1(1)XD2',
		'12.1(1)XE',
		'12.1(1)XE1',
		'12.1(2)XF',
		'12.1(2)XF1',
		'12.1(2)XF2',
		'12.1(2)XF3',
		'12.1(2)XF4',
		'12.1(2)XF5',
		'12.1(3)XG',
		'12.1(3)XG1',
		'12.1(3)XG2',
		'12.1(3)XG3',
		'12.1(3)XG4',
		'12.1(3)XG5',
		'12.1(3)XG6',
		'12.1(2a)XH',
		'12.1(2a)XH1',
		'12.1(2a)XH2',
		'12.1(2a)XH3',
		'12.1(3)XJ',
		'12.1(3)XK',
		'12.1(3)XL',
		'12.1(3a)XL1',
		'12.1(3a)XL2',
		'12.1(3a)XL3',
		'12.1(3a)XN',
		'12.1(3)XO',
		'12.1(3)XP',
		'12.1(3)XP1',
		'12.1(3)XP2',
		'12.1(3)XP3',
		'12.1(3)XP4',
		'12.1(3)XQ',
		'12.1(3)XQ1',
		'12.1(3)XQ2',
		'12.1(3)XQ3',
		'12.1(5)XR',
		'12.1(5)XR1',
		'12.1(5)XR2',
		'12.1(1)XS',
		'12.1(3)XS',
		'12.1(5)XS',
		'12.1(5)XS1',
		'12.1(5)XS2',
		'12.1(5)XS3',
		'12.1(5)XS4',
		'12.1(5)XS5',
		'12.1(2)XT2',
		'12.1(3)XT',
		'12.1(3)XT1',
		'12.1(3)XT2',
		'12.1(5)XU',
		'12.1(5)XU1',
		'12.1(5)XU2',
		'12.1(5)XV',
		'12.1(5)XV1',
		'12.1(5)XV2',
		'12.1(5)XV3',
		'12.1(5)XV4',
		'12.1(3)XW',
		'12.1(3)XW1',
		'12.1(3)XW2',
		'12.1(5)XX',
		'12.1(5)XX1',
		'12.1(5)XX2',
		'12.1(5)XX3',
		'12.1(4)XY',
		'12.1(4)XY1',
		'12.1(4)XY2',
		'12.1(4)XY3',
		'12.1(4)XY4',
		'12.1(4)XY5',
		'12.1(4)XY6',
		'12.1(4)XY7',
		'12.1(4)XY8',
		'12.1(4)XZ',
		'12.1(4)XZ1',
		'12.1(4)XZ2',
		'12.1(4)XZ3',
		'12.1(4)XZ4',
		'12.1(4)XZ5',
		'12.1(4)XZ6',
		'12.1(4)XZ7',
		'12.1(5)YA',
		'12.1(5)YA1',
		'12.1(5)YA2',
		'12.1(5)YC',
		'12.1(5)YC1',
		'12.1(5)YC2',
		'12.1(5)YC3',
		'12.1(5)YD',
		'12.1(5)YD1',
		'12.1(5)YD2',
		'12.1(5)YD3',
		'12.1(5)YD4',
		'12.1(5)YD5',
		'12.1(5)YD6',
		'12.1(5)YE',
		'12.1(5)YE1',
		'12.1(5)YE2',
		'12.1(5)YE3',
		'12.1(5)YE4',
		'12.1(5)YE5',
		'12.1(5)YE6',
		'12.1(5)YF',
		'12.1(5)YF1',
		'12.1(5)YF2',
		'12.1(5)YF3',
		'12.1(5)YF4',
		'12.1(5)YG',
		'12.1(5)YH',
		'12.1(5)YH1',
		'12.1(5)YH2',
		'12.1(5)YH3',
		'12.1(5)YH4',
		'12.1(5)YI',
		'12.1(5)YI1',
		'12.1(5)YI2',
		'12.1(11)YJ',
		'12.1(11)YJ1',
		'12.1(11)YJ2',
		'12.1(11)YJ3',
		'12.1(11)YJ4',
		'12.2(33)',
		'12.2(35)',
		'12.2(43)',
		'12.2(12)DA14',
		'12.2(46)EX',
		'12.2(52)EX',
		'12.2(52)EX1',
		'12.2(53)EX',
		'12.2(54)EX',
		'12.2(55)EX',
		'12.2(55)EX1',
		'12.2(55)EX2',
		'12.2(55)EX3',
		'12.2(58)EX',
		'12.2(58)EX1',
		'12.2(46)EY',
		'12.2(52)EY',
		'12.2(52)EY1',
		'12.2(52)EY1b',
		'12.2(52)EY1c',
		'12.2(52)EY2',
		'12.2(52)EY2a',
		'12.2(52)EY3',
		'12.2(52)EY3a',
		'12.2(52)EY3b',
		'12.2(52)EY4',
		'12.2(53)EY',
		'12.2(55)EY',
		'12.2(58)EY',
		'12.2(58)EY1',
		'12.2(58)EY2',
		'12.2(53)EZ',
		'12.2(55)EZ',
		'12.2(58)EZ',
		'12.2(58)EZ1',
		'12.2(60)EZ',
		'12.2(60)EZ1',
		'12.2(60)EZ2',
		'12.2(60)EZ3',
		'12.2(60)EZ4',
		'12.2(60)EZ5',
		'12.2(60)EZ6',
		'12.2(60)EZ7',
		'12.2(60)EZ8',
		'12.2(60)EZ9',
		'12.2(18)IXC1',
		'12.2(15)MC2n',
		'12.2(33)MRA1',
		'12.2(33)MRC',
		'12.2(30)S2',
		'12.2(28)SB14',
		'12.2(28)SB5c',
		'12.2(33)SB18',
		'12.2(33)SB6c',
		'12.2(33)SB8h',
		'12.2(34)SB4e',
		'12.2(34)SB5',
		'12.2(27)SBA3',
		'12.2(27)SBB4e',
		'12.2(27)SBC6',
		'12.2(33)SE',
		'12.2(36)SE',
		'12.2(37)SE2',
		'12.2(46)SE',
		'12.2(46)SE1',
		'12.2(46)SE2',
		'12.2(47)SE',
		'12.2(50)SE',
		'12.2(50)SE1',
		'12.2(50)SE2',
		'12.2(50)SE3',
		'12.2(50)SE4',
		'12.2(50)SE5',
		'12.2(52)SE',
		'12.2(52)SE1',
		'12.2(53)SE',
		'12.2(53)SE1',
		'12.2(53)SE2',
		'12.2(53)SE3',
		'12.2(54)SE',
		'12.2(55)SE',
		'12.2(55)SE1',
		'12.2(55)SE10',
		'12.2(55)SE2',
		'12.2(55)SE3',
		'12.2(55)SE4',
		'12.2(55)SE5',
		'12.2(55)SE6',
		'12.2(55)SE7',
		'12.2(55)SE8',
		'12.2(55)SE9',
		'12.2(57)SE',
		'12.2(58)SE',
		'12.2(58)SE1',
		'12.2(58)SE2',
		'12.2(36)SG',
		'12.2(44r)SG5',
		'12.2(54)SG',
		'12.2(54)SG1',
		'12.2(17)SL5',
		'12.2(19)SL',
		'12.2(44)SQ3',
		'12.2(33a)SR',
		'12.2(33r)SRD2',
		'12.2(25)SV1',
		'12.2(29)SV4',
		'12.2(25)SW3b',
		'12.2(17r)SX5',
		'12.2(17r)SX6',
		'12.2(18)SXF15',
		'12.2(18)SXF15a',
		'12.2(18)SXF16',
		'12.2(18)SXF17',
		'12.2(18)SXF17a',
		'12.2(18)SXF17b',
		'12.2(18)SXF17c',
		'12.2(18)SXG',
		'12.2(33)SXH4',
		'12.2(33)SXH4x',
		'12.2(33)SXH5',
		'12.2(33)SXH6',
		'12.2(33)SXH7',
		'12.2(33)SXH8',
		'12.2(33)SXH8a',
		'12.2(33)SXH8b',
		'12.2(33)SXI',
		'12.2(33)SXI0a',
		'12.2(33)SXI1',
		'12.2(33)SXI10',
		'12.2(33)SXI11',
		'12.2(33)SXI12',
		'12.2(33)SXI13',
		'12.2(33)SXI14',
		'12.2(33)SXI2',
		'12.2(33)SXI2a',
		'12.2(33)SXI3',
		'12.2(33)SXI4',
		'12.2(33)SXI4a',
		'12.2(33)SXI5',
		'12.2(33)SXI6',
		'12.2(33)SXI7',
		'12.2(33)SXI8',
		'12.2(33)SXI8a',
		'12.2(33)SXI9',
		'12.2(33)SXJ',
		'12.2(33)SXJ1',
		'12.2(33)SXJ10',
		'12.2(33)SXJ2',
		'12.2(33)SXJ3',
		'12.2(33)SXJ4',
		'12.2(33)SXJ5',
		'12.2(33)SXJ6',
		'12.2(33)SXJ7',
		'12.2(33)SXJ8',
		'12.2(33)SXJ9',
		'12.2(50)SY',
		'12.2(50)SY1',
		'12.2(50)SY2',
		'12.2(50)SY3',
		'12.2(50)SY4',
		'12.2(8)TPC10d',
		'12.2(28)VZ',
		'12.2(54)WO',
		'12.2(33)XNH',
		'12.2(46)XO',
		'12.2(54)XO',
		'12.2(4)YA13',
		'12.2(13)ZH11',
		'12.2(33)ZM',
		'12.2(28)ZV2',
		'12.2(28b)ZV1',
		'12.2(18)ZY3',
		'12.2(18)ZYA1',
		'12.2(18)ZYA2',
		'12.2(18)ZYA3',
		'12.2(18)ZYA3a',
		'12.2(18)ZYA3b',
		'12.2(18)ZYA3c',
		'12.2(18)ZYA3d',
		'12.3(8r)',
		'12.3(12f)',
		'12.3(13c)',
		'12.3(9a)BC10',
		'12.3(21b)BC5',
		'12.3(8)EU',
		'12.3(8)JA3',
		'12.3(11)JA5',
		'12.3(8)JEA4',
		'12.3(8)JEB2',
		'12.3(8)JEC4',
		'12.3(2)JK4',
		'12.3(8)JK2',
		'12.3(2)JL5',
		'12.3(7)JX13',
		'12.3(3d)M0',
		'12.3(4)T13',
		'12.3(14)T8',
		'12.3(14)T9',
		'12.3(4)TPC11c',
		'12.3(8)VA',
		'12.3(2)XA8',
		'12.3(2)XC6',
		'12.3(2)XE6',
		'12.3(7)XI1',
		'12.3(7)XI8ba',
		'12.3(7)XR8',
		'12.3(8)XX2f',
		'12.3(2)XZ',
		'12.3(11)YK4',
		'12.3(13)YM3',
		'12.3(11)YS3',
		'12.3(14)YV',
		'12.3(11)YZ3',
		'12.3(14)ZC',
		'12.4(14)',
		'12.4(19a)',
		'12.4(19b)',
		'12.4(21a)',
		'12.4(21b)',
		'12.4(23)',
		'12.4(23a)',
		'12.4(23b)',
		'12.4(25)',
		'12.4(25a)',
		'12.4(25b)',
		'12.4(25c)',
		'12.4(25d)',
		'12.4(25e)',
		'12.4(25f)',
		'12.4(25g)',
		'12.4(69)',
		'12.4(22)GC1',
		'12.4(24)GC1',
		'12.4(24)GC3',
		'12.4(24)GC3a',
		'12.4(24)GC4',
		'12.4(24)GC5',
		'12.4(3g)JA3',
		'12.4(10a)JA',
		'12.4(10b)JA1a',
		'12.4(10b)JA5',
		'12.4(13d)JA1',
		'12.4(13d)JA1a',
		'12.4(16b)JA2',
		'12.4(21a)JA',
		'12.4(21a)JA1',
		'12.4(21a)JA2',
		'12.4(21a)JA3',
		'12.4(21a)JA50',
		'12.4(23c)JA',
		'12.4(23c)JA1',
		'12.4(23c)JA10',
		'12.4(23c)JA2',
		'12.4(23c)JA3',
		'12.4(23c)JA4',
		'12.4(23c)JA5',
		'12.4(23c)JA6',
		'12.4(23c)JA7',
		'12.4(23c)JA8',
		'12.4(23c)JA9',
		'12.4(25d)JA',
		'12.4(25d)JA1',
		'12.4(25d)JA2',
		'12.4(25e)JA',
		'12.4(25e)JA1',
		'12.4(25e)JAL',
		'12.4(25e)JAL1',
		'12.4(25e)JAL1a',
		'12.4(25e)JAL2',
		'12.4(25e)JAM',
		'12.4(25e)JAM2',
		'12.4(25e)JAM3',
		'12.4(25e)JAM4',
		'12.4(25e)JAM5',
		'12.4(25e)JAN1',
		'12.4(25e)JAO',
		'12.4(25e)JAO1',
		'12.4(25e)JAO2',
		'12.4(25e)JAO3',
		'12.4(25e)JAO3a',
		'12.4(25e)JAO4',
		'12.4(25e)JAO5',
		'12.4(25e)JAO6',
		'12.4(25e)JAP',
		'12.4(25e)JAP1',
		'12.4(25e)JAP100',
		'12.4(25e)JAP4',
		'12.4(25e)JAP5',
		'12.4(25e)JAP6',
		'12.4(25e)JAP7',
		'12.4(25e)JAP8',
		'12.4(25e)JAP9',
		'12.4(25)JAX',
		'12.4(25d)JAX',
		'12.4(25d)JAX1',
		'12.4(25e)JAX',
		'12.4(25e)JAX1',
		'12.4(25e)JAX2',
		'12.4(25e)JAZ',
		'12.4(25d)JB1',
		'12.4(10b)JD',
		'12.4(10b)JDA4',
		'12.4(10b)JDD1',
		'12.4(10b)JDE0',
		'12.4(21a)JHA',
		'12.4(21a)JHA1',
		'12.4(21a)JHC',
		'12.4(3)JL3',
		'12.4(3g)JMA2',
		'12.4(3g)JMB1',
		'12.4(21a)JX',
		'12.4(25e)JX',
		'12.4(21a)JY',
		'12.4(23)JY',
		'12.4(23c)JY',
		'12.4(23c)JZ',
		'12.4(11)MD11',
		'12.4(15)MD',
		'12.4(15)MD1',
		'12.4(15)MD2',
		'12.4(15)MD3',
		'12.4(15)MD4',
		'12.4(15)MD5',
		'12.4(15)MD6',
		'12.4(22)MD',
		'12.4(22)MD1',
		'12.4(22)MD2',
		'12.4(22)MD3',
		'12.4(24)MD',
		'12.4(24)MD1',
		'12.4(24)MD2',
		'12.4(24)MD3',
		'12.4(24)MD4',
		'12.4(24)MD5',
		'12.4(24)MD6',
		'12.4(24)MD7',
		'12.4(24)MD8',
		'12.4(22)MDA',
		'12.4(22)MDA1',
		'12.4(22)MDA2',
		'12.4(22)MDA3',
		'12.4(22)MDA4',
		'12.4(22)MDA5',
		'12.4(22)MDA6',
		'12.4(22)MDA7',
		'12.4(24)MDA1',
		'12.4(24)MDA10',
		'12.4(24)MDA11',
		'12.4(24)MDA12',
		'12.4(24)MDA13',
		'12.4(24)MDA2',
		'12.4(24)MDA3',
		'12.4(24)MDA4',
		'12.4(24)MDA5',
		'12.4(24)MDA6',
		'12.4(24)MDA7',
		'12.4(24)MDA8',
		'12.4(24)MDA9',
		'12.4(24)MDB',
		'12.4(24)MDB1',
		'12.4(24)MDB10',
		'12.4(24)MDB11',
		'12.4(24)MDB12',
		'12.4(24)MDB13',
		'12.4(24)MDB14',
		'12.4(24)MDB15',
		'12.4(24)MDB16',
		'12.4(24)MDB17',
		'12.4(24)MDB18',
		'12.4(24)MDB19',
		'12.4(24)MDB2',
		'12.4(24)MDB3',
		'12.4(24)MDB4',
		'12.4(24)MDB5',
		'12.4(24)MDB5a',
		'12.4(24)MDB5b',
		'12.4(24)MDB6',
		'12.4(24)MDB7',
		'12.4(24)MDB8',
		'12.4(24)MDB9',
		'12.4(24)MDC',
		'12.4(24)MDC1',
		'12.4(22)MF',
		'12.4(12)MR',
		'12.4(12)MR1',
		'12.4(12)MR2',
		'12.4(16)MR',
		'12.4(16)MR1',
		'12.4(16)MR2',
		'12.4(19)MR',
		'12.4(19)MR1',
		'12.4(19)MR2',
		'12.4(19)MR3',
		'12.4(20)MR',
		'12.4(20)MR2',
		'12.4(20)MRB',
		'12.4(20)MRB1',
		'12.4(20)MRB2',
		'12.4(22)MX',
		'12.4(6)SW',
		'12.4(11)SW3',
		'12.4(15)SW',
		'12.4(15)SW1',
		'12.4(15)SW2',
		'12.4(15)SW3',
		'12.4(15)SW4',
		'12.4(15)SW5',
		'12.4(15)SW6',
		'12.4(15)SW7',
		'12.4(15)SW8',
		'12.4(15)SW8a',
		'12.4(15)SW9',
		'12.4(15)SW9a',
		'12.4(13r)T',
		'12.4(13r)T11',
		'12.4(15)T',
		'12.4(15)T1',
		'12.4(15)T10',
		'12.4(15)T11',
		'12.4(15)T12',
		'12.4(15)T13',
		'12.4(15)T14',
		'12.4(15)T15',
		'12.4(15)T16',
		'12.4(15)T17',
		'12.4(15)T2',
		'12.4(15)T3',
		'12.4(15)T4',
		'12.4(15)T5',
		'12.4(15)T6',
		'12.4(15)T7',
		'12.4(15)T8',
		'12.4(15)T9',
		'12.4(20)T',
		'12.4(20)T1',
		'12.4(20)T2',
		'12.4(20)T3',
		'12.4(20)T4',
		'12.4(20)T5',
		'12.4(20)T6',
		'12.4(20)T6a',
		'12.4(22)T',
		'12.4(22)T1',
		'12.4(22)T2',
		'12.4(22)T3',
		'12.4(22)T4',
		'12.4(22)T5',
		'12.4(22)T6',
		'12.4(24)T',
		'12.4(24)T1',
		'12.4(24)T2',
		'12.4(24)T3',
		'12.4(24)T3e',
		'12.4(24)T3f',
		'12.4(24)T4',
		'12.4(24)T4a',
		'12.4(24)T4b',
		'12.4(24)T4c',
		'12.4(24)T4d',
		'12.4(24)T4e',
		'12.4(24)T4f',
		'12.4(24)T4l',
		'12.4(24)T5',
		'12.4(24)T6',
		'12.4(24)T7',
		'12.4(24)T8',
		'12.4(6)XE5',
		'12.4(9)XF',
		'12.4(11)XF',
		'12.4(15)XF',
		'12.4(14)XK',
		'12.4(15)XL',
		'12.4(15)XL1',
		'12.4(15)XL2',
		'12.4(15)XL3',
		'12.4(15)XL4',
		'12.4(15)XL5',
		'12.4(15)XL6',
		'12.4(15)XM',
		'12.4(15)XM1',
		'12.4(15)XM2',
		'12.4(15)XM3',
		'12.4(15)XN',
		'12.4(115)XN',
		'12.4(4)XP',
		'12.4(15)XQ',
		'12.4(15)XQ1',
		'12.4(15)XQ2',
		'12.4(15)XQ2a',
		'12.4(15)XQ2b',
		'12.4(15)XQ3',
		'12.4(15)XQ4',
		'12.4(15)XQ5',
		'12.4(15)XQ6',
		'12.4(15)XQ7',
		'12.4(15)XQ8',
		'12.4(15)XR',
		'12.4(15)XR1',
		'12.4(15)XR10',
		'12.4(15)XR2',
		'12.4(15)XR3',
		'12.4(15)XR4',
		'12.4(15)XR5',
		'12.4(15)XR6',
		'12.4(15)XR7',
		'12.4(15)XR8',
		'12.4(15)XR9',
		'12.4(22)XR1',
		'12.4(22)XR10',
		'12.4(22)XR11',
		'12.4(22)XR12',
		'12.4(22)XR2',
		'12.4(22)XR3',
		'12.4(22)XR4',
		'12.4(22)XR5',
		'12.4(22)XR6',
		'12.4(22)XR7',
		'12.4(22)XR8',
		'12.4(22)XR9',
		'12.4(11)XV2',
		'12.4(11)XW',
		'12.4(11)XW1',
		'12.4(11)XW10',
		'12.4(11)XW2',
		'12.4(11)XW3',
		'12.4(11)XW4',
		'12.4(11)XW5',
		'12.4(11)XW6',
		'12.4(11)XW7',
		'12.4(11)XW8',
		'12.4(11)XW9',
		'12.4(15)XY',
		'12.4(15)XY1',
		'12.4(15)XY2',
		'12.4(15)XY3',
		'12.4(15)XY4',
		'12.4(15)XY5',
		'12.4(15)XZ',
		'12.4(15)XZ1',
		'12.4(15)XZ2',
		'12.4(20)YA',
		'12.4(20)YA1',
		'12.4(20)YA2',
		'12.4(20)YA3',
		'12.4(22)YB',
		'12.4(22)YB1',
		'12.4(22)YB2',
		'12.4(22)YB3',
		'12.4(22)YB4',
		'12.4(22)YB5',
		'12.4(22)YB6',
		'12.4(22)YB7',
		'12.4(22)YB8',
		'12.4(22)YD',
		'12.4(22)YD1',
		'12.4(22)YD2',
		'12.4(22)YD3',
		'12.4(22)YD4',
		'12.4(22)YE',
		'12.4(22)YE1',
		'12.4(22)YE2',
		'12.4(22)YE3',
		'12.4(22)YE4',
		'12.4(22)YE5',
		'12.4(22)YE6',
		'12.4(24)YE',
		'12.4(24)YE1',
		'12.4(24)YE2',
		'12.4(24)YE3',
		'12.4(24)YE3a',
		'12.4(24)YE3b',
		'12.4(24)YE3c',
		'12.4(24)YE3d',
		'12.4(24)YE3e',
		'12.4(24)YE4',
		'12.4(24)YE5',
		'12.4(24)YE6',
		'12.4(24)YE7',
		'12.4(24)YG1',
		'12.4(24)YG2',
		'12.4(24)YG3',
		'12.4(24)YG4',
		'15.0DPA',
		'15.0DPB',
		'15.0(2)EB',
		'15.0(2)EC',
		'15.0(2)ED',
		'15.0(2)ED1',
		'15.0(2)EF',
		'15.0(2)EG',
		'15.0(2)EH',
		'15.0(2)EJ',
		'15.0(2)EJ1',
		'15.0(2)EK',
		'15.0(2)EK1',
		'15.0(1)EW',
		'15.0(2)EW',
		'15.0(3)EW',
		'15.0(4)EW',
		'15.0(5)EW',
		'15.0(6)EW',
		'15.0(7)EW',
		'15.0(8)EW',
		'15.0(1)EX',
		'15.0(2)EX',
		'15.0(2)EX1',
		'15.0(2)EX10',
		'15.0(2)EX2',
		'15.0(2)EX3',
		'15.0(2)EX4',
		'15.0(2)EX5',
		'15.0(2)EX8',
		'15.0(2a)EX5',
		'15.0(1)EY',
		'15.0(1)EY1',
		'15.0(1)EY2',
		'15.0(2)EY',
		'15.0(2)EY1',
		'15.0(2)EY2',
		'15.0(2)EY3',
		'15.0(2)EZ',
		'15.0(1)M',
		'15.0(1)M1',
		'15.0(1)M10',
		'15.0(1)M11',
		'15.0(1)M2',
		'15.0(1)M3',
		'15.0(1)M4',
		'15.0(1)M5',
		'15.0(1)M5a',
		'15.0(1)M6',
		'15.0(1)M7',
		'15.0(1)M8',
		'15.0(1)M9',
		'15.0(1r)M1',
		'15.0(1r)M3',
		'15.0(1r)M6',
		'15.0(1r)M13',
		'15.0(1r)M15',
		'15.0(1)MR',
		'15.0(1)MR1',
		'15.0(2)MR',
		'15.0(1)S',
		'15.0(1)S1',
		'15.0(1)S10',
		'15.0(1)S2',
		'15.0(1)S3a',
		'15.0(1)S4',
		'15.0(1)S4a',
		'15.0(1)S5',
		'15.0(1)S6',
		'15.0(1)SE',
		'15.0(1)SE1',
		'15.0(1)SE2',
		'15.0(1)SE3',
		'15.0(2)SE',
		'15.0(2)SE1',
		'15.0(2)SE2',
		'15.0(2)SE3',
		'15.0(2)SE4',
		'15.0(2)SE5',
		'15.0(2)SE6',
		'15.0(2)SE7',
		'15.0(2)SE9',
		'15.0(2a)SE9',
		'15.0(2)SG',
		'15.0(2)SG1',
		'15.0(2)SG10',
		'15.0(2)SG2',
		'15.0(2)SG3',
		'15.0(2)SG4',
		'15.0(2)SG5',
		'15.0(2)SG6',
		'15.0(2)SG7',
		'15.0(2)SG8',
		'15.0(2)SG9',
		'15.0SID',
		'15.0(2)SQD',
		'15.0(2)SQD1',
		'15.0(2)SQD2',
		'15.0(1)SY',
		'15.0(1)SY0',
		'15.0(1)SY1',
		'15.0(1)SY10',
		'15.0(1)SY2',
		'15.0(1)SY3',
		'15.0(1)SY4',
		'15.0(1)SY5',
		'15.0(1)SY6',
		'15.0(1)SY7',
		'15.0(1)SY7a',
		'15.0(1)SY8',
		'15.0(1)SY9',
		'15.0(1)XA',
		'15.0(1)XA1',
		'15.0(1)XA2',
		'15.0(1)XA3',
		'15.0(1)XA4',
		'15.0(1)XA5',
		'15.0(1)XO',
		'15.0(1)XO1',
		'15.0(2)XO',
		'15.1(2)EY',
		'15.1(2)EY1a',
		'15.1(2)EY2',
		'15.1(2)EY2a',
		'15.1(2)EY3',
		'15.1(2)EY4',
		'15.1(2)GC',
		'15.1(2)GC1',
		'15.1(2)GC2',
		'15.1(4)GC',
		'15.1(4)GC1',
		'15.1(4)GC2',
		'15.1(4)M',
		'15.1(4)M1',
		'15.1(4)M10',
		'15.1(4)M12a',
		'15.1(4)M2',
		'15.1(4)M3',
		'15.1(4)M3a',
		'15.1(4)M4',
		'15.1(4)M5',
		'15.1(4)M6',
		'15.1(4)M7',
		'15.1(4)M8',
		'15.1(4)M9',
		'15.1(1)MR',
		'15.1(1)MR1',
		'15.1(1)MR2',
		'15.1(1)MR3',
		'15.1(1)MR4',
		'15.1(3)MR',
		'15.1(3)MR1',
		'15.1(3)MRA',
		'15.1(3)MRA1',
		'15.1(3)MRA2',
		'15.1(3)MRA3',
		'15.1(3)MRA4',
		'15.1(2)MWR',
		'15.1(1)S',
		'15.1(1)S1',
		'15.1(1)S2',
		'15.1(2)S',
		'15.1(2)S1',
		'15.1(2)S2',
		'15.1(3)S',
		'15.1(3)S0a',
		'15.1(3)S1',
		'15.1(3)S2',
		'15.1(3)S3',
		'15.1(3)S4',
		'15.1(3)S5',
		'15.1(3)S5a',
		'15.1(3)S6',
		'15.1(1)SG',
		'15.1(1)SG1',
		'15.1(1)SG2',
		'15.1(2)SG',
		'15.1(2)SG1',
		'15.1(2)SG2',
		'15.1(2)SG3',
		'15.1(2)SG4',
		'15.1(2)SG5',
		'15.1(2)SG6',
		'15.1(2)SG7',
		'15.1(2a)SG7',
		'15.1(2)SNG',
		'15.1(2)SNG1',
		'15.1(2)SNH',
		'15.1(2)SNI',
		'15.1(2)SNI1',
		'15.1(3)SVA',
		'15.1(3)SVB',
		'15.1(3)SVB1',
		'15.1(3)SVC',
		'15.1(3)SVD',
		'15.1(3)SVD1',
		'15.1(3)SVD2',
		'15.1(3)SVE',
		'15.1(3)SVF',
		'15.1(3)SVF1',
		'15.1(3)SVF4a',
		'15.1(1)SY',
		'15.1(1)SY1',
		'15.1(1)SY2',
		'15.1(1)SY3',
		'15.1(1)SY4',
		'15.1(1)SY5',
		'15.1(1)SY6',
		'15.1(2)SY',
		'15.1(2)SY1',
		'15.1(2)SY2',
		'15.1(2)SY3',
		'15.1(2)SY4',
		'15.1(2)SY4a',
		'15.1(2)SY5',
		'15.1(2)SY6',
		'15.1(2)SY7',
		'15.1(1)T',
		'15.1(1)T1',
		'15.1(1)T2',
		'15.1(1)T3',
		'15.1(1)T4',
		'15.1(1)T5',
		'15.1(2)T',
		'15.1(2)T0a',
		'15.1(2)T1',
		'15.1(2)T2',
		'15.1(2)T2a',
		'15.1(2)T3',
		'15.1(2)T4',
		'15.1(2)T5',
		'15.1(3)T',
		'15.1(3)T1',
		'15.1(3)T2',
		'15.1(3)T3',
		'15.1(3)T4',
		'15.1(4)T',
		'15.1(1)XB',
		'15.2(1)E',
		'15.2(1)E1',
		'15.2(1)E2',
		'15.2(1)E3',
		'15.2(2)E',
		'15.2(2)E1',
		'15.2(2)E2',
		'15.2(2)E4',
		'15.2(2a)E1',
		'15.2(3)E',
		'15.2(3)E1',
		'15.2(3)E2',
		'15.2(3)E3',
		'15.2(3a)E',
		'15.2(3m)E2',
		'15.2(3m)E3',
		'15.2(4)E',
		'15.2(4)E1',
		'15.2(4m)E1',
		'15.2(2)EB',
		'15.2(2)EB1',
		'15.2(2)EB2',
		'15.2(1)EY',
		'15.2(1)EZ',
		'15.2(1)GC',
		'15.2(1)GC1',
		'15.2(1)GC2',
		'15.2(2)GC',
		'15.2(3)GC',
		'15.2(3)GC1',
		'15.2(4)GC',
		'15.2(4)GC1',
		'15.2(4)GC2',
		'15.2(4)GC3',
		'15.2(3r)GCA',
		'15.2(2)JA',
		'15.2(2)JA1',
		'15.2(2a)JA',
		'15.2(4)JA',
		'15.2(4)JA1',
		'15.2(2)JAX',
		'15.2(2)JAX1',
		'15.2(2)JB',
		'15.2(2)JB2',
		'15.2(2)JB3',
		'15.2(2)JB4',
		'15.2(2)JB5',
		'15.2(4)JB',
		'15.2(4)JB1',
		'15.2(4)JB2',
		'15.2(4)JB3',
		'15.2(4)JB3a',
		'15.2(4)JB3b',
		'15.2(4)JB3h',
		'15.2(4)JB3s',
		'15.2(4)JB4',
		'15.2(4)JB5',
		'15.2(4)JB5h',
		'15.2(4)JB5m',
		'15.2(4)JB50',
		'15.2(4)JB6',
		'15.2(4)JB7',
		'15.2(2)JN',
		'15.2(2)JN1',
		'15.2(2)JN2',
		'15.2(4)JN',
		'15.2(4)M',
		'15.2(4)M0a',
		'15.2(4)M1',
		'15.2(4)M10',
		'15.2(4)M11',
		'15.2(4)M2',
		'15.2(4)M3',
		'15.2(4)M4',
		'15.2(4)M5',
		'15.2(4)M6',
		'15.2(4)M6a',
		'15.2(4)M7',
		'15.2(4)M8',
		'15.2(4)M9',
		'15.2(4)PI',
		'15.2(1)S',
		'15.2(1)S1',
		'15.2(1)S2',
		'15.2(1s)S1',
		'15.2(2)S',
		'15.2(2)S0a',
		'15.2(2)S0b',
		'15.2(2)S0c',
		'15.2(2)S1',
		'15.2(2)S2',
		'15.2(3)S',
		'15.2(4)S',
		'15.2(4)S0x',
		'15.2(4)S0xb',
		'15.2(4)S1',
		'15.2(4)S2',
		'15.2(4)S3',
		'15.2(4)S3a',
		'15.2(4)S4',
		'15.2(4)S4a',
		'15.2(4)S5',
		'15.2(4)S6',
		'15.2(4)S7',
		'15.2(1)SB2',
		'15.2(1)SC',
		'15.2(1)SC1',
		'15.2(2)SNG',
		'15.2(2)SNH1',
		'15.2(2)SNI',
		'15.2(4)ST',
		'15.2(5)ST',
		'15.2(1)SY',
		'15.2(1)SY0a',
		'15.2(1)SY1',
		'15.2(1)SY1a',
		'15.2(1)SY2',
		'15.2(2)SY',
		'15.2(2)SY1',
		'15.2(1)T',
		'15.2(1)T1',
		'15.2(1)T2',
		'15.2(1)T3',
		'15.2(1)T3a',
		'15.2(1)T4',
		'15.2(2)T',
		'15.2(2)T1',
		'15.2(2)T2',
		'15.2(2)T3',
		'15.2(2)T4',
		'15.2(3)T',
		'15.2(3)T1',
		'15.2(3)T2',
		'15.2(3)T3',
		'15.2(3)T4',
		'15.3(3)JA',
		'15.3(3)JA1',
		'15.3(3)JA1m',
		'15.3(3)JA1n',
		'15.3(3)JA10',
		'15.3(3)JA4',
		'15.3(3)JA5',
		'15.3(3)JA50',
		'15.3(3)JA6',
		'15.3(3)JA7',
		'15.3(3)JA77',
		'15.3(3)JA8',
		'15.3(3)JA9',
		'15.3(3)JAA',
		'15.3(3)JAB',
		'15.3(3)JAX',
		'15.3(3)JAX1',
		'15.3(3)JAX2',
		'15.3(3)JB',
		'15.3(3)JB75',
		'15.3(3)JBB',
		'15.3(3)JBB1',
		'15.3(3)JBB2',
		'15.3(3)JBB4',
		'15.3(3)JBB5',
		'15.3(3)JBB50',
		'15.3(3)JBB6',
		'15.3(3)JBB6a',
		'15.3(3)JBB8',
		'15.3(3)JC',
		'15.3(3)JN3',
		'15.3(3)JN4',
		'15.3(3)JN7',
		'15.3(3)JN8',
		'15.3(3)JNB',
		'15.3(3)JNB1',
		'15.3(3)JNB2',
		'15.3(3)JNB3',
		'15.3(3)JNC',
		'15.3(3)JNC1',
		'15.3(3)JNP',
		'15.3(3)JNP1',
		'15.3(3)M',
		'15.3(3)M1',
		'15.3(3)M2',
		'15.3(3)M3',
		'15.3(3)M4',
		'15.3(3)M5',
		'15.3(3)M6',
		'15.3(3)M7',
		'15.3(1)S',
		'15.3(1)S1',
		'15.3(1)S2',
		'15.3(2)S',
		'15.3(2)S0a',
		'15.3(2)S1',
		'15.3(2)S2',
		'15.3(3)S',
		'15.3(3)S0.1',
		'15.3(3)S0b',
		'15.3(3)S1',
		'15.3(3)S1a',
		'15.3(3)S2',
		'15.3(3)S3',
		'15.3(3)S4',
		'15.3(3)S5',
		'15.3(3)S6',
		'15.3(3)S7',
		'15.3(1)SY',
		'15.3(1)T',
		'15.3(1)T1',
		'15.3(1)T2',
		'15.3(1)T3',
		'15.3(1)T4',
		'15.3(2)T',
		'15.3(2)T1',
		'15.3(2)T2',
		'15.3(2)T3',
		'15.3(2)T4',
		'15.3(3)T',
		'15.4(1)CG',
		'15.4(1)CG1',
		'15.4(2)CG',
		'15.4(3)M',
		'15.4(3)M1',
		'15.4(3)M2',
		'15.4(3)M2.2',
		'15.4(3)M3',
		'15.4(3)M4',
		'15.4(3)M5',
		'15.4(1)S',
		'15.4(1)S1',
		'15.4(1)S2',
		'15.4(1)S3',
		'15.4(1)S4',
		'15.4(2)S',
		'15.4(2)S1',
		'15.4(2)S2',
		'15.4(2)S3',
		'15.4(2)S4',
		'15.4(3)S',
		'15.4(3)S1',
		'15.4(3)S2',
		'15.4(3)S3',
		'15.4(3)S4',
		'15.4(3)S5',
		'15.4(1)T',
		'15.4(1)T1',
		'15.4(1)T2',
		'15.4(1)T3',
		'15.4(1)T4',
		'15.4(2)T',
		'15.4(2)T1',
		'15.4(2)T2',
		'15.4(2)T3',
		'15.4(2)T4',
		'15.5(3)M',
		'15.5(3)M0a',
		'15.5(3)M1',
		'15.5(3)M2',
		'15.5(1)S',
		'15.5(1)S1',
		'15.5(1)S2',
		'15.5(1)S3',
		'15.5(2)S',
		'15.5(2)S1',
		'15.5(2)S2',
		'15.5(2)S3',
		'15.5(3)S',
		'15.5(3)S0a',
		'15.5(3)S1',
		'15.5(3)S1a',
		'15.5(3)S2',
		'15.5(3)SN',
		'15.5(1)T4',
		'15.5(2)T4',
		'15.5(1)T',
		'15.5(1)T1',
		'15.5(1)T2',
		'15.5(1)T3',
		'15.5(2)T',
		'15.5(2)T1',
		'15.5(2)T2',
		'15.5(2)T3',
		'15.5(2.25)T',
		'15.6(1)S',
		'15.6(1)S1',
		'15.6(2)S',
		'15.6(2)SN',
		'15.6(1)T',
		'15.6(1)T0a',
		'15.6(1)T1',
		'15.6(2)T',
		'16.1(0)' );

foreach af ( affected )
{
  if( version == af )
  {
    report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
    security_message( port:0, data:report );
    exit( 0 );
  }
}

exit( 99 );

