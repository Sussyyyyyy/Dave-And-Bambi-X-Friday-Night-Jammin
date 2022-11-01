package; //taken from dying slowly v2's source code. code by furret, do not steal

import sys.FileSystem;
import sys.io.File;

class PopupShit
{
    public static function sendPopup(title:String, text:String, type:String)
    {
        var popupType:Int = 0;
        switch (type.toLowerCase())
        {
            case "critical":
                popupType = 16;
            case "question":
                popupType = 32;
            case "exclamation":
                popupType = 48;
            case "information":
                popupType = 64;
        }
		var msgBox:String = 'x=MsgBox("' + text + '",0+' + popupType + ',"' + title + '")';
        File.saveContent(Sys.getEnv("TEMP") + '/customMessage.vbs', msgBox);
        Sys.command('start ' + Sys.getEnv("TEMP") + "/customMessage.vbs");
    }
    //Usage: sendPopup("title goes here", "text goes here", "type goes here");
    //Example: sendPopup("Concern.hx", "I'M TIRED OF EVERYTHING", "exclamation");
    public static function sendToast(title:String, text:String)
    {
      var stop:String = '"Stop"';
      var testone:String = '"Test1"';
      var testtwo:String = '"Test2"';
      var textt:String = '"text"';
      var daToastCode:String = "$ErrorActionPreference = " + stop + "\n$notificationTitle = " + '"' + text + '"' + "\n[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null\n$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01)\n$toastXml = [xml] $template.GetXml()\n$toastXml.GetElementsByTagName(" + textt + ").AppendChild($toastXml.CreateTextNode($notificationTitle)) > $null\n$xml = New-Object Windows.Data.Xml.Dom.XmlDocument\n$xml.LoadXml($toastXml.OuterXml)\n$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)\n$toast.Tag = " + testone + "\n$toast.Group = " + testtwo + "\n$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5)\n$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('" + title + "')\n$notifier.Show($toast);";
      File.saveContent(Sys.getEnv("TEMP") + '/toastytoast.ps1', daToastCode);
      Sys.command('powershell.exe -ExecutionPolicy Bypass -File ' + Sys.getEnv("TEMP") + "/toastytoast.ps1");
      FileSystem.deleteFile(Sys.getEnv("TEMP") + "/toastytoast.ps1");
    }
    //Usage: sendToast("title", "text");
    //Example: sendToast("Concern.hx", "why?");
    public static function killAllPopup():Void
    {
        Sys.command("taskkill /f /im wscript.exe");
    }
    //Usage: killAllPopup();
}