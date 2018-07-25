###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M4_036.nasl 9365 2018-04-06 07:34:21Z cfischer $
#
# IT-Grundschutz, 14. EL, Ma�nahme 4.036
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.94201");
  script_version("$Revision: 9365 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:34:21 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-03-25 10:14:11 +0100 (Wed, 25 Mar 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"remote_app");
  script_name("IT-Grundschutz M4.036: Sperren bestimmter Faxempf�nger-Rufnummerne");
  script_xref(name : "URL" , value : "http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m04/m04036.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-15");
  script_mandatory_keys("Tools/Present/wmi");
  script_mandatory_keys("Compliance/Launch/GSHB-15");
  script_dependencies("toolcheck.nasl", "GSHB/GSHB_TELNET_Cisco_Voice.nasl");
  script_tag(name : "summary" , value :
"IT-Grundschutz M4.036: Sperren bestimmter Faxempf�nger-Rufnummerne.

Stand: 14. Erg�nzungslieferung (14. EL).

Hinweis:
Cisco Ger�te k�nnen nur �ber Telnet getestet werden, da sie SSH blowfish-cbc encryption nicht unterst�tzen.
");

  exit(0);
}

include("itg.inc");

name = 'IT-Grundschutz M4.036: Sperren bestimmter Faxempf�nger-Rufnummerne\n';

gshbm =  "IT-Grundschutz M4.036: ";

ciscovoice = get_kb_item("GSHB/Voice");
log = get_kb_item("GSHB/Voice/log");
translation = get_kb_item("GSHB/Voice/translation");

if (log == "no Telnet Port"){
  result = string("nicht zutreffend");
  desc = string('Beim Testen des Systems wurde kein Telnet-\nPort gefunden.'); 
}else if (ciscovoice == "no credentials set"){
  result = string("unvollst�ndig");
  desc = string('Um diesen Test durchzuf�hren, muss ihn in den Vorein-\nstellungen unter:-IT-Grundschutz: List reject Rule on\nCisco Voip Devices over Telnet- ein Benutzername und\nPasswort eingetragen werden.'); 
}else if (ciscovoice == "Login Failed"){
  result = string("Fehler");
  desc = string('Es war nicht m�glich sich am Zielsystem anzumelden.'); 
}else if (ciscovoice == "nocisco"){
  result = string("nicht zutreffend");
  desc = string('Das Ziel konnt nicht als Cisco-Ger�t erkannt werden.'); 
}else if (ciscovoice == "novoice"){
  result = string("nicht zutreffend");
  desc = string('Das Ziel konnt als Cisco-Ger�t erkannt werden.\nAllerdings konnte keine Voice-Funktion erkannt werden.'); 
}else if (translation == "noconfig"){
  result = string("nicht erf�llt");
  desc = string('Auf dem Cisco-Ger�t wurde Voip Funktionalit�ten\nentdeckt. Allerdings konnte keine -translation-rule-\nnacht dem Muster - rule .* reject .*- entdeckt werden.'); 
}else if (translation != "noconfig"){
  result = string("unvollst�ndig");
  desc = string('Auf dem Cisco-Ger�t wurde Voip Funktionalit�ten ent-\ndeckt. Es wurden folgende -translation-rule- gefunden:\n' + translation +'\nBitte Pr�fen Sie ob alle ggf. zu sperrenden Fax-\nempf�nger-Rufnummern eingetragen sind.');
}

if (!result){
  result = string("Fehler");
  desc = string('Beim Testen des Systems trat ein unbekannter Fehler\nauf bzw. es konnte kein Ergebnis ermittelt werden.'); 
}

set_kb_item(name:"GSHB/M4_036/result", value:result);
set_kb_item(name:"GSHB/M4_036/desc", value:desc);
set_kb_item(name:"GSHB/M4_036/name", value:name);

silence = get_kb_item("GSHB/silence");
if (!silence) itg_send_details (itg_id: 'GSHB/M4_036');

exit(0);
