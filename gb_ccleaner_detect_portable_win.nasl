###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ccleaner_detect_portable_win.nasl 11793 2018-10-09 11:25:57Z cfischer $
#
# CCleaner Portable Version Detection (Windows)
#
# Authors:
# Michael Martin <michael.martin@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, https://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.107315");
  script_version("$Revision: 11793 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-09 13:25:57 +0200 (Tue, 09 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-26 14:36:37 +0200 (Thu, 26 Apr 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("CCleaner Portable Version Detection (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gb_ccleaner_detect_win.nasl", "gb_wmi_access.nasl");
  script_mandatory_keys("win/lsc/search_portable_apps", "WMI/access_successful");

  script_tag(name:"summary", value:"Detection of CCLeaner Portable on Windows.

  The script logs in via WMI, searches for CCLeaner executables on the filesystem
  and gets the installed version if found.

  To enable the search for this product you need to 'Enable Detection of Portable Apps on Windows'
  in the Options for Local Security Checks (OID: 1.3.6.1.4.1.25623.1.0.100509) of your scan config.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("wmi_file.inc");
include("misc_func.inc");
include("cpe.inc");
include("host_details.inc");
include("smb_nt.inc");

infos = kb_smb_wmi_connectinfo();
if( ! infos ) exit( 0 );

handle = wmi_connect( host:infos["host"], username:infos["username_wmi_smb"], password:infos["password"] );
if( ! handle ) exit( 0 );

fileList = wmi_file_fileversion( handle:handle, fileName:"ccleaner", fileExtn:"exe", includeHeader:FALSE );
wmi_close( wmi_handle:handle );
if( ! fileList || ! is_array( fileList ) ) {
  exit( 0 );
}

# From gb_ccleaner_detect_win.nasl to avoid a doubled detection of a registry-based installation.
detectedList = get_kb_list( "CCleaner/Win/InstallLocations" );

foreach filePath( keys( fileList ) ) {

  # wmi_file_fileversion returns the .exe filename so we're stripping it away
  # to keep the install location registration the same way like in gb_ccleaner_detect_win.nasl
  location = filePath - "\ccleaner.exe";
  if( detectedList && in_array( search:tolower( location ), array:detectedList ) ) continue; # We already have detected this installation...

  vers = fileList[filePath];

  # Version of the ccleaner.exe file is something like 5.43.151.6522
  # so we need to catch only the first three parts of the version.
  if( vers && version = eregmatch( string:vers, pattern:"^([0-9]+\.[0-9]+\.[0-9]+)" ) ) {

    set_kb_item( name:"CCleaner/Win/InstallLocations", value:tolower( location ) );

    # The portableapps.com installer is putting the 32bit version in App\CCleaner and the 64bit into App\CCLeaner64.
    # This is the only way to differ between 32bit and 64bit as we can't differ between 32 and 64bit based on the file information.
    if( "ccleaner64" >< location ) {
      cpe = "cpe:/a:piriform:ccleaner:x64:";
      set_kb_item( name:"CCLeanerx64/Win/Ver", value:version[1] );
    } else {
      cpe = "cpe:/a:piriform:ccleaner:";
      set_kb_item( name:"CCLeaner/Win/Ver", value:version[1] );
    }
    register_and_report_cpe( app:"CCleaner Portable", ver:version[1], concluded:vers, base:cpe, expr:"^([0-9.]+)", insloc:location );
  }
}

exit( 0 );