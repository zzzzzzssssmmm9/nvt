###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_VMSA-2013-0011.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# VMSA-2013-0011 VMware ESX and ESXi updates to third party libraries
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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

tag_summary = "VMware has updated VMware ESXi and ESX to address a vulnerability in
an unhandled exception in the NFC protocol handler.";

tag_solution = "Apply the missing patch(es).";

tag_affected = "VMware ESXi 5.1 without patch ESXi510-201307101
VMware ESXi 5.0 without patch ESXi500-201308101     
VMware ESXi 4.1 without patch ESXi410-201304401
VMware ESXi 4.0 without patch ESXi400-201305401

VMware ESX 4.1 without patch ESX410-201304401
VMware ESX 4.0 without patch ESX400-201305401";

tag_vuldetect = "Check if the patch for VMSA-2013-0011 is installed.";

tag_insight = "VMware ESXi and ESX NFC Protocol Unhandled Exception

VMware ESXi and ESX contain a vulnerability in the handling of
the Network File Copy (NFC) protocol. To exploit this
vulnerability, an attacker must intercept and modify the NFC
traffic between ESXi/ESX and the client.  Exploitation of the
issue may lead to a Denial of Service.

To reduce the likelihood of exploitation, vSphere components should
be deployed on an isolated management network";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103778");
 script_cve_id("CVE-2013-1661");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
 script_version ("$Revision: 9353 $");
 script_name("VMSA-2013-0011 VMware ESX and ESXi updates to third party libraries");


 script_xref(name:"URL", value:"http://www.vmware.com/security/advisories/VMSA-2013-0011.html");

 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2013-09-02 14:04:01 +0100 (Mon, 02 Sep 2013)");
 script_category(ACT_GATHER_INFO);
 script_family("VMware Local Security Checks");
 script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
 script_dependencies("gb_vmware_esxi_init.nasl");
 script_mandatory_keys("VMware/ESXi/LSC","VMware/ESX/version");

 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "affected" , value : tag_affected);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 exit(0);

}

include("vmware_esx.inc");
include("version_func.inc");

if(!get_kb_item('VMware/ESXi/LSC'))exit(0);
if(!esxVersion = get_kb_item("VMware/ESX/version"))exit(0);

patches = make_array("4.0.0","ESXi400-201305401-SG",
                     "4.1.0","ESXi410-201304401-SG",
                     "5.0.0","VIB:tools-light:5.0.0-2.35.1254542",
                     "5.1.0","VIB:tools-light:5.1.0-1.16.1157734");

if(!patches[esxVersion])exit(0);

if(_esxi_patch_missing(esxi_version:esxVersion, patch:patches[esxVersion])) {

  security_message(port:0);
  exit(0);

}

exit(99);







