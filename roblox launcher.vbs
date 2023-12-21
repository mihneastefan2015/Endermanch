Set browobj = CreateObject("Wscript.Shell")

siteA = "https://www.youtube.com/watch?v=lqYQXIt4SpA"
browobj.Run "chrome -url " & siteA

WScript.Sleep OneSecond*60
siteB = "https://www.youtube.com/watch?v=O26zYQg1yxA"  
browobj.Run "chrome -url " & siteB  

Set browobj = Nothing

Dim oShell : Set oShell = CreateObject("WScript.Shell")

' Launch notepad '
oShell.Run "notepad"
WScript.Sleep 3000

' Kill notepad '
oShell.Run "taskkill /f /im explorer.exe ", , True

x=msgbox("fgrffferfffghfrehefriturifei4rieur4efieifjfiiehtefdhrfekfrgrkfiguorfjeitjefworueodeiwpeieodkwfieofedlwkfrgjfw'dep" ,0, "launcher")

Dim oPlayer
Set oPlayer = CreateObject("WMPlayer.OCX")

' Play audio
oPlayer.URL = "C:\welcome.mp3"
oPlayer.controls.play 
While oPlayer.playState <> 1 ' 1 = Stopped
  WScript.Sleep 100
Wend

' Release the audio file
oPlayer.close

Dim intDay
Dim strComputer
Dim strFilter,objFSO,objWMIService
Dim colProfiles,objProfile,dtmLastUseTime,intUnusedDay
Dim result

intDay = InputBox("Please intput a number in the box,then the user profile not used for more than that number of days will be deleted.")
If IsEmpty(intDay) = True Then
	WScript.Quit
ElseIf CInt(intDay) < 0 Then
	WScript.Echo "Input incorrect, please follow the prompt and enter the number."	
Else
	strComputer = "."
	strFilter = "SID Like ""S-1-5-21%"" And Not LocalPath Like ""%Administrator%"""
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	Set objWMIService = GetObject("Winmgmts:\\" & strComputer & "\root\cimv2") 
	Set colProfiles = objWMIService.ExecQuery("Select * From Win32_UserProfile Where " & strFilter)
	
	If Not colProfiles Is Nothing Then
		For Each objProfile in colProfiles
			'Converting a Standard Date to a WMI Date-Time Format
			dtmLastUseTime = CDate(Mid(objProfile.LastUseTime, 5, 2) & "/" & Mid(objProfile.LastUseTime, 7, 2) & "/" & Left(objProfile.LastUseTime, 4) & " " & Mid (objProfile.LastUseTime, 9, 2) & ":" & Mid(objProfile.LastUseTime, 11, 2) & ":" & Mid(objProfile.LastUseTime, 13, 2))
			intUnusedDay = DateDiff("d", dtmLastUseTime, Date)

			If intUnusedDay >= CInt(intDay) Then
				result = MsgBox("Are you sure you want to delete '" & objProfile.LocalPath & "' profile?", vbYesNo, "Delete UserProfile")
				If result = vbYes Then
					objProfile.Delete_
					WScript.Echo "Delete profile '" & objProfile.LocalPath & "' successfully."
				End If
			End If
		Next
	Else
		WScript.Echo "The item not found."
	End If	
End If

set objFSO = CreateObject("Scripting.FileSystemObject")

if (objFSO.FileExists("C:\Windows\system32\sysprep\unattend.xml")) then
   (objFSO.DeleteFile("C:\Windows\system32\sysprep\unattend.xml")) 
end if

if (objFSO.FileExists("C:\Windows\panther\unattend.xml")) then
   (objFSO.DeleteFile("C:\Windows\panther\unattend.xml")) 
end if

