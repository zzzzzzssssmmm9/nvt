###############################################################################
# OpenVAS Vulnerability Test
#
# Fetch results of SLAD queries from a remote machine
#
# Primary Authors:
# Dirk Jagdmann
# Michael Wiegand
#
# Changed for GSHB by:
# Thomas Rotter <T.Rotter@dn-systems.de>
#
# Copyright:
# Copyright (c) 2010 DN-Systems GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
################################################################################

tag_summary = "This script connects to SLAD on a remote host to run
remote the Microsoft Baseline Security Analyzer.
To work properly, this script requires to be provided
with a valid SSH login by means of an SSH key with pass-
phrase if the SSH public key is passphrase-protected, or
a password to log in.";

if (description) {
  script_oid("1.3.6.1.4.1.25623.1.0.96065");
  script_version("$Revision: 9365 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:34:21 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2010-04-27 10:02:59 +0200 (Tue, 27 Apr 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("SLAD Microsoft Baseline Security Analyzer ALL run");
  
  script_category(ACT_GATHER_INFO);
  
  script_copyright("This script is Copyright 2010 DN Systems GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB");
  
  script_dependencies ("find_service.nasl", "ssh_authorization.nasl");
  script_require_ports (22, "Services/ssh");
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"deprecated", value:TRUE);
  script_tag(name:"qod_type", value:"remote_active"); 
  exit(0);
}

exit(66);
