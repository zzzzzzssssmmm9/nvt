###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vmware_tools_detect_win.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# VMware Tools Version Detection (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.809030");
  script_version("$Revision: 5877 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-09-02 13:07:24 +0530 (Fri, 02 Sep 2016)");
  script_name("VMware Tools Version Detection (Windows)");

  script_tag(name: "summary" , value: "Detection of installed version of
  VMware Tools.

  The script logs in via smb, searches registry for VMware Tools 
  and gets the version from 'DisplayVersion' string.");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## variable Initialization
cpe = "";
os_arch = "";
key = "";
vmtoolPath = "";
vmtoolVer = "";
vmtoolName = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Confirm VMware Tools
if(!registry_key_exists(key:"SOFTWARE\VMware, Inc.\VMware Tools") &&
   !registry_key_exists(key:"SOFTWARE\Wow6432Node\VMware, Inc.\VMware Tools")){
  exit(0);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
}


foreach item (registry_enum_keys(key:key))
{
  vmtoolName = registry_get_sz(key:key + item, item:"DisplayName");

  ## Confirm for VMware Tools
  if("VMware Tools" >< vmtoolName)
  {
    vmtoolVer = registry_get_sz(key:key + item, item:"DisplayVersion");

    if(vmtoolVer)
    {
      vmtoolPath = registry_get_sz(key:key + item, item:"InstallLocation");
      if(!vmtoolPath){
        vmtoolPath = "Unable to find the install location from registry";
      }

      set_kb_item(name:"VMwareTools/Win/Ver", value:vmtoolVer);

      ## build cpe and store it as host_detail
      cpe = build_cpe(value:vmtoolVer, exp:"^([0-9.]+)", base:"cpe:/a:vmware:tools:");
      if(isnull(cpe))
        cpe = "cpe:/a:vmware:tools";

      ## Register Product and Build Report
      register_product(cpe:cpe, location:vmtoolPath);
      log_message(data: build_detection_report(app: "VMware Tools",
                                               version: vmtoolVer,
                                               install: vmtoolPath,
                                               cpe: cpe,
                                               concluded: vmtoolVer));
      exit(0);
    }
  }
}
exit(0);