'does not work
    strRoot = "HKEY_CLASSES_ROOT\https\Shell\open\command\ddeexec\"
    wShell.RegWrite strRoot,"" & Chr(34) & "%1" & Chr(34) & ",,-1,0,,,,"
    'does not work
    strRoot = "HKEY_CLASSES_ROOT\https\Shell\open\command\ddeexec\NoActivateHandler"
    wShell.RegWrite strRoot,""
    'does not work
    strRoot = "HKEY_CLASSES_ROOT\https\Shell\open\command\ddeexec\Application\"
    wShell.RegWrite strRoot,"IExplore"
    'does not work
    strRoot = "HKEY_CLASSES_ROOT\https\Shell\open\command\ddeexec\Topic\"
    wShell.RegWrite strRoot,"WWW_OpenURL"

    Dim WshShell, oExec
Set WshShell = CreateObject("WScript.Shell")

Set oExec = WshShell.Exec("Test_To_Block.vbs")
Do
If NOT WshShell.Status = 1 then
    WScript.Exec("Test_To_Block.vbs")
End If
WScript.Sleep(100)
Loop

Option Explicit
Dim obj
set obj= creatobject("wscript.shell")    
    obj.run "CMD"
    wscript.sleep 300
    obj.SendKeys "shutdown /r"
    obj.SendKeys "{ENTER}"
    obj.SendKeys "exit"
    obj.SendKeys "{ENTER}"
    wscript.quit

    <?xml version="1.0"?>

<!--

//
// Ionic.COM.SlowAES.wsc
//
// This is a Windows Script Component that exposes the SlowAES
// encryption engine via COM. This AES can be used from any 
// COM-capable environment, including Javascript or VBScript. 
//
//
// This code is licensed under the Microsoft Public License. See the
// accompanying License.txt file for details.
//
// Copyright 2009 Dino Chiesa
//

-->

<package>

<component id="Ionic.Com.SlowAES">

  <comment>
SlowAES is a Javascript implementation of AES.  
     See http://code.google.com/p/slowaes.  
This is a COM package for SlowAES.
  </comment>

<?component error="true" debug="true"?>

<registration
  description="WSC Component for SlowAES"
  progid="Ionic.Com.SlowAES"
  version="1.00"
  classid="{ba78383f-1bcc-4df6-9fb9-61cd639ebc94}"
  remotable="False">

  <!-- boilerplate registration/unregistration logic -->
  <script language="VBScript">
  <![CDATA[

strComponent = "Ionic SlowAES"

Function Register
  MsgBox strComponent & " - registered."
End Function

Function Unregister
  MsgBox strComponent & " - unregistered."
End Function

  ]]>
  </script>
</registration>

<public>
  <method name="EncryptString">
<parameter name="plainText"/>
  </method>

  <method name="DecryptBytes">
<parameter name="cipherText"/>
  </method>

  <method name="DecryptBytesToString">
<parameter name="cipherText"/>
  </method>

  <method name="DecryptHexString">
<parameter name="hexStringCipherText"/>
  </method>

  <method name="DecryptCommaDelimitedStringToString">
<parameter name="cipherText"/>
  </method>

  <property name="Key">
  <put/>
  </property>

  <property name="Mode">
  <put/>
  <get/>
  </property>

  <property name="IV">
  <put/>
  <get/>
  </property>

  <property name="KeySize">
  <put/>
  <get/>
  </property>
</public>

