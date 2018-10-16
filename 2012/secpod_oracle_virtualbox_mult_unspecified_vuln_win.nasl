###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_oracle_virtualbox_mult_unspecified_vuln_win.nasl 11855 2018-10-12 07:34:51Z cfischer $
#
# Oracle VM VirtualBox Multiple Unspecified Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 SecPod, http://www.secpod.com
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902786");
  script_version("$Revision: 11855 $");
  script_cve_id("CVE-2012-0111", "CVE-2012-0105");
  script_bugtraq_id(51465, 51461);
  script_tag(name:"cvss_base", value:"3.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 09:34:51 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-01-24 11:43:28 +0530 (Tue, 24 Jan 2012)");
  script_name("Oracle VM VirtualBox Multiple Unspecified Vulnerabilities (Windows)");

  script_xref(name:"URL", value:"http://secunia.com/advisories/47626/");
  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1026531");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpujan2012-366304.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 SecPod");
  script_family("General");
  script_dependencies("secpod_sun_virtualbox_detect_win.nasl");
  script_mandatory_keys("Oracle/VirtualBox/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation allows local users to affect confidentiality,
  integrity and availability via unknown vectors.");
  script_tag(name:"affected", value:"Oracle VM VirtualBox version 4.1");
  script_tag(name:"insight", value:"The flaws are due to an unspecified errors related to
  'Guest Additions for Windows' and 'Shared Folders' sub components.");
  script_tag(name:"summary", value:"This host is installed with Oracle VM VirtualBox and is prone to
  multiple unspecified vulnerabilities.");
  script_tag(name:"solution", value:"Apply the patch  *****
  NOTE: Ignore this warning, if above mentioned workaround is manually applied.
  *****");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpujan2012-366304.html");
  exit(0);
}


include("version_func.inc");

version = get_kb_item("Oracle/VirtualBox/Win/Ver");
if(version)
{
  if(version_is_equal(version:version, test_version:"4.1")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
