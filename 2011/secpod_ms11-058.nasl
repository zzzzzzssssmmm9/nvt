###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-058.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Microsoft Windows DNS Server Remote Code Execution Vulnerability (2562485)
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow remote attacker to execute arbitrary
  code or to cause the DNS server to stop responding.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows 2K3 Service Pack 2 and prior.
  Microsoft Windows Server 2008 Service Pack 2 and prior.";
tag_insight = "The flaws are exists when Windows DNS server processing a query for a NAPTR
  (Name Authority Pointer) resource record and when processing a query for
  a non-existent domain.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms11-058.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS11-058.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900295");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-11 06:41:03 +0200 (Thu, 11 Aug 2011)");
  script_bugtraq_id(49019, 49012);
  script_cve_id("CVE-2011-1966", "CVE-2011-1970");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows DNS Server Remote Code Execution Vulnerability (2562485)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/45564");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/45552");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2562485");
  script_xref(name : "URL" , value : "http://www.sophos.com/support/knowledgebase/article/113982.html");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms11-058.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Check for OS and Service Pack
if(hotfix_check_sp(win2003:3, win2008:3) <= 0){
  exit(0);
}

if(!registry_key_exists(key:"SYSTEM\CurrentControlSet\Services\DNS")){
  exit(0);
}

## MS11-058 Hotfix 2562485
if((hotfix_missing(name:"2562485") == 0)){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version for Dns.exe
sysVer = fetch_file_version(sysPath, file_name:"system32\Dns.exe");
if(!sysVer){
  exit(0);
}

## Windows 2003
if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Check for Dns.exe version
    if(version_is_less(version:sysVer, test_version:"5.2.3790.4882")){
      security_message(0);
    }
   exit(0);
  }
  security_message(0);
}

## Windows Server 2008
else if(hotfix_check_sp(win2008:3) > 0)
{
  SP = get_kb_item("SMB/Win2008/ServicePack");

  if("Service Pack 2" >< SP)
  {
    ## Check for Dns.exe version
    if(version_in_range(version:sysVer, test_version:"6.0.6002.18000", test_version2:"6.0.6002.18485")||
       version_in_range(version:sysVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22664")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