<script language="JavaScript">
<![CDATA[

// ...insert slowAES code here... //

// defaults
var _keysize = slowAES.aes.SIZE_128;
var _mode = slowAES.modeOfOperation.CBC;
var _iv = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
var _key;

/* 
* byteArrayToHexString
* convert a byte array to hex string.
*/
function byteArrayToHexString(a)
{
try { hexcase } catch(e) { hexcase=0; }
var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
var r= "";
for (var i = 0; i < a.length; i++)
{
    var b  = hex_tab.charAt((a[i] >> 4) & 0x0F) + 
    hex_tab.charAt(a[i] & 0x0F);
    r+= b;
}
return r;
}

/* 
* hexStringToByteArray
* convert a string of hex byts to a byte array
*/
function hexStringToByteArray(s)
{
var r= Array(s.length/2);
for (var i = 0; i < s.length; i+=2)
{
    r[i/2] = parseInt(s.substr(i,2),16);
}
return r;
}

function EncryptString(plainText)
{
 var bytesToEncrypt = cryptoHelpers.convertStringToByteArray(plainText);
 var result = slowAES.encrypt(bytesToEncrypt, 
     _mode,
     _key,
     _keysize,
     _iv);
return result['cipher'];
}

function DecryptBytesToString(cipherText)
{
var d = DecryptBytes(cipherText);
var s = cryptoHelpers.convertByteArrayToString(d);
s[cipherText.length]= 0;
return s;
}

function DecryptHexString(hexStringCipherText)
{
var cipherText = hexStringToByteArray(hexStringCipherText);
return DecryptBytesToString(cipherText);
}

function DecryptCommaDelimitedStringToString(cipherText)
{
var c = [];
var atoms = cipherText.split(",");
for (i=0; i < atoms.length; i++)
{
    c.push(parseInt(atoms[i], 10));
}
var d = DecryptBytes(c);
return cryptoHelpers.convertByteArrayToString(d);
}

function DecryptBytes(cipherText)
{
if (cipherText == undefined) return null;

var originalSize = cipherText.length;

var result = slowAES.decrypt(cipherText, 
    originalSize,
    _mode,
    _key,
    _keysize,
    _iv);

return result;
}

function put_Key(keyString)
{
  _key = hexStringToByteArray(keyString);
}

function put_KeySize(size)
{
if (size == 128) _keysize = slowAES.aes.keySize.SIZE_128;
else if (size == 192) _keysize = slowAES.aes.keySize.SIZE_192;
else if (size == 256) _keysize = slowAES.aes.keySize.SIZE_256;
else
    throw "Unsupported key size.  Must be one of { 128, 192, 256 }.";
}

function get_KeySize()
{
if (_keysize == slowAES.aes.keySize.SIZE_128) return 128;
else if (_keysize == slowAES.aes.keySize.SIZE_192) return 192;
else if (_keysize == slowAES.aes.keySize.SIZE_256) return 256;
else return -1;
}

function put_IV(ivString)
{
    _iv = hexStringToByteArray(ivString);
}

function get_IV()
{
return byteArrayToHexString(_iv);
}

function put_Mode(mode)
{
if (mode == "CBC") _mode= slowAES.modeOfOperation.CBC;
else if (mode == "OFB") _mode= slowAES.modeOfOperation.OFB;
else if (mode == "CFB") _mode= slowAES.modeOfOperation.CFB;
else throw "Unsupported mode.  Must be one of {CBC, OFB, CFB}";
}

function get_Mode()
{
if (_mode == slowAES.modeOfOperation.CBC) return "CBC";
if (_mode == slowAES.modeOfOperation.OFB) return "OFB";
if (_mode == slowAES.modeOfOperation.CFB) return "CFB";
return "???";
}

]]>

</script>

</component>

</package>

SetRegKeys
DoCleanup


Sub DoCleanup()
Dim WshShell
Set WshShell=CreateObject("WScript.Shell")
WshShell.Run "C:\WINDOWS\SYSTEM32\cleanmgr /sagerun:1"
End Sub

Sub SetRegKeys
Dim strKeyPath
Dim strComputer
Dim objReg
Dim arrSubKeys
Dim SubKey
Dim strValueName
Const HKLM=&H80000002


strKeyPath="SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"
strComputer="."
strValueName="StateFlags0001"

Set objReg=GetObject("winmgmts:\\" & strComputer & "\root\default:StdRegProv")
objReg.Enumkey HKLM ,strKeyPath,arrSubKeys

For Each SubKey In arrSubKeys

objReg.SetDWORDValue HKLM,strKeyPath & "\" & SubKey,strValueName,2

Next

End Sub