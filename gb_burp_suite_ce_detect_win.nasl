###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_burp_suite_ce_detect_win.nasl 10371 2018-06-29 13:27:39Z santu $
#
# Burp Suite Community Edition Version Detection (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813609");
  script_version("$Revision: 10371 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-06-29 15:27:39 +0200 (Fri, 29 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-19 16:08:53 +0530 (Tue, 19 Jun 2018)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Burp Suite Community Edition Version Detection (Windows)");
  script_tag(name:"summary", value:"Detection of installed version of Burp Suite
  Community Edition on Windows. 

  The script logs in via smb, searches for Burp Suite Community Edition in the 
  registry and gets the version from registry.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

else if("x64" >< os_arch)
{
  key_list =  make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                        "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

if(isnull(key_list)){
  exit(0);
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    burpName = registry_get_sz(key:key + item, item:"DisplayName");

    if("Burp Suite Community Edition" >< burpName) 
    {
      burpVer = registry_get_sz(key:key + item, item:"DisplayVersion");
      burpPath = registry_get_sz(key:key + item, item:"InstallLocation");
      if(!burpPath) {
        burpPath = "Unable to find the install location from registry";
      }

      set_kb_item(name:"BurpSuite/CommunityEdition/Win/Installed", value:TRUE);

      set_kb_item(name:"BurpSuite/CommunityEdition/Win/Ver", value:burpVer);
      register_and_report_cpe( app:"Burp Suite Community Edition", ver:burpVer, base:"cpe:/a:portswigger:burp_suite:", expr:"^([0-9.]+)", insloc:burpPath );

      if("64" >< os_arch && "Wow6432Node" >!< key) 
      {
        set_kb_item(name:"BurpSuite/CommunityEdition64/Win/Ver", value:burpVer);
        register_and_report_cpe( app:"Burp Suite Community Edition", ver:burpVer, base:"cpe:/a:portswigger:burp_suite:x64:", expr:"^([0-9.]+)", insloc:burpPath );
      }
    }
  }
}

exit(0);
