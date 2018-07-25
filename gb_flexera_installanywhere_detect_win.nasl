###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flexera_installanywhere_detect_win.nasl 8181 2017-12-19 14:34:06Z cfischer $
#
# Flexera InstallAnywhere Version Detection (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.809011");
  script_version("$Revision: 8181 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 15:34:06 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-08-29 13:05:30 +0530 (Mon, 29 Aug 2016)");
  script_name("Flexera InstallAnywhere Version Detection (Windows)");
  script_tag(name: "summary" , value: "Detection of installed version of
  Flexera InstallAnywhere on Windows.

  The script logs in via smb, searches for InstallAnywhere in the registry
  and gets the version from 'DisplayVersion' string from registry.");

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
os_arch = "";
key_list = "";
key = "";
installPath = "";
installVer = "";
installName = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key =  "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
}

if(isnull(key)){
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  installName = registry_get_sz(key:key + item, item:"DisplayName");

  ## Confirm for InstallAnywhere
  if(installName =~ "InstallAnywhere( 2015| 2014| 2013| 2012| 2011)?$")
  {
    installVer = registry_get_sz(key:key + item, item:"DisplayVersion");
    installPath = registry_get_sz(key:key + item, item:"InstallLocation");
    if(!installPath){
      installPath = "Unable to find the install location from registry";
    }

    set_kb_item(name:"InstallAnywhere/Win/Ver", value:installVer);
    register_and_report_cpe( app:"Flexera InstallAnywhere", ver:installVer, base:"cpe:/a:flexerasoftware:installanywhere:", expr:"^([0-9.]+)", insloc:installPath );
  }
}
