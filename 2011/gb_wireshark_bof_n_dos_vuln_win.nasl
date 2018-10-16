###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_bof_n_dos_vuln_win.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# Wireshark Heap Based BOF and Denial of Service Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802502");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-11-08 11:40:17 +0200 (Tue, 08 Nov 2011)");
  script_cve_id("CVE-2011-4102", "CVE-2011-4101");
  script_bugtraq_id(50486, 50481);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("Wireshark Heap Based BOF and Denial of Service Vulnerabilities (Windows)");


  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow attackers to cause a denial of service via
  via a malformed packet.");
  script_tag(name:"affected", value:"Wireshark version 1.4.0 through 1.4.9 and 1.6.x before 1.6.3");
  script_tag(name:"insight", value:"The flaws are due to

  - An error while parsing ERF file format. This could cause wireshark to crash
    by reading a malformed packet trace file.

  - An error in dissect_infiniband_common function in
    epan/dissectors/packet-infiniband.c in the Infiniband dissector, could
    dereference a NULL pointer.");
  script_tag(name:"solution", value:"Upgrade to the Wireshark version 1.6.3 or later,
  For updates refer to http://www.wireshark.org/download.html");
  script_tag(name:"summary", value:"The host is installed with Wireshark and is prone to heap based
  buffer overflow and denial of service vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=750645");
  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2011/11/01/9");
  script_xref(name:"URL", value:"https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6476");
  script_xref(name:"URL", value:"http://anonsvn.wireshark.org/viewvc?view=revision&revision=39508");
  script_xref(name:"URL", value:"http://anonsvn.wireshark.org/viewvc?view=revision&revision=39500");
  exit(0);
}


include("version_func.inc");

wiresharkVer = get_kb_item("Wireshark/Win/Ver");
if(!wiresharkVer){
  exit(0);
}

if(version_in_range(version:wiresharkVer, test_version:"1.4.0", test_version2:"1.4.9")||
   version_in_range(version:wiresharkVer, test_version:"1.6.0", test_version2:"1.6.2")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
