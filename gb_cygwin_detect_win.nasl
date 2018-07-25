###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cygwin_detect_win.nasl 7287 2017-09-27 06:56:51Z cfischer $
#
# Cygwin Version Detection (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806089");
  script_version("$Revision: 7287 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-27 08:56:51 +0200 (Wed, 27 Sep 2017) $");
  script_tag(name:"creation_date", value:"2015-10-13 17:30:01 +0530 (Tue, 13 Oct 2015)");
  script_name("Cygwin Version Detection (Windows)");

  script_tag(name: "summary" , value: "Detection of installed version of
  Cygwin on Windows.

  The script logs in via smb, searches for Cygwin in the registry and gets the
  version.");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");

## variable Initialization
key = "";
os_arch = "";
cygPath = "";
cygVer = "";
cygName = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

## Check for 32  and 64 bit platform Application installation
key = "SOFTWARE\Cygwin\";
key1 ="SOFTWARE\Wow6432Node\Cygwin\";

if(!registry_key_exists(key:key))
{
  if(!registry_key_exists(key:key1)){
    exit(0);
  }
}


## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Cygwin\setup");
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Cygwin\setup", "SOFTWARE\Wow6432Node\Cygwin\setup");
}

foreach key (key_list)
{
  cygPath = registry_get_sz(key:key, item:"rootdir");
  
  if(!cygPath){
    cygPath = "Could not find the install location from registry";
  }
  
  ## Confirming the application
  if("cygwin" >< cygPath)
  {

    ##Version info not available currently
    cygVer = "Unknown";

    ##Setting kb
    set_kb_item(name:"Cygwin/Installed", value:TRUE);
    set_kb_item(name:"Cygwin/Win/Ver", value:cygVer);

    ## build cpe and store it as host_detail
    cpe = build_cpe(value:cygVer, exp:"^([0-9.]+)", base:"cpe:/a:redhat:cygwin:");
    if(isnull(cpe))
      cpe = "cpe:/a:redhat:cygwin";

    ## Register for 64 bit app on 64 bit OS once again
    if("64" >< os_arch && "64" >< cygPath)
    {
      set_kb_item(name:"Cygwin64/Win/Ver", value:cygVer);
      cpe = build_cpe(value:cygVer, exp:"^([0-9.]+)", base:"cpe:/a:redhat:cygwin:x64:");

      if(isnull(cpe))
        cpe = "cpe:/a:redhat:cygwin:x64";
    }
    
    ##register cpe
    register_product(cpe:cpe, location:cygPath);
    log_message(data: build_detection_report(app: "Cygwin",
                                             version: cygVer,
                                             install: cygPath,
                                             cpe: cpe,
                                             concluded: cygVer));

  }
}
